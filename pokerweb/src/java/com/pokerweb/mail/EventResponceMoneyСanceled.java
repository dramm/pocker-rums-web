/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.mail;

/**
 *
 * @author vadim
 */
public class EventResponceMoneyСanceled extends Thread {
  private String Mail;
  private String Comment;
   @Override
   public void run(){
           SendMail.GetInstance().SendOneAddress(Mail,"Запрос на вывод средств отклонен с коментарием-"+Comment, 
                        "SergioRio");
    }

    public String getComment() {
        return Comment;
    }

    public void setComment(String Comment) {
        this.Comment = Comment;
    }
   
   public String GetMail(){
       return Mail;
   }
   
   public void SetMail(String Mail){
       this.Mail = Mail;
   }   
}
