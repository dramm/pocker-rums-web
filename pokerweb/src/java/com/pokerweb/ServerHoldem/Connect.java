/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.ServerHoldem;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author vadim
 */
public final class Connect {
    private static Connect instanse;
    public  OutputStream out;
    Socket socket = null;
    public Connect() {
       NewConnect();
    }
    
    public void NewConnect(){
        try {
            socket = new Socket("148.251.10.241", 7778);
            //while(!socket.isConnected())
            //    socket = new Socket("148.251.10.241", 7778);
            //System.out.println("reconect");
            Listen listen = new Listen();
            listen.setIn(socket.getInputStream());
            listen.start();
            out = new BufferedOutputStream(socket.getOutputStream());
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
