/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pokerweb.ServerHoldem;

import java.util.TimerTask;

/**
 *
 * @author vadim
 */
public class WatchUserOnline extends TimerTask {
    private UserTable user;
    @Override
    public void run() {
        long lastUserOnline = user.getLastUserOnline();
        long CurrentTime = System.currentTimeMillis();
        if((CurrentTime - lastUserOnline) > 5 * 1000 )
            this.SendServerUserMoved((CurrentTime - lastUserOnline));
    }

    public void setUser(UserTable user) {
        this.user = user;
    }

    public void SendServerUserMoved(long TimeMillils){
        TableStatus.GetInstance().UserMoved(user.getIdUser(), user.getIdTable(), TimeMillils,user.getPositionTable());
    }
    
}
