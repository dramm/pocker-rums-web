/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.registration;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.mysql.jdbc.*;
import java.util.Date;
/**
 *
 * @author vadim
 */
public class RegistDb {
   public boolean SetNewUser(UserBasicInformation u){
         Connection connection;
        try {
            // Название драйвера
            String driverName = "com.mysql.jdbc.Driver";

            Class.forName(driverName);

            // Create a connection to the database
            String serverName = "localhost";
            String mydatabase = "pokerwebdb";
            String url = "jdbc:mysql://localhost:3307/pokerwebdb";
            String username = "root";
            String password = "P0laroid";

            connection = DriverManager.getConnection(url, username, password);
            Statement stmt = connection.createStatement();
            String query="insert into users(login,password,email,surname,name,second_name,tel,register_date,last_login,banned,banned_date,banned_comment,banned_admin_id)"
                  //  + " values('','','','','','','',now(),now(),false,now(),'',0)";
                     + " values('"+u.login+"','"+u.password+"','"+u.email+"','"+u.surname+"','"+u.name+"','','"+u.tel+"',now(),now(),false,now(),'',0)";
            stmt.executeUpdate(query);
      
            connection.close();
        } // end try
        catch (ClassNotFoundException e) {
            e.printStackTrace();
            // Could not find the database driver
        } catch (SQLException e) {
            e.printStackTrace();
            // Could not connect to the database
        }
       return false;
        
    }
}
