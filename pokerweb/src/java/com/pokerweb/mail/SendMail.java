package com.pokerweb.mail;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.apache.log4j.Logger;

public class SendMail {

    private static Logger logger = Logger.getLogger(SendMail.class);

    public  void Send(String to,String MessageText) {
        try {

            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            Session session = Session.getInstance(props);

            Message message = new MimeMessage(session);

            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

            // add a multiple CC addresses
         //   message.setRecipients(Message.RecipientType.CC, InternetAddress.parse("yyyyy@gmail.com,zzzzzz@yahoo.com"));
            
            message.setSubject("Welcome to SergioRio");
            message.setContent(MessageText, "text/html; charset=utf-8");

            Transport transport = session.getTransport("smtp");
            transport.connect("smtp.gmail.com", 587, "dizinor", "");
            transport.sendMessage(message, message.getAllRecipients());
            logger.error("successfully send email");
        } catch (Exception e) {            
            logger.error(e, e);
        }
    }
}