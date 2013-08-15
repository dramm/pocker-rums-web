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
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vadim
 */
public class Connect {
    private static Connect instanse;
    public OutputStream out;
    Socket socket;
    public Connect() {
        try {
            socket = new Socket("ec2-23-22-104-241.compute-1.amazonaws.com", 7777);
            Listen listen = new Listen();
            listen.setIn(socket.getInputStream());
            listen.start();
            out = new BufferedOutputStream(socket.getOutputStream());
            byte[] byteCommand = Functions.intToByteArray(1000);
            out.write(byteCommand);
            out.flush();
            out = new BufferedOutputStream(socket.getOutputStream());
            byteCommand = Functions.intToByteArray(1010);
            out.write(byteCommand);
            out.flush();
          
        } catch (UnknownHostException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }
    
    public static Connect GetInstance(){
        if(instanse == null)
        instanse = new Connect();
        return instanse;
    }
    
}
