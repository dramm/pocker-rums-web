/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Registration;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.mysql.jdbc.*;
/**
 *
 * @author vadim
 */
public class RegistDb {
   public boolean SetNewUser(){
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
          //  System.out.println("is connect to DB" + connection);

            //  String query = "Select * FROM name";
            Statement stmt = connection.createStatement();
            // stmt.executeQuery("insert into user_roles(role_id,user_id) values(10,10)");
            ResultSet rs=stmt.executeQuery("select * from user_roles");
            //ResultSet rs = stmt.executeQuery(query);
      //      while (rs.next()) {
       //         System.out.println(rs.getString(1));
      //      }
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
