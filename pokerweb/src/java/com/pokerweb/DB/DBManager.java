/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.DB;

import com.pokerweb.Area.FieldOutMoney;
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
import java.util.ArrayList;
import java.util.List;
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
    private static DBManager instanse = new DBManager();
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
    
    private DBManager CreateNewInstanse(){
        instanse = new DBManager();
        return instanse;
    }
    
    private boolean ConnectIsStable(){
        try {
            String query="select 1";
            stmt = connection.prepareStatement(query);
            stmt.executeQuery(query);
            return true;
        } catch (Exception e) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, e);
        return false;
        }
    }
    
    public int GetCountRequestOutMoneyNoAccepted(){
        try {
            String query="SELECT count(id) as count FROM request_out_money where processed=false";
             stmt = connection.prepareStatement(query);
                ResultSet rs = stmt.executeQuery();
                if(!rs.first())
                    return 0;
                else
                    return rs.getInt("count");
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
   
    
    public boolean AcceptOutMoney(List ArrayId){
        try {
            int IdManager = GetCurrentUserId();
            String query = "Update request_out_money as t1,users as t2 "
                    + "Set t1.balance_to_response=t2.balance,"
                    + "id_manager=? where t1.id=? and t2.id=t1.id_user";
            
            for (int i=0;i< ArrayId.size(); i++) {
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, IdManager);
            stmt.setString(2,ArrayId.get(i).toString());
            stmt.executeUpdate();
            }
            query = " Update users as t1,request_out_money as t4 "
                    + "Set t1.balance = t1.balance-(select sum(sum) "
                    + "from (select * from request_out_money) as t3 "
                    + "where t3.id=? and t3.id_user=t1.id  and "
                    + "processed=false) "
                    + "where t1.id in (select t3.id_user "
                    + "from (select * from request_out_money) as t3"
                    + " where t3.id=? and processed=false) "
                    + "and t4.id_user=t1.id and t4.id=?;";
            for (int i=0;i< ArrayId.size(); i++) {
                stmt = connection.prepareStatement(query);
                stmt.setString(1, ArrayId.get(i).toString());
                stmt.setString(2, ArrayId.get(i).toString());
                stmt.setString(3, ArrayId.get(i).toString());
                stmt.executeUpdate();
            }
            query = "Update request_out_money as t1,users as t2 "
                    + "Set t1.balance_post_response=t2.balance,"
                    + "t1.id_manager=?,t1.processed=true,data_response=now() "
                    + "where t1.id=? and t2.id=t1.id_user";
            
            for (int i=0;i< ArrayId.size(); i++) {
                stmt = connection.prepareStatement(query);
                stmt.setInt(1, IdManager);
                stmt.setString(2,ArrayId.get(i).toString());
                stmt.executeUpdate();
            }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
            
    }
    
    public List<FieldOutMoney> GetRequestOutMoneyNoAccepted(int PageNum,int Range){
        try {
            String query="SELECT login,sum,data_request,balance,t1.id as id FROM request_out_money as t1,users as t2 where t1.id_user=t2.id and t1.processed=false LIMIT ? OFFSET ? ";
            List<FieldOutMoney> LFOM = new ArrayList<FieldOutMoney>();
            FieldOutMoney FOM;
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, Range);
            stmt.setInt(2, PageNum);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                FOM=new FieldOutMoney();
                FOM.Date = rs.getString("data_request");
                FOM.Login = rs.getString("login");
                FOM.Sum = rs.getFloat("sum");
                FOM.Balance = rs.getDouble("balance");
                FOM.Id = rs.getInt("id");
                LFOM.add(FOM);
            }
            return LFOM;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public ResultSet GetUserAccessFromLogin(String Login){
        try {
            String query="select password,role_id from users,user_roles where login=? and activated=true and user_id=id";
            stmt = connection.prepareStatement(query);
            stmt.setString(1, Login);
            ResultSet rs = stmt.executeQuery();
            rs.first();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public static DBManager GetInstance(){
            if(!instanse.ConnectIsStable())
               instanse.CreateNewInstanse();
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
    
    public boolean SetNewDateOnline(){
        try {
            int idUser = GetCurrentUserId();
            if(idUser==0)
                return false;
            String query="Update stat_logins Set logout=now() "
                + "where id=(select id "
                + "from (select * from stat_logins) as t1 "
                + "where t1.user_id=? and "
                + "t1.id=any(select max(id) "
                + "from (select * from stat_logins) as t2 "
                + "where t2.user_id=t1.user_id))";
            stmt = connection.prepareStatement(query);
                   stmt.setInt(1, idUser);
                   stmt.executeUpdate();
                   return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
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
                       +uuid.toString()+"',2,now(),'1999-01-01 00:00:00',false)";
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
            String query="select passport,pay_sys,score from payment_info where id_user=?";
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, idUser);
            ResultSet rs = stmt.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
      
    public boolean ExistsNewSettingsCurUser(int Id){
        try {
            String query="select * from request_edit_user_info where id_user=? and processed=true";
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
            rs.first();
            String OldScore = rs.getString("score");
            if(Score.equals(OldScore))
                return true;
            String Login = GetCurrentUserLogin();
            int Id = GetIdFromLogin(Login);
            String query="INSERT INTO request_edit_user_info("
                     + "id_user,"
                     + "type,"
                     + "date_request,"
                     + "data"
                     + ") "
                     + "values(?,6,now(),?)";
              stmt = connection.prepareStatement(query);
              stmt.setInt(1, Id);
              stmt.setString(2, Score);
              stmt.executeUpdate();
              return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean UpdateCurrentUserTempInfoPaySys(int PaySys){
        try {
            ResultSet rs = GetPaymentInfoCurrentUser();
            rs.first();
            int OldPaySys = rs.getInt("pay_sys");
            if(PaySys == OldPaySys)
                return true;
            String Login = GetCurrentUserLogin();
            int Id = GetIdFromLogin(Login);
            String query="INSERT INTO request_edit_user_info("
                     + "id_user,"
                     + "type,"
                     + "date_request,"
                     + "data"
                     + ") "
                     + "values(?,5,now(),?)";
              stmt = connection.prepareStatement(query);
              stmt.setInt(1, Id);
              stmt.setInt(2, PaySys);
              stmt.executeUpdate();
              return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean UpdateCurrentUserTempInfoPassport(String Passport){
        try {
            ResultSet rs = GetPaymentInfoCurrentUser();
            rs.first();
            String OldPassport = rs.getString("passport");
            if(Passport.equals(OldPassport))
                return true;
            String Login = GetCurrentUserLogin();
            int Id = GetIdFromLogin(Login);
             String query="INSERT INTO request_edit_user_info("
                     + "id_user,"
                     + "type,"
                     + "date_request,"
                     + "data"
                     + ") "
                     + "values(?,4,now(),?)";
              stmt = connection.prepareStatement(query);
              stmt.setInt(1, Id);
              stmt.setString(2, Passport);
              stmt.executeUpdate();
              return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean UpdateCurrentUserTempInfoPhone(String Phone){
        try {
            ResultSet rs = GetCurrentUserAllInfo();
            rs.first();
            String OldPhone = rs.getString("tel");
            if(Phone.equals(OldPhone))
                return true;
            String Login = GetCurrentUserLogin();
            int Id = GetIdFromLogin(Login);
              
           String query="INSERT INTO request_edit_user_info("
                     + "id_user,"
                     + "type,"
                     + "date_request,"
                     + "data"
                     + ") "
                     + "values(?,3,now(),?)";
              stmt = connection.prepareStatement(query);
              stmt.setInt(1, Id);
              stmt.setString(2, Phone);
              stmt.executeUpdate();
              return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean UpdateCurrentUserTempInfoPassword(String Password){
        try {
            ResultSet rs = GetCurrentUserAllInfo();
            rs.first();
            String OldPass = rs.getString("password");
            String EncodePass = CryptoManager.GetEnctyptPassword(Password);
            if(EncodePass.equals(OldPass))
                return true;
            String Login = GetCurrentUserLogin();
            int Id = GetIdFromLogin(Login);
            String query="INSERT INTO request_edit_user_info("
                     + "id_user,"
                     + "type,"
                     + "date_request,"
                     + "data"
                     + ") "
                     + "values(?,2,now(),?)";
              stmt = connection.prepareStatement(query);
              stmt.setInt(1, Id);
              stmt.setString(2, Password);
              stmt.executeUpdate();
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
             String query="INSERT INTO request_edit_user_info("
                     + "id_user,"
                     + "type,"
                     + "date_request,"
                     + "data"
                     + ") "
                     + "values(?,1,now(),?)";
              stmt = connection.prepareStatement(query);
              stmt.setInt(1, Id);
              stmt.setString(2, Mail);
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
                + "password,role_id"
                + " from users,user_roles where login=? and user_id=id";
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
                    + "tel,"
                    + "register_date)" +
                    "values(?,?,?,?,?,?,now());";
          //  java.util.Date dt = new java.util.Date();
          //  java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
          //  String currentTime = sdf.format(dt);
            stmt = connection.prepareStatement(query);
            String EncoderS = CryptoManager.GetEnctyptPassword(ubi.password);
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
                    + "date_request) "
                    + "values((select id from users where login=?),'"
                    +uuid.toString()+"',1,now())";
            stmt = connection.prepareStatement(query);
            stmt.setString(1, ubi.login);
            stmt.executeUpdate();
            
            query="insert into payment_info(id_user,passport,pay_sys,score) "
                    + "values((select id from users where login=?),'',0,'')";
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
         query="select t1.type,t1.data"
                  + " from request_edit_user_info as t1"
                  + " where id_user=? and processed=false and "
                  + "date_request=(select max(t2.date_request) "
                  + "from request_edit_user_info as t2 "
                  + "where t2.type=t1.type and t2.id_user=t1.id_user and t2.processed=false)";
          stmt = connection.prepareStatement(query);
          stmt.setInt(1, Id);
          rs = stmt.executeQuery();
          while(rs.next()){
              switch(rs.getInt("type")){
                  case 1:
                      SetUserNewMail(rs.getString("data"),Login);
                      break;
                  case 2:
                      SetUserNewPassword(rs.getString("data"), Login);
                      break;
                  case 3:
                      SetUserNewPhone(rs.getString("data"), Login);
                      break;
                  case 4:
                      SetUserNewPassport(rs.getString("data"), Id);
                      break;
                  case 5:
                      SetUserNewPaySys(rs.getString("data"), Id);
                      break;
                  case 6:
                      SetUserNewScore(rs.getString("data"), Id);
                      break;
              }
          }
          query="Update request_edit_user_info Set processed=true,date_response=now()"
                  + " where id in (select t1.id "
                  + "from (select * from request_edit_user_info) as t1"
                  + " where t1.id_user=? and t1.processed=false and "
                  + "t1.date_request=(select max(t2.date_request)"
                  + " from (select * from request_edit_user_info) as t2"
                  + " where t2.type=t1.type and t2.id_user=t1.id_user and t2.processed=false));";
          stmt = connection.prepareStatement(query);
          stmt.setInt(1, Id);
          stmt.executeUpdate();
          query="Update token_user Set date_response=now(),confirmed=true WHERE id_user=?";
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
    
    public boolean SetNewRequestOutMoney(double Sum){
        try {
            ResultSet rs = GetCurrentUserAllInfo();
            double BalanceUser = 0;
            if(rs.first())
                   BalanceUser = rs.getDouble("balance");
            String Login = GetCurrentUserLogin();
            int Id = GetIdFromLogin(Login);
            String query="insert into request_out_money("
                    + "id_user,"
                    + "sum,"
                    + "data_request,"
                    + "balance_request) "
                    + "values(?,?,now(),?) ";
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, Id);
            stmt.setDouble(2, Sum);
            stmt.setDouble(3, BalanceUser);
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
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