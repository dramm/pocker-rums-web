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
    private static TableStatus instanse;
    public boolean NewData;
    public String JsonString;
    public String TableUser;
    public String Table;
    public String Start;
    public int Timer;
    private TableStatus(){
        Timer = 0;
        java.util.Timer timer = new java.util.Timer();
        TimerTask task = new TimerTask() {
            public void run(){
                if(TableStatus.GetInstance().Timer >= 20){
                try {
                   byte[] byteCommand = Functions.intToByteArray(1010);
                   Connect.GetInstance().out.write(byteCommand);
                   Connect.GetInstance().out.flush();
                   TableStatus.GetInstance().Timer = 0;
                } catch (IOException ex) {
                    Connect.GetInstance().NewConnect();
                    Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
                    
                }
            }
                else
                    TableStatus.GetInstance().Timer++;
            }
        };
  timer.schedule( task,0, 1000 );
  Table = "";
  TableUser = "";
  Start = "";
    }
    
    public static TableStatus GetInstance(){
        if(instanse == null)
            instanse = new TableStatus();
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
            JSONObject jsO = new JSONObject();
            jsO.append("Timer", Timer);
            js.put(jsO);
          return js.toString();
    }
    
    public void SetNewUserData(String data){
        TableUser = data;
        Table = "";
        Start = "";
    }
    
    public void Start(String data){
        Start = data;
        Timer = 20;
        Table = "";
        TableUser = "";        
    }
    
    public void SetNewStageData(String data){
                Table = data;
                Start = "";
            }
}
