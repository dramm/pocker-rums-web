/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.DB;

import com.pokerweb.Config.ConfigManager;
import com.pokerweb.Config.FieldJdbc;
import com.pokerweb.crypto.CryptoManager;
import com.pokerweb.mail.SendConfirmMessage;
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
    
    public ResultSet GetPaymentInfoCurrentUser(){
        String query="select passport,pay_sys,score from payment_info where id_user=?";
        try {
            stmt = connection.prepareStatement(query);
            String name = GetCurrentUserLogin();
            if(name == null)
                return null;
            int idUser = GetCurrentUserId();
            if(idUser == 0)
                return null;
            stmt.setInt(1, idUser);
            ResultSet rs = stmt.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
    public boolean UpdatePaymentInfoCurrentUser(String Passport, int Pay_Sys, String Score){
        try {
            String query="UPDATE payment_info SET passport=?,pay_sys=?,score=? WHERE id_user=?";
            int IdUser = GetCurrentUserId();
            if(IdUser == 0)
                return false;
            stmt = connection.prepareStatement(query);
               stmt.setString(1, Passport);
               stmt.setInt(2, Pay_Sys);
               stmt.setString(3, Score);
               stmt.setLong(4, IdUser);
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
                + "tel"
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
                    + "id,"
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
            
            SendConfirmMessage sm=new SendConfirmMessage();
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
  
    public boolean ConfirmRegistToken(String token){
        try {
          String query="(select id from token_user where token_confirm=? and type_confirm=1 and confirmed=false)";
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