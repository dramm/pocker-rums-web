/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Server;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author vadim
 */
public class UserBet {
    public double Sum;
    public Map<Integer,Map<Integer,Double>> TableHand;

    public UserBet() {
        TableHand = new HashMap<Integer,Map<Integer,Double>>();
    }
    
    
}
