/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Server;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author vadim
 */
public class UserBet {
    public double Sum;
    public Long IdBet;
    public boolean Express;
    public Map<Integer,List<Integer>> TableHand;

    public UserBet() {
        TableHand = new HashMap<Integer,List<Integer>>();
    }
    
    
}
