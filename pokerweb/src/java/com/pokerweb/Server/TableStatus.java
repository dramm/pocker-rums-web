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
    public String Start;
    public Table TableOne;
    public Table TableTwo;
    public Table TableThree;
    public int Stage;
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
  Start = "";
    }
    
    public static TableStatus GetInstance(){
        if(instanse == null)
            instanse = new TableStatus();
        return instanse;
    }
    
    public String GetNewData() throws JSONException{
        JSONArray js = new JSONArray();
        if(Start.length() > 0)
            js.put(Start);
            Start = "";
            JSONObject jsO = new JSONObject();
            jsO.append("Timer", Timer);
            js.put(jsO);
          return js.toString();
    }
    
    public void SetPreflop(String data){
        try {
            Stage = 0;
            JSONObject js = new JSONObject(data);
            JSONObject T1 = js.getJSONObject("Table0");
            for(int i = 0; i < 5; i++){
                JSONArray T1Arr = T1.getJSONArray("Player" + String.valueOf(i));
                Hand h = new Hand();
                h.CartOne = T1Arr.getInt(0);
                h.CartTwo = T1Arr.getInt(1);
                h.Factor = T1Arr.getJSONObject(2).getDouble("Factor");
                TableOne.Hands.add(h); 
            }
            
            JSONObject T2 = js.getJSONObject("Table1");
            for(int i = 0; i < 7; i++){
                JSONArray T1Arr = T2.getJSONArray("Player" + String.valueOf(i));
                Hand h = new Hand();
                h.CartOne = T1Arr.getInt(0);
                h.CartTwo = T1Arr.getInt(1);
                h.Factor = T1Arr.getJSONObject(2).getDouble("Factor");
                TableTwo.Hands.add(h); 
            }
            
            JSONObject T3 = js.getJSONObject("Table2");
            for(int i = 0; i < 9; i++){
                JSONArray T1Arr = T3.getJSONArray("Player" + String.valueOf(i));
                Hand h = new Hand();
                h.CartOne = T1Arr.getInt(0);
                h.CartTwo = T1Arr.getInt(1);
                h.Factor = T1Arr.getJSONObject(2).getDouble("Factor");
                TableTwo.Hands.add(h); 
            }
            
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void SetFlop(String data){
        try {
            Stage = 1;
            JSONObject js = new JSONObject(data);
            JSONArray T1 = js.getJSONArray("Table0");
            TableOne.FlopOne = T1.getJSONObject(0).getJSONArray("Bord").getInt(0);
            TableOne.FlopTwo = T1.getJSONObject(0).getJSONArray("Bord").getInt(1);
            TableOne.FlopThree = T1.getJSONObject(0).getJSONArray("Bord").getInt(2);
            for(int i = 0; i < 5; i++)
                TableOne.Hands.get(i).Factor = T1.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Facrot");
            
            JSONArray T2 = js.getJSONArray("Table1");
            TableTwo.FlopOne = T2.getJSONObject(0).getJSONArray("Bord").getInt(0);
            TableTwo.FlopTwo = T2.getJSONObject(0).getJSONArray("Bord").getInt(1);
            TableTwo.FlopThree = T2.getJSONObject(0).getJSONArray("Bord").getInt(2);
            for(int i = 0; i < 7; i++)
                TableTwo.Hands.get(i).Factor = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Facrot");
            
            JSONArray T3 = js.getJSONArray("Table2");
            TableThree.FlopOne = T3.getJSONObject(0).getJSONArray("Bord").getInt(0);
            TableThree.FlopTwo = T3.getJSONObject(0).getJSONArray("Bord").getInt(1);
            TableThree.FlopThree = T3.getJSONObject(0).getJSONArray("Bord").getInt(2);
            for(int i = 0; i < 9; i++)
                TableThree.Hands.get(i).Factor = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Facrot");
            
            
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void SetTern(String data){
        try {
            Stage = 2;
            JSONObject js = new JSONObject(data);
            JSONArray T1 = js.getJSONArray("Table0");
            TableOne.Tern = T1.getJSONObject(0).getJSONArray("Bord").getInt(3);
            for(int i = 0; i < 5; i++)
                TableOne.Hands.get(i).Factor = T1.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Facrot");
            
            JSONArray T2 = js.getJSONArray("Table1");
            TableTwo.Tern = T2.getJSONObject(0).getJSONArray("Bord").getInt(3);
            for(int i = 0; i < 7; i++)
                TableTwo.Hands.get(i).Factor = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Facrot");
            
            JSONArray T3 = js.getJSONArray("Table2");
            TableThree.Tern = T3.getJSONObject(0).getJSONArray("Bord").getInt(3);
            for(int i = 0; i < 9; i++)
                TableThree.Hands.get(i).Factor = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Facrot");
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void SetRiver(String data){
      try {
          Stage = 3;
          JSONObject js = new JSONObject(data);
          JSONArray T1 = js.getJSONArray("Table0");
          TableOne.River = T1.getJSONObject(0).getJSONArray("Bord").getInt(4);
          for(int i = 0; i < 5; i++)
              TableOne.Hands.get(i).Factor = T1.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Facrot");
            
          JSONArray T2 = js.getJSONArray("Table1");
          TableTwo.River = T2.getJSONObject(0).getJSONArray("Bord").getInt(4);
          for(int i = 0; i < 7; i++)
              TableTwo.Hands.get(i).Factor = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Facrot");
            
          JSONArray T3 = js.getJSONArray("Table2");
          TableThree.River = T3.getJSONObject(0).getJSONArray("Bord").getInt(4);
          for(int i = 0; i < 9; i++)
              TableThree.Hands.get(i).Factor = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Facrot");
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void Start(String data){
        Start = data;
        Timer = 20;        
    }
}
