/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.DB;

import com.pokerweb.Config.ConfigManager;
import com.pokerweb.Config.FieldJdbc;
import com.pokerweb.crypto.CryptoManager;
import com.pokerweb.mail.SendConfirmRegistMessage;
import com.pokerweb.mail.SendConfirmSettingMessage;
import com.pokerweb.registration.UserBasicInformation;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
/**
 *
 * @author vadim
 */
public class DBManager{
    private PreparedStatement stmt;
    private Connection connection;
    private static DBManager instanse=new DBManager();
    private DBManager(){
        try {
            FieldJdbc FieldJ; 
            FieldJ=new  ConfigManager().GetPropJdbc();
            
            String driverName = "com.mysql.jdbc.Driver";
            Class.forName(driverName);
            String url = "jdbc:mysql://"+FieldJ.serverName+":"+FieldJ.port+"/"+FieldJ.database;
            connection = DriverManager.getConnection(url, FieldJ.username, FieldJ.password);
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static DBManager GetInstance(){
        return instanse;
    }
    
    
    public ResultSet GetUserAutorizationInfo(){
            String query="select login,password,role_id from users,user_roles where activated=true and user_id=id";
        try {
            stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery(query);
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    
    }
    
    public String GetCurrentUserLogin(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if(auth == null)
            return null;
        return auth.getName();
    }
    
    public int GetCurrentUserId(){
        try {
            String query="select id from users where login=?";
            stmt = connection.prepareStatement(query);
            String name = GetCurrentUserLogin();
            if(name == null)
                return 0;
            stmt.setString(1, name);
            ResultSet rs = stmt.executeQuery();
            if(!rs.first())
                return 0;
            return rs.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    } 
    
    
    public ResultSet GetAllPaySys(){
        try {
            String query="select title from pay_sys";
            stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public boolean SendConfirmNewSettingsCurrUser(){
        try {
            UUID uuid = UUID.randomUUID();
              String Login = GetCurrentUserLogin();
              String query="insert into token_user("
                       + "id_user,"
                       + "token_confirm,"
                       + "type_confirm,"
                       + "date_request,"
                       + "date_response,"
                       + "confirmed) "
                       + "values((select id from users where login=?),'"
                       +uuid.toString()+"',2,now(),now(),false)";
               stmt = connection.prepareStatement(query);
               stmt.setString(1, Login);
               stmt.executeUpdate();
               SendConfirmSettingMessage SendCSM = new SendConfirmSettingMessage();
               ResultSet rs = GetCurrentUserAllInfo();
               rs.first();
               String Mail = rs.getString("email");
               SendCSM.SetMail(Mail);
               SendCSM.SetToken(uuid.toString());
               Thread myT = new Thread(SendCSM);
               myT.start();
               return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public ResultSet GetPaymentInfoCurrentUser(){
        try {
            int idUser = GetCurrentUserId();
            if(idUser == 0)
                return null;
            String query="select passport,pay_sys,score from pokerwebdb.payment_info where id_user=?";
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, idUser);
            ResultSet rs = stmt.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public boolean NewTempSettingsCurrentUser(){
        try {
            String Login = GetCurrentUserLogin();
            int Id = GetIdFromLogin(Login);
            String query="insert into new_user_info("
                              + "id_user,"
                              + "new_mail,"
                              + "mail_editing,"
                              + "new_password,"
                              + "password_editing,"
                              + "new_phone,"
                              + "phone_editing,"
                              + "new_passport,"
                              + "passport_editing,"
                              + "new_pay_sys,"
                              + "pay_sys_editing,"
                              + "new_num_pay_sys,"
                              + "num_pay_sys_editing"
                              + ") values(?,'',false,'',false,'',false,'',false,0,false,'',false) ";
                stmt = connection.prepareStatement(query);
                stmt.setInt(1, Id);
                stmt.executeUpdate();
                return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean ExistsNewSettingsCurUser(int Id){
        try {
            String query="select * from new_user_info where id_user=?";
                    stmt = connection.prepareStatement(query);
                    stmt.setInt(1, Id);
                   ResultSet rs = stmt.executeQuery();
                      if(!rs.first())
                          return false;
                      else
                          return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean UpdateCurrentUserTempInfoScore(String Score){
        try {
            ResultSet rs = GetPaymentInfoCurrentUser();
            String OldScore = rs.getString("score");
            if(Score.equals(OldScore))
                return true;
            String Login = GetCurrentUserLogin();
            int Id = GetIdFromLogin(Login);
            if(!ExistsNewSettingsCurUser(Id))
                  NewTempSettingsCurrentUser();
              
             String query="UPDATE new_user_info SET new_num_pay_sys=?,num_pay_sys_editing=true WHERE id_user=?";
             stmt = connection.prepareStatement(query);
             stmt.setString(1, Score);
             stmt.setInt(2, Id);
              return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean UpdateCurrentUserTempInfoPaySys(int PaySys){
        try {
            ResultSet rs = GetPaymentInfoCurrentUser();
            int OldPaySys = rs.getInt("pay_sys");
            if(PaySys == OldPaySys)
                return true;
            String Login = GetCurrentUserLogin();
            int Id = GetIdFromLogin(Login);
            if(!ExistsNewSettingsCurUser(Id))
                  NewTempSettingsCurrentUser();
              
             String query="UPDATE new_user_info SET new_pay_sys=?,pay_sys_editing=true WHERE id_user=?";
              stmt = connection.prepareStatement(query);
              stmt.setInt(1, PaySys);
              stmt.setInt(2, Id);
              return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean UpdateCurrentUserTempInfoPassport(String Passport){
        try {
            ResultSet rs = GetPaymentInfoCurrentUser();
            String OldPassport = rs.getString("passport");
            if(Passport.equals(OldPassport))
                return true;
            String Login = GetCurrentUserLogin();
            int Id = GetIdFromLogin(Login);
            if(!ExistsNewSettingsCurUser(Id))
                  NewTempSettingsCurrentUser();
              
             String query="UPDATE new_user_info SET new_passport=?,passport_editing=true WHERE id_user=?";
              stmt = connection.prepareStatement(query);
              stmt.setString(1, Passport);
              stmt.setInt(2, Id);
              return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean UpdateCurrentUserTempInfoPhone(String Phone){
        try {
            ResultSet rs = GetCurrentUserAllInfo();
            String OldPhone = rs.getString("tel");
            if(Phone.equals(OldPhone))
                return true;
            String Login = GetCurrentUserLogin();
            int Id = GetIdFromLogin(Login);
            if(!ExistsNewSettingsCurUser(Id))
                  NewTempSettingsCurrentUser();
              
             String query="UPDATE new_user_info SET new_phone=?,phone_editing=true WHERE id_user=?";
              stmt = connection.prepareStatement(query);
              stmt.setString(1, Phone);
              stmt.setInt(2, Id);
              return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean UpdateCurrentUserTempInfoPassword(String Password){
        try {
            ResultSet rs = GetCurrentUserAllInfo();
            String OldPass = rs.getString("password");
            String EncodePass = CryptoManager.GetEnctyptPassword(Password, "");
            if(EncodePass.equals(OldPass))
                return true;
            String Login = GetCurrentUserLogin();
            int Id = GetIdFromLogin(Login);
           if(!ExistsNewSettingsCurUser(Id))
                  NewTempSettingsCurrentUser();
              
             String query="UPDATE new_user_info SET new_password=?,password_editing=true WHERE id_user=?";
              stmt = connection.prepareStatement(query);
              stmt.setString(1, EncodePass);
              stmt.setInt(2, Id);
              return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean UpdateCurrentUserTempInfoMail(String Mail){
        try {
            ResultSet rs = GetCurrentUserAllInfo();
            rs.first();
            String OldMail = rs.getString("email");
            if(Mail.equals(OldMail))
                return true;
            String Login = GetCurrentUserLogin();
            int Id = GetIdFromLogin(Login);
            if(!ExistsNewSettingsCurUser(Id))
                  NewTempSettingsCurrentUser();
              
             String query="UPDATE new_user_info SET new_mail=?,mail_editing=true WHERE id_user=?";
              stmt = connection.prepareStatement(query);
              stmt.setString(1, Mail);
              stmt.setInt(2, Id);
              stmt.executeUpdate();
              return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public ResultSet GetCurrentUserAllInfo(){
        String query="select "
                + "name,"
                + "surname,"
                + "second_name,"
                + "country,"
                + "balance,"
                + "email,"
                + "tel,"
                + "password"
                + " from users where login=?";
        try {
            stmt = connection.prepareStatement(query);
            String name = GetCurrentUserLogin();
            if(name == null)
                return null;
            stmt.setString(1, name);
            ResultSet rs = stmt.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    
    }
    
    public boolean UserExists(String login){
     String query="select * from users where login=?";
        try {
            stmt = connection.prepareStatement(query);
            stmt.setString(1, login);
            ResultSet rs = stmt.executeQuery();
            if(rs.first())                                  
                return true;
            else
                return false;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean UpdateUserInfoAreaT1(String Name, String Surname, String Second_name, String Country){
        try {
            String query="UPDATE users SET name=?,surname=?,second_name=?,country=? WHERE login=?";
            String login = GetCurrentUserLogin();
            if(login == null)
                return false;
            stmt = connection.prepareStatement(query);
               stmt.setString(1, Name);
               stmt.setString(2, Surname);
               stmt.setString(3, Second_name);
               stmt.setString(4, Country);
               stmt.setString(5, login);
               stmt.executeUpdate();
             return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean SetNewUser(UserBasicInformation ubi){
        try {
            String query="insert into users("
                    + "login,"
                    + "password,"
                    + "email,"
                    + "surname,"
                    + "name,"
                    + "second_name,"
                    + "country,"
                    + "tel,"
                    + "register_date,"
                    + "last_login,"
                    + "balance,"
                    + "banned,"
                    + "banned_date,"
                    + "banned_comment,"
                    + "banned_admin_id,"
                    + "activated)" +
                    "values(?,?,?,?,?,'','',?,"
                    + "now(),"
                    + "'1999-01-01 00:00:00',"
                    + "0.0,"
                    + "false,"
                    + "'1999-01-01 00:00:00',"
                    + "'',"
                    + "0,"
                    + "false);";
          //  java.util.Date dt = new java.util.Date();
          //  java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
          //  String currentTime = sdf.format(dt);
            stmt = connection.prepareStatement(query);
            String EncoderS = CryptoManager.GetEnctyptPassword(ubi.password, "");
            stmt.setString(1, ubi.login);
            stmt.setString(2, EncoderS);
            stmt.setString(3, ubi.email);
            stmt.setString(4, ubi.surname);
            stmt.setString(5, ubi.name);
            stmt.setString(6, ubi.tel);
            stmt.executeUpdate();
            
            query="insert into user_roles("
                    + "role_id,user_id)"
                    + " values(3,(select id from users where login=?))";
            stmt = connection.prepareStatement(query);
            stmt.setString(1, ubi.login);
            stmt.executeUpdate();
            
            UUID uuid = UUID.randomUUID();
            
            query="insert into token_user("
                    + "id_user,"
                    + "token_confirm,"
                    + "type_confirm,"
                    + "date_request,"
                    + "date_response,"
                    + "confirmed) "
                    + "values((select id from users where login=?),'"
                    +uuid.toString()+"',1,now(),now(),false)";
            stmt = connection.prepareStatement(query);
            stmt.setString(1, ubi.login);
            stmt.executeUpdate();
            
            query="insert into payment_info(id_user,passport,pay_sys,score) "
                    + "values((select id from users where login=?),'',1,score)";
            stmt = connection.prepareStatement(query);
            stmt.setString(1, ubi.login);
            stmt.executeUpdate();
            
            SendConfirmRegistMessage sm=new SendConfirmRegistMessage();
            sm.SetMail(ubi.email);
            sm.SetToken(uuid.toString());
            Thread myT = new Thread(sm);
            myT.start();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        return false;
        }
    }
    
    
    public boolean ConfirmPrivatAreaToken(String token){
        try {
          String query="select id_user from token_user where token_confirm=? and type_confirm=2 and confirmed=false";
          stmt = connection.prepareStatement(query);
          stmt.setString(1, token);
          ResultSet rs = stmt.executeQuery();
          if(!rs.first())
              return false;
         int Id = rs.getInt(1);
         String Login = GetLoginFromId(Id);
         
          query="select "
                  + "new_mail,"
                  + "mail_editing,"
                  + "new_password,"
                  + "password_editing,"
                  + "new_phone,"
                  + "phone_editing,"
                  + "new_passport,"
                  + "passport_editing,"
                  + "new_pay_sys,"
                  + "pay_sys_editing,"
                  + "new_num_pay_sys,"
                  + "num_pay_sys_editing"
                  + " from new_user_info where id_user=?";
          stmt = connection.prepareStatement(query);
          stmt.setInt(1, Id);
          rs = stmt.executeQuery();
          if(!rs.first())
              return false;
          if(rs.getBoolean(2))
              SetUserNewMail(rs.getString(1),Login);
          if(rs.getBoolean(4))
              SetUserNewPassword(rs.getString(3), Login);
          if(rs.getBoolean(6))
              SetUserNewPassword(rs.getString(3), Login);
          if(rs.getBoolean(8))
              SetUserNewPassport(rs.getString(7), Id);
          if(rs.getBoolean(10))
              SetUserNewPaySys(rs.getString(9), Id);
          if(rs.getBoolean(12))
              SetUserNewScore(rs.getString(11), Id);
         
          query="Delete from new_user_info WHERE id_user=?";
          stmt = connection.prepareStatement(query);
          stmt.setInt(1, Id);
          stmt.executeUpdate();
        return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean SetUserNewScore(String Score,int Id){
        try {
            String query="UPDATE payment_info SET score=? WHERE id_user=?";
                    stmt = connection.prepareStatement(query);
                    stmt.setString(1, Score);
                    stmt.setInt(2, Id);
                    stmt.executeUpdate();
                    return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
     public boolean SetUserNewPaySys(String PaySys,int Id){
        try {
            String query="UPDATE payment_info SET pay_sys=? WHERE id_user=?";
                    stmt = connection.prepareStatement(query);
                    stmt.setString(1, PaySys);
                    stmt.setInt(2, Id);
                    stmt.executeUpdate();
                    return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
     public boolean SetUserNewPassport(String Passport,int Id){
        try {
            String query="UPDATE payment_info SET passport=? WHERE id_user=?";
                    stmt = connection.prepareStatement(query);
                    stmt.setString(1, Passport);
                    stmt.setInt(2, Id);
                    stmt.executeUpdate();
                    return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
     public boolean SetUserNewPhone(String Phone,String Login){
        try {
            String query="UPDATE users SET tel=? WHERE login=?";
                    stmt = connection.prepareStatement(query);
                    stmt.setString(1, Phone);
                    stmt.setString(2, Login);
                    stmt.executeUpdate();
                    return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
     public boolean SetUserNewPassword(String Password,String Login){
        try {
            String query="UPDATE users SET password=? WHERE login=?";
                    stmt = connection.prepareStatement(query);
                    stmt.setString(1, Password);
                    stmt.setString(2, Login);
                    stmt.executeUpdate();
                    return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean SetUserNewMail(String Mail,String Login){
        try {
            String query="UPDATE users SET email=? WHERE login=?";
                    stmt = connection.prepareStatement(query);
                    stmt.setString(1, Mail);
                    stmt.setString(2, Login);
                    stmt.executeUpdate();
                    return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
  
    public boolean ConfirmRegistToken(String token){
        try {
          String query="(select id_user from token_user where token_confirm=? and type_confirm=1 and confirmed=false)";
          stmt = connection.prepareStatement(query);
          stmt.setString(1, token);
          ResultSet rs = stmt.executeQuery();
          if(!rs.first())
              return false;
          stmt.executeUpdate("UPDATE users SET activated=true WHERE id="+rs.getString(1));
          query="UPDATE token_user SET confirmed=true,date_response=now() WHERE token_confirm=?";
          stmt = connection.prepareStatement(query);
          stmt.setString(1, token);
          stmt.executeUpdate();
        return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        return false;
        }
    }
    
    private String GetLoginFromId(int Id){
        try {
            String query="(select login from users where id=?)";
                 stmt = connection.prepareStatement(query);
                 stmt.setInt(1, Id);
                 ResultSet rs = stmt.executeQuery();
                 if(!rs.first())
                     return null;
                 else
                     return rs.getString("login");
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    private int GetIdFromLogin(String login){
        try {
            String query="(select id from users where login=?)";
                 stmt = connection.prepareStatement(query);
                 stmt.setString(1, login);
                 ResultSet rs = stmt.executeQuery();
                 if(!rs.first())
                     return -1;
                 else
                     return rs.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
    
    public boolean SetStatisticUserLogin(String login,String ipAddress,String userAgent){
        try {
            String query="UPDATE users SET last_login=now() WHERE login=?";
            stmt = connection.prepareStatement(query);
            stmt.setString(1, login);
            stmt.executeUpdate();
            
            query="insert into stat_logins("
                    + "user_id,"
                    + "login_time,"
                    + "logout,"
                    + "ip,"
                    + "user_agent"
                    + ")"
                    + "values("
                    + "?,"
                    + "now(),"
                    + "'1999-01-01 00:00:00',"
                    + "INET_ATON(?),"
                    + "?)";
            int UserId=GetIdFromLogin(login);
            if(UserId<0)
                return false;
            
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, UserId);
            stmt.setString(2, ipAddress);
            stmt.setString(3, userAgent);
            stmt.executeUpdate();
               return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}