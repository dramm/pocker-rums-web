package com.pokerweb.mail;

import com.pokerweb.Config.ConfigManager;
import com.pokerweb.Config.FieldMail;
import com.pokerweb.DB.DBManager;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.apache.log4j.Logger;

public class SendMail {
    private static Logger logger = Logger.getLogger(SendMail.class);
    private Properties props;
    private Message message;
    private Session session;
    private Transport transport;
    private static SendMail instanse=new SendMail();
    private SendMail(){
        try {
            props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            session = Session.getInstance(props);
            message = new MimeMessage(session);
            transport = session.getTransport("smtp");
            
            FieldMail FieldM;
            FieldM = new ConfigManager().GetPropMail();
            
            transport.connect(FieldM.server,FieldM.port,FieldM.login,FieldM.password);
        } catch (NoSuchProviderException ex) {
            java.util.logging.Logger.getLogger(SendMail.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            java.util.logging.Logger.getLogger(SendMail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static SendMail GetInstance(){
        return instanse;
    }
   
    public  boolean SendOneAddress(String to,String MessageText,String Subject) {
        try {
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            Send(MessageText, Subject);
            return true;
        } catch (MessagingException ex) {
            java.util.logging.Logger.getLogger(SendMail.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public  boolean SendMultipleAddress(List<String> MailList,String MessageText,String Subject) {
        try {
            InternetAddress[] address = new InternetAddress[MailList.size()];
            for(int i = 0; i < MailList.size(); i++){
                address[i] = new InternetAddress(MailList.toArray()[i].toString());
            }
            
            message.setRecipients(Message.RecipientType.CC,address);
            Send(MessageText, Subject);
            return true;
        } catch (MessagingException ex) {
            java.util.logging.Logger.getLogger(SendMail.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    private boolean Send(String MessageText,String Subject){
        try {
            message.setSubject(Subject);
            message.setContent(MessageText, "text/html; charset=utf-8");
            transport.sendMessage(message, message.getAllRecipients());
            logger.error("successfully send email");
            return true;
        } catch (MessagingException ex) {
            java.util.logging.Logger.getLogger(SendMail.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
}
}