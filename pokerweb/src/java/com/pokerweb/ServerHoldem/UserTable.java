/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pokerweb.ServerHoldem;

/**
 *
 * @author vadim
 */
public class UserTable {
    public int CartOne;
    public int CartTwo;
    public boolean Dialer;
    public double UserCash;
    public double UserBet;
    
    public double MinRaise;
    public boolean IsRaise;
    
    public double SumCall;
    public boolean IsCall;
    
    public int TimerFoBet;
    
    public UserTable() {
        CartOne = 0;
        CartTwo = 0;
        Dialer = false;
        MinRaise = 0;
        UserBet = 0;
        UserCash = 0;
    }

    public int getCartOne() {
        return CartOne;
    }

    public int getCartTwo() {
        return CartTwo;
    }

    public double getMinRaise() {
        return MinRaise;
    }

    public double getUserBet() {
        return UserBet;
    }

    public double getUserCash() {
        return UserCash;
    }

    public boolean isDialer() {
        return Dialer;
    }

    public void setCartOne(int CartOne) {
        this.CartOne = CartOne;
    }

    public void setCartTwo(int CartTwo) {
        this.CartTwo = CartTwo;
    }

    public void setDialer(boolean Dialer) {
        this.Dialer = Dialer;
    }

    public void setMinRaise(double MinRaise) {
        this.MinRaise = MinRaise;
    }

    public void setUserBet(double UserBet) {
        this.UserBet = UserBet;
    }

    public void setUserCash(double UserCash) {
        this.UserCash = UserCash;
    }
    
    
    
    
}
