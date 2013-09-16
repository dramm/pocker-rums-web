/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.mail;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vadim
 */
public class NewPassFromMail implements Runnable{
    private String Mail;
    private String Token;
    private String Address;
   @Override
   public void run(){
        try {
            String hostname = InetAddress.getLocalHost().getHostAddress();
           SendMail.GetInstance().SendOneAddress(Mail,
                        "Для подтверждения востановления пароля"+
                        " <a href='http://"+hostname+":8080/?pass-token="+Token+"'>Подтверждение</a>", 
                        "Welcome to SergioRio");
        } catch (UnknownHostException ex) {
            Logger.getLogger(SendConfirmSettingMessage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
   public String GetMail(){
       return Mail;
   }
   
   public void SetMail(String Mail){
       this.Mail = Mail;
   }
   
   public String GetToken(){
       return Token;
   }
   
   public void SetToken(String Token){
       this.Token = Token;
   }
}
