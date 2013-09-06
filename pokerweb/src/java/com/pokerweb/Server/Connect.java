/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Server;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;

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
         socket = new Socket("5.178.85.70", 7777);
         while(!socket.isConnected())
         socket = new Socket("5.178.85.70", 7777);
         Listen listen = new Listen();
         listen.setIn(socket.getInputStream());
         listen.start();
         out = new BufferedOutputStream(socket.getOutputStream());
         byte[] byteCommand = Functions.intToByteArray(1000);
         out.write(byteCommand);
         out.flush();
        } catch (UnknownHostException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static Connect GetInstance(){
        if(instanse == null){
            instanse = new Connect();
        }
        return instanse;
    }
    
}
