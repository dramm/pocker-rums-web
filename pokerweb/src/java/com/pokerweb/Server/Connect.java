/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Server;

import com.pokerweb.Config.ConfigManager;
import com.pokerweb.Config.FieldJdbc;
import com.pokerweb.crypto.CryptoManager;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author vadim
 */
public class Connect {
    private static Connect instanse;
    public  OutputStream out;
    Socket socket = null;
    public Connect() {
       NewConnect();
    }
    public void NewConnect(){
     try {
         socket = new Socket("5.9.82.164", 7777);
         while(!socket.isConnected())
         socket = new Socket("5.9.82.164", 7777);
         Listen listen = new Listen();
         listen.setIn(socket.getInputStream());
         listen.start();
         out = new BufferedOutputStream(socket.getOutputStream());
         JSONObject js = new JSONObject();
         Connection connection = null;
        PreparedStatement stmt = null;
        FieldJdbc FieldJ; 
            FieldJ = new ConfigManager().GetPropJdbc();
            String driverName = "com.mysql.jdbc.Driver";
            Class.forName(driverName);
            String url = "jdbc:mysql://"+FieldJ.serverName+":"+FieldJ.port+"/"+FieldJ.database;
            connection = DriverManager.getConnection(url, FieldJ.username, FieldJ.password);
            String query="select sum(balance) as summ from users;";
               stmt = connection.prepareStatement(query);
               ResultSet rs = stmt.executeQuery();
               rs.first();
            JSONArray jsA = new JSONArray();
         js.put("summ", rs.getDouble("summ"));
         stmt.close();
         connection.close();
         out.write(Functions.intToByteArray(1050));
        out.write(Functions.intToByteArray(js.toString().length()));
         out.write(CryptoManager.encode(js.toString().getBytes()));
         out.flush();
         byte[] byteCommand = Functions.intToByteArray(1000);
         out.write(byteCommand);
         out.flush();
        } catch (UnknownHostException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
            instanse = new Connect();
        } catch (IOException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
            instanse = new Connect();
        } catch (JSONException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
            instanse = new Connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
            instanse = new Connect();
        } catch (SQLException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
            instanse = new Connect();
        }
    }
    
    public static Connect GetInstance(){
        if(instanse == null){
            instanse = new Connect();
        }
        return instanse;
    }
    
}
