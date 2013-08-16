/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Server;

import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author vadim
 */
public class TableStatus {
    private static TableStatus instanse = new TableStatus();
    public boolean NewData;
    public String JsonString;
    public String TableUser;
    public String Table;
    public String Start;
    private TableStatus(){
   //     NewData = false;
   //     TableUser = "";
   //     Table = "";
   //     Start = "";
        Start = "";
        java.util.Timer timer2 = new java.util.Timer();
        TimerTask task = new TimerTask() {
            public void run(){
                try {
                    byte[] byteCommand = Functions.intToByteArray(1010);
                   Connect.GetInstance().out.write(byteCommand);
                   Connect.GetInstance().out.flush();
                } catch (IOException ex) {
                    Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
                    //Connect.GetInstance().NewConnect();
                }
            }
        };
  timer2.schedule( task,0, 5000 );
    }
    
    public static TableStatus GetInstance(){
        return instanse;
    }
    
    public String GetNewData() throws JSONException{
        JSONArray js = new JSONArray();
        if(Table.length() > 0)
           js.put(Table);
            if(TableUser.length() > 0)
            js.put(TableUser);
            if(Start.length() > 0)
               js.put(Start);
            Start = "";
          return js.toString();
    }
    
    public void SetNewUserData(String data){
        TableUser = data;
        Table = "";
        Start = "";
    }
    
    public void Start(String data){
        Start = data;
        Table = "";
        TableUser = "";        
    }
    
    public void SetNewStageData(String data){
                Table = data;
                Start = "";
            }
}
