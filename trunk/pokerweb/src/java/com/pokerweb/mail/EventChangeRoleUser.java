/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.mail;

/**
 *
 * @author vadim
 */
public class EventChangeRoleUser implements Runnable {
    private String Mail;
   @Override
   public void run(){
           SendMail.GetInstance().SendOneAddress(Mail,"У вас изменена роль на Пользователь", 
                        "SergioRio");
      
    }
   
   public String GetMail(){
       return Mail;
   }
   
   public void SetMail(String Mail){
       this.Mail = Mail;
   }
}
