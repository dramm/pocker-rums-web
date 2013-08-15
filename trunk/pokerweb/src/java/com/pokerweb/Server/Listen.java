/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Server;

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
    public static byte[] key = {(byte)0x89, (byte)0xC5, (byte)0xAF, (byte)0xF4, (byte)0x12, (byte)0x6D};
    @Override
    public void run(){
        int flag = 1;
        try {
        while (flag > 0 ) {
            byte[] bytes = new byte[4];
            
                flag = in.read(bytes, 0, 4);
                int command = Functions.byteArrayToInt(bytes);
                switch (command) {
                    case 1500:{
                        flag = in.read(bytes, 0, 4);
                        byte[] message = new byte[Functions.byteArrayToInt(bytes)];
                        flag = in.read(message, 0, message.length);
                        String mess = new String(message);
                       // TableStatus.GetInstance().NewData = true;
                        TableStatus.GetInstance().SetNewUserData(mess);
                    break;
                    }
                        case 1510:{
                        flag = in.read(bytes, 0, 4);
                        byte[] message = new byte[Functions.byteArrayToInt(bytes)];
                        flag = in.read(message, 0, message.length);
                        String mess = new String(message);
                        TableStatus.GetInstance().SetNewStageData(mess);
                    break;
                    }
                            
                    default:{
                        flag = in.read(bytes, 0, 4);
                        byte[] message = new byte[Functions.byteArrayToInt(bytes)];
                        flag = in.read(message, 0, message.length);
                        String mess = new String(message);
                        TableStatus.GetInstance().JsonString = mess;
                        break;    
                    }
                }
        }
        } catch (IOException ex) {
                Logger.getLogger(Listen.class.getName()).log(Level.SEVERE, null, ex);
                
            }
    }
    
    public static byte[] encode(byte[] message){
        byte[] result = new byte[message.length];
        for (int i = 0; i < message.length; i++) {
            result[i] = (byte)(message[i] ^ key[i % key.length]);
        }
        return result;
}
    
    public InputStream getIn() {
        return in;
    }

    public void setIn(InputStream in) {
        this.in = new BufferedInputStream(in);
    }
    
}

