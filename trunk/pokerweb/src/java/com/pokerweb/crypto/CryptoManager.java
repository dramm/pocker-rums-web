/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.crypto;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vadim
 */
public class CryptoManager {
    public static byte[] key = {(byte)0x89, (byte)0xC5, (byte)0xAF, (byte)0xF4, (byte)0x12, (byte)0x6D};
    public static String GetEnctyptPassword(String pass){
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(pass.getBytes());
            byte byteData[] = md.digest();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(CryptoManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static byte[] encode(byte[] message){
        byte[] result = new byte[message.length];
        for (int i = 0; i < message.length; i++)
            result[i] = (byte)(message[i] ^ key[i % key.length]);
        return result;
}
    
    public static String GetDectyptPassword(String pass,String Date){
    return null;
    }
}
