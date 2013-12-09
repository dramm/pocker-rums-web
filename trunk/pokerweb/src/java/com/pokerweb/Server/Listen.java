/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Server;

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
                    case 1500:{
                        flag = in.read(bytes, 0, 4);
                        byte[] message = new byte[Functions.byteArrayToInt(bytes)];
                        flag = in.read(message, 0, message.length);
                        String mess = new String(CryptoManager.encode(message));
                        TableStatus.GetInstance().Start(mess);
                    break;
                    }
                    case 1510:{
                        flag = in.read(bytes, 0, 4);
                        byte[] message = new byte[Functions.byteArrayToInt(bytes)];
                        flag = in.read(message, 0, message.length);
                        String mess = new String(CryptoManager.encode(message));
                        TableStatus.GetInstance().SetPreflop(mess);
                    break;
                    }
                    case 1520:{
                        flag = in.read(bytes, 0, 4);
                        byte[] message = new byte[Functions.byteArrayToInt(bytes)];
                        flag = in.read(message, 0, message.length);
                        String mess = new String(CryptoManager.encode(message));
                        TableStatus.GetInstance().SetFlop(mess);
                    break;
                    }
                    case 1530:{
                        flag = in.read(bytes, 0, 4);
                        byte[] message = new byte[Functions.byteArrayToInt(bytes)];
                        flag = in.read(message, 0, message.length);
                        String mess = new String(CryptoManager.encode(message));
                        TableStatus.GetInstance().SetTern(mess);
                    break;
                    }
                    case 1540:{
                        flag = in.read(bytes, 0, 4);
                        byte[] message = new byte[Functions.byteArrayToInt(bytes)];
                        flag = in.read(message, 0, message.length);
                        String mess = new String(CryptoManager.encode(message));
                        TableStatus.GetInstance().SetRiver(mess);
                        break;
                    }
                    case 1550:{
                        flag = in.read(bytes, 0, 4);
                        byte[] message = new byte[Functions.byteArrayToInt(bytes)];
                        flag = in.read(message, 0, message.length);
                        String mess = new String(CryptoManager.encode(message));
                        TableStatus.GetInstance().SetShutdown(mess);
                        break;
                    }
                        case 1560:{//Готов принимать
                         TableStatus.GetInstance().ServerResponce = true;
                        break;
                    }
                            case 1570:{//1030 Запрос статистики
                                flag = in.read(bytes, 0, 4);
                                byte[] message = new byte[Functions.byteArrayToInt(bytes)];
                                flag = in.read(message, 0, message.length);
                                String mess = new String(CryptoManager.encode(message));
                                TableStatus.GetInstance().SetResponceCurrentUserBet(mess);
                                break;
                    }
                            case 1580:{//1030 Запрос статистики
                                flag = in.read(bytes, 0, 4);
                                byte[] message = new byte[Functions.byteArrayToInt(bytes)];
                                flag = in.read(message, 0, message.length);
                                String mess = new String(CryptoManager.encode(message));
                                TableStatus.GetInstance().ResponceCasinoBalanceFromServer(mess);
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

