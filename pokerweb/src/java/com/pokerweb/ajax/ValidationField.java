/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.ajax;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author vadim
 */
public class ValidationField {
    
    public static boolean ValidEmail(String Mail){
        Pattern pattern;
        Matcher matcher;    
        String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        pattern = Pattern.compile(EMAIL_PATTERN);
        matcher = pattern.matcher(Mail);
        return matcher.matches();
    }
    
    public static boolean ValidEmailConf(String Mail, String MailConf){
         
        return Mail.equals(MailConf);
    }
    
     public static boolean ValidLogin(String Login){
         
        return Login.length() > 0;
    }
    
    public static boolean ValidPassword(String Pass){
        return Pass.length() > 0;
    }
    
    public static boolean ValidConfPassword(String Pass,String ConfPass){
        return Pass.equals(ConfPass);
    }
    
    public static boolean ValidName(String Name){
        return Name.length() > 0;
    }
    
    public static boolean ValidSurname(String Surname){
        return Surname.length() > 0;
    }
    
    public static boolean ValidPhone(String Phone){
        return Phone.length() > 0;
    }
    
    public static boolean ValidConfPhone(String Phone,String ConfPhone){
        return Phone.equals(ConfPhone);
    }
    
    public static boolean ValidSecond(String Second_name){
        return Second_name.length() > 0;
    }
    
    public static boolean ValidCountry(String Country){
        return Country.length() > 0;
    }
    
    
    
}
