/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.DB;

import com.pokerweb.Config.ConfigManager;
import com.pokerweb.Config.FieldJdbc;
import com.pokerweb.crypto.CryptoManager;
import com.pokerweb.mail.SendConfirmMessage;
import com.pokerweb.mail.SendMail;
import com.pokerweb.registration.UserBasicInformation;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
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
            String query="select login,password,register_date from users where activated=true";
        try {
            stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery(query);
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
            if(rs.first())                                  //что-то тут не так
                return true;
            else
                return false;
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
                    + "tel,"
                    + "register_date,"
                    + "last_login,"
                    + "banned,"
                    + "banned_date,"
                    + "banned_comment,"
                    + "banned_admin_id,"
                    + "activated)" +
                    "values(?,?,?,?,?,'',?,"
                    + "now(),"
                    + "now(),"
                    + "false,"
                    + "now(),"
                    + "'',"
                    + "0,"
                    + "false);";
          //  java.util.Date dt = new java.util.Date();
          //  java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
          //  String currentTime = sdf.format(dt);
            stmt = connection.prepareStatement(query);
            String EncoderS = CryptoManager.GetEnctyptPassword(ubi.password, "");//currentTime);
            stmt.setString(1, ubi.login);
            stmt.setString(2, EncoderS);
            stmt.setString(3, ubi.email);
            stmt.setString(4, ubi.surname);
            stmt.setString(5, ubi.name);
            stmt.setString(6, ubi.tel);
            //stmt.setString(7, currentTime);
            stmt.executeUpdate();
            
            query="insert into user_roles("
                    + "role_id,user_id)"
                    + " values(3,(select id from users where login=?))";
            stmt = connection.prepareStatement(query);
            stmt.setString(1, ubi.login);
            stmt.executeUpdate();
            
            
            UUID uuid = UUID.randomUUID();
            
            query="insert into reg_token_user("
                    + "id,"
                    + "reg_token_confirm) "
                    + "values((select id from users where login=?),'"
                    +uuid.toString()+"')";
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
          String query="(select id from reg_token_user where reg_token_confirm=?)";
          stmt = connection.prepareStatement(query);
          stmt.setString(1, token);
          ResultSet rs = stmt.executeQuery();
           rs.first();
           stmt.executeUpdate("UPDATE users SET activated=true WHERE id="+rs.getString(1));
        return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        return false;
        }
    }
}
