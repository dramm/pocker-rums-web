/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.mail;

/**
 *
 * @author vadim
 */
public class SendConfirmMessage implements Runnable{
    private String Mail;
    private String Token;
   @Override
   public void run(){
      SendMail.GetInstance().SendOneAddress(Mail,
                   "Для подтверждения регистрации перейдите по ссылке"+
                   " <a href='http://localhost:8080/?confirm-reg="+Token+"'>Подтверждение</a>",
                   "Welcome to SergioRio"); 
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
