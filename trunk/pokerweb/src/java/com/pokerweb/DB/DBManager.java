/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.DB;

import com.pokerweb.Config.ConfigManager;
import com.pokerweb.Config.FieldJdbc;
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
public class DBManager {
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
            String query="select login,password from users where activated=true";
        try {
            ResultSet rs = stmt.executeQuery(query);
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    
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
            stmt = connection.prepareStatement(query);
            stmt.setString(1, ubi.login);
            stmt.setString(2, ubi.password);
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
            
            SendMail sm=new SendMail();
            UUID uuid = UUID.randomUUID();
            
            query="insert into reg_token_user("
                    + "id,"
                    + "reg_token_confirm) "
                    + "values((select id from users where login=?),'"
                    +uuid.toString()+"')";
            stmt = connection.prepareStatement(query);
            stmt.setString(1, ubi.login);
            stmt.executeUpdate();
            
           sm.SendOneAddress(ubi.email,
                   "Для подтверждения регистрации перейдите по ссылке"+
                   " <a href='http://localhost:8080/ConfirmRegist?token="+uuid.toString()+"'>Подтверждение</a>",
                   "Welcome to SergioRio");
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
