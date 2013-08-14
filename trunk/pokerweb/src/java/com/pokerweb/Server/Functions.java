/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Server;

import java.nio.ByteBuffer;

/**
 *
 * @author vadim
 */
public class Functions {
    public static int byteArrayToInt( byte [] bytes){
        ByteBuffer bbuf = ByteBuffer.wrap(bytes);
        return bbuf.getInt();
    }
    public static byte[] intToByteArray(int value){
        ByteBuffer bbuf = ByteBuffer.allocate(4);
        bbuf.putInt(value);
        return bbuf.array();
    }
}
