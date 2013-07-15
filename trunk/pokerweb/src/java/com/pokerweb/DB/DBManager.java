/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.DB;

import com.pokerweb.mail.SendMail;
import com.pokerweb.registration.UserBasicInformation;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vadim
 */
public class DBManager {
    private Statement stmt;
    public DBManager(){
        Connection connection;
        try {
                      
//            XPath xpath = XPathFactory.newInstance().newXPath();
//            InputSource inputSource = new InputSource("ConfigProp.xml");
//            try{
//            serverName = xpath.evaluate("//jdbc/serverName", inputSource);
//            mydatabase = xpath.evaluate("//jdbc/database", inputSource);
//            port=xpath.evaluate("//jdbc/port", inputSource);
//            username = xpath.evaluate("//jdbc/username", inputSource);
//            password = xpath.evaluate("//jdbc/password", inputSource);
//            }catch(XPathExpressionException e){}
// 
            
            
            String driverName = "com.mysql.jdbc.Driver";

            Class.forName(driverName);
            String serverName = "localhost";
            String mydatabase = "pokerwebdb";
            String port = "3307";
            String username = "root";
            String password = "P0laroid";
            String url = "jdbc:mysql://"+serverName+":"+port+"/"+mydatabase;
            connection = DriverManager.getConnection(url, username, password);
            stmt = connection.createStatement();
            }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
            // Could not find the database driver
        } catch (SQLException e) {
            e.printStackTrace();
            // Could not connect to the database
        }
    }
    
    public ResultSet GetUserAutorizationInfo(){
            String query="select login,password from users where activated=true";
        try {
            ResultSet rs= stmt.executeQuery(query);
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
                    "values("
                    + "'"+ubi.login+"',"
                    + "'"+ubi.password+"',"
                    + "'"+ubi.email+"',"
                    + "'"+ubi.surname+"',"
                    + "'"+ubi.name+"',"
                    + "'',"
                    + "'"+ubi.tel+"',"
                    + "now(),"
                    + "now(),"
                    + "false,"
                    + "now(),"
                    + "'',"
                    + "0,"
                    + "false);";
            try {
                stmt.executeUpdate(query);
            } catch (SQLException ex) {
                Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
                return false;
            }
            query="insert into user_roles("
                    + "role_id,user_id)"
                    + " values(3,(select id from users where login='"+ubi.login+"'))";
            stmt.executeUpdate(query);
            SendMail sm=new SendMail();
            UUID uuid = UUID.randomUUID();
            stmt.executeUpdate("insert into reg_token_user("
                    + "id,"
                    + "reg_token_confirm) "
                    + "values((select id from users where login='"+ubi.login+"'),'"
                    +uuid.toString()+"')");
           sm.Send(ubi.email, "Для подтверждения регистрации перейдите по ссылке"+
                   "<a href='http://localhost:8080/ConfirmRegist?token="+uuid.toString()+"'>Подтверждение</a>");
        return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        return false;
        }
    }
    
    public boolean ConfirmRegistToken(String token){
        try {
           ResultSet rs=stmt.executeQuery("(select id from reg_token_user where reg_token_confirm='"+token+"')");
           rs.first();
           stmt.executeUpdate("UPDATE users SET activated=true WHERE id="+rs.getString(1));
        return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        return false;
        }
    }
    
    
}
