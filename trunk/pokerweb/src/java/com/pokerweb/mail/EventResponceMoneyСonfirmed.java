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
public class EventResponceMoneyСonfirmed implements Runnable {
    private String Mail;
   @Override
   public void run(){
           SendMail.GetInstance().SendOneAddress(Mail,"Запрос на вывод средств обработан", "SergioRio");
           SendMail.GetInstance().SendOneAddress(Mail,"Запрос на вывод средств обработан", "SergioRio");
    }
   
   public String GetMail(){
       return Mail;
   }
   
   public void SetMail(String Mail){
       this.Mail = Mail;
   }
}
