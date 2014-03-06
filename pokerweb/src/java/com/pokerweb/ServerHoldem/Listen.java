/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.ServerHoldem;
import com.pokerweb.Server.Functions;
import com.pokerweb.crypto.CryptoManager;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vadim
 */

public class Listen extends Thread {
    private InputStream in = null;
    @Override
    public void run(){
        int flag = 1;
        try {
            while (flag > 0 ) {
                byte[] bytes = new byte[4];
                flag = in.read(bytes, 0, 4);
                int command = Functions.byteArrayToInt(bytes);
                switch (command) {
                    case 101:{
                        flag = in.read(bytes, 0, 4);
                        byte[] message = new byte[Functions.byteArrayToInt(bytes)];
                        flag = in.read(message, 0, message.length);
                        String mess = new String(CryptoManager.encode(message));
                        TableStatus.GetInstance().SetListTable(mess);
                        break;
                    }
                    case 121:{
                        flag = in.read(bytes, 0, 4);
                        byte[] message = new byte[Functions.byteArrayToInt(bytes)];
                        flag = in.read(message, 0, message.length);
                        String mess = new String(CryptoManager.encode(message));
                        TableStatus.GetInstance().SetResponceSitThis(mess);
                        break;
                    }
                    case 141:{
                        flag = in.read(bytes, 0, 4);
                        byte[] message = new byte[Functions.byteArrayToInt(bytes)];
                        flag = in.read(message, 0, message.length);
                        String mess = new String(CryptoManager.encode(message));
                        TableStatus.GetInstance().SetResponceExit(mess);
                        break;
                    }
                     case 151:{
                        flag = in.read(bytes, 0, 4);
                        byte[] message = new byte[Functions.byteArrayToInt(bytes)];
                        flag = in.read(message, 0, message.length);
                        String mess = new String(CryptoManager.encode(message));
                        TableStatus.GetInstance().SetStartStage(mess);
                        break;
                    }
                    default:{
                        break;    
                    }
                }
        }
        } catch (IOException ex) {
                Logger.getLogger(Listen.class.getName()).log(Level.SEVERE, null, ex);
        }
      
    }
     
    public InputStream getIn() {
        return in;
    }

    public void setIn(InputStream in) {
        this.in = new BufferedInputStream(in);
    }
    
}

