/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Server;

import com.pokerweb.DB.DBManager;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    private static TableStatus instanse;// = new TableStatus();
    public boolean NewData;
    public String JsonString;
    public String Start;
    public Table TableOne;
    public Table TableTwo;
    public Table TableThree;
    public Map<String,UserBet> Bets;
    public int Stage;
    public int Timer;
    public long Round;
    private TableStatus(){
        this.Bets = new HashMap<String,UserBet>();
        Timer = 0;
        Stage = -1;
        java.util.Timer timer = new java.util.Timer();
        TimerTask task = new TimerTask() {
            public void run(){
                byte[] byteCommand = Functions.intToByteArray(1010);
                try{
                switch(Stage){
                    case -1:
                        if(TableStatus.GetInstance().Timer == 2){ 
                        Connect.GetInstance().out.write(byteCommand);
                        Connect.GetInstance().out.flush();
                        TableStatus.GetInstance().Timer = 0;
                        }
                        else
                            TableStatus.GetInstance().Timer++;
                        break;
                   
                    case 0:
                        if(TableStatus.GetInstance().Timer == 2){             
                            Connect.GetInstance().out.write(byteCommand);
                            Connect.GetInstance().out.flush();
                            TableStatus.GetInstance().Timer = 0;
                        }
                        else
                            TableStatus.GetInstance().Timer++;
                        break;
                        
                    case 1:
                        if(TableStatus.GetInstance().Timer == 40){             
                            Connect.GetInstance().out.write(byteCommand);
                            Connect.GetInstance().out.flush();
                            TableStatus.GetInstance().Timer = 0;
                        }
                        else
                            TableStatus.GetInstance().Timer++;
                        break;
                        
                    case 2:
                        if(TableStatus.GetInstance().Timer == 40){             
                            Connect.GetInstance().out.write(byteCommand);
                            Connect.GetInstance().out.flush();
                            TableStatus.GetInstance().Timer = 0;
                        }
                        else
                            TableStatus.GetInstance().Timer++;
                        break;
                            
                    case 3:
                        if(TableStatus.GetInstance().Timer == 40){             
                            Connect.GetInstance().out.write(byteCommand);
                            Connect.GetInstance().out.flush();
                            TableStatus.GetInstance().Timer = 0;
                        }
                        else
                            TableStatus.GetInstance().Timer++;
                        break;
                                
                    case 4:
                        if(TableStatus.GetInstance().Timer == 20){             
                            Connect.GetInstance().out.write(byteCommand);
                            Connect.GetInstance().out.flush();
                            TableStatus.GetInstance().Timer = 0;
                        }
                        else
                            TableStatus.GetInstance().Timer++;
                        break;
                        
                }
                } catch (IOException ex) {
                    Connect.GetInstance().NewConnect();
                    Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
                    
                }
                            }
        };
  timer.schedule( task,0, 1000 );
  Start = "";
        Stage = -1;
  if(TableOne == null)
      TableOne = new Table();
  if(TableTwo == null)
      TableTwo = new Table();
  if(TableThree == null)
      TableThree = new Table();
  if(TableOne.Hands == null)
      TableOne.Hands = new ArrayList<Hand>();
  if(TableOne.Hands.isEmpty())
      for(int i = 0; i < 4; i++){
          Hand h = new Hand();
          TableOne.Hands.add(h); 
      }
  if(TableTwo.Hands == null)
      TableTwo.Hands = new ArrayList<Hand>();
  
  if(TableTwo.Hands.isEmpty())          
      for(int i = 0; i < 6; i++){
          Hand h = new Hand();
          TableTwo.Hands.add(h); 
      }
 
  if(TableThree.Hands == null)
      TableThree.Hands = new ArrayList<Hand>();
  if(TableThree.Hands.isEmpty()) 
      for(int i = 0; i < 8; i++){
          Hand h = new Hand();
          TableThree.Hands.add(h); 
      }
    }
    
    public static TableStatus GetInstance(){
        if(instanse == null)
            instanse = new TableStatus();
        return instanse;
    }
    
    public String GetNewData(int StageUser) throws JSONException{
        JSONObject jsO = new JSONObject();
        jsO.append("Timer", Timer);
        jsO.append("Stage", Stage);
        JSONObject Table0 = new JSONObject();
        JSONObject Table1 = new JSONObject();
        JSONObject Table2 = new JSONObject();
        if(StageUser == -1 || StageUser == 4){
            if(Stage >= 0)
                jsO.append("Round", Round);
            if(Stage >= 1 && StageUser != 4){
            for(int i = 0; i < 4; i++){
                    Table0.append("User"+String.valueOf(i),TableOne.Hands.get(i).CartOne);
                    Table0.append("User"+String.valueOf(i),TableOne.Hands.get(i).CartTwo);
                    Table0.append("User"+String.valueOf(i),TableOne.Hands.get(i).Factor);
                    Table0.append("User"+String.valueOf(i),TableOne.Hands.get(i).Indicator);
                }
                
                for(int i = 0; i < 6; i++){
                    Table1.append("User"+String.valueOf(i),TableTwo.Hands.get(i).CartOne);
                    Table1.append("User"+String.valueOf(i),TableTwo.Hands.get(i).CartTwo);
                    Table1.append("User"+String.valueOf(i),TableTwo.Hands.get(i).Factor);
                    Table1.append("User"+String.valueOf(i),TableTwo.Hands.get(i).Indicator);
                }
                
                for(int i = 0; i < 8; i++){
                    Table2.append("User"+String.valueOf(i),TableThree.Hands.get(i).CartOne);
                    Table2.append("User"+String.valueOf(i),TableThree.Hands.get(i).CartTwo);
                    Table2.append("User"+String.valueOf(i),TableThree.Hands.get(i).Factor);
                    Table2.append("User"+String.valueOf(i),TableThree.Hands.get(i).Indicator);
                }
            }
            if(Stage >= 2 && StageUser != 4){
                Table0.append("Bord",TableOne.FlopOne);
                Table0.append("Bord",TableOne.FlopTwo);
                Table0.append("Bord",TableOne.FlopThree);
               
                Table1.append("Bord",TableTwo.FlopOne);
                Table1.append("Bord",TableTwo.FlopTwo);
                Table1.append("Bord",TableTwo.FlopThree);
                
                Table2.append("Bord",TableThree.FlopOne);
                Table2.append("Bord",TableThree.FlopTwo);
                Table2.append("Bord",TableThree.FlopThree);
            }
            if(Stage >= 3 && StageUser != 4){
                Table0.append("Bord",TableOne.Tern);
                Table1.append("Bord",TableTwo.Tern);
                Table2.append("Bord",TableThree.Tern);
            }
            if(Stage == 4 && StageUser != 4){
                Table0.append("Bord",TableOne.River);
                Table1.append("Bord",TableTwo.River);
                Table2.append("Bord",TableThree.River);
            }
        }
        
        
        if(StageUser == 0){
            if(Stage >= 1){
                for(int i = 0; i < 4; i++){
                    Table0.append("User"+String.valueOf(i),TableOne.Hands.get(i).CartOne);
                    Table0.append("User"+String.valueOf(i),TableOne.Hands.get(i).CartTwo);
                    Table0.append("User"+String.valueOf(i),TableOne.Hands.get(i).Factor);
                    Table0.append("User"+String.valueOf(i),TableOne.Hands.get(i).Indicator);
                }
                
                for(int i = 0; i < 6; i++){
                    Table1.append("User"+String.valueOf(i),TableTwo.Hands.get(i).CartOne);
                    Table1.append("User"+String.valueOf(i),TableTwo.Hands.get(i).CartTwo);
                    Table1.append("User"+String.valueOf(i),TableTwo.Hands.get(i).Factor);
                    Table1.append("User"+String.valueOf(i),TableTwo.Hands.get(i).Indicator);
                }
                
                for(int i = 0; i < 8; i++){
                    Table2.append("User"+String.valueOf(i),TableThree.Hands.get(i).CartOne);
                    Table2.append("User"+String.valueOf(i),TableThree.Hands.get(i).CartTwo);
                    Table2.append("User"+String.valueOf(i),TableThree.Hands.get(i).Factor);
                    Table2.append("User"+String.valueOf(i),TableThree.Hands.get(i).Indicator);
                }
            }
            if(Stage >= 2){
                Table0.append("Bord",TableOne.FlopOne);
                Table0.append("Bord",TableOne.FlopTwo);
                Table0.append("Bord",TableOne.FlopThree);
               
                Table1.append("Bord",TableTwo.FlopOne);
                Table1.append("Bord",TableTwo.FlopTwo);
                Table1.append("Bord",TableTwo.FlopThree);
                
                Table2.append("Bord",TableThree.FlopOne);
                Table2.append("Bord",TableThree.FlopTwo);
                Table2.append("Bord",TableThree.FlopThree);
            }
            if(Stage >= 3){
                Table0.append("Bord",TableOne.Tern);
                Table1.append("Bord",TableTwo.Tern);
                Table2.append("Bord",TableThree.Tern);
            }
            if(Stage == 4){
                Table0.append("Bord",TableOne.River);
                Table1.append("Bord",TableTwo.River);
                Table2.append("Bord",TableThree.River);
            }
        }
        if(StageUser == 1){
            if(Stage >= 2){
                Table0.append("Bord",TableOne.FlopOne);
                Table0.append("Bord",TableOne.FlopTwo);
                Table0.append("Bord",TableOne.FlopThree);
               
                Table1.append("Bord",TableTwo.FlopOne);
                Table1.append("Bord",TableTwo.FlopTwo);
                Table1.append("Bord",TableTwo.FlopThree);
                
                Table2.append("Bord",TableThree.FlopOne);
                Table2.append("Bord",TableThree.FlopTwo);
                Table2.append("Bord",TableThree.FlopThree);
                
                for(int i = 0; i < 4; i++){
                    Table0.append("User"+String.valueOf(i),TableOne.Hands.get(i).Factor);
                    Table0.append("User"+String.valueOf(i),TableOne.Hands.get(i).Indicator);
                }
                for(int i = 0; i < 6; i++){
                    Table1.append("User"+String.valueOf(i),TableTwo.Hands.get(i).Factor);
                    Table1.append("User"+String.valueOf(i),TableTwo.Hands.get(i).Indicator);
                }
                
                for(int i = 0; i < 8; i++){
                    Table2.append("User"+String.valueOf(i),TableThree.Hands.get(i).Factor);
                    Table2.append("User"+String.valueOf(i),TableThree.Hands.get(i).Indicator);
                }
            }
            if(Stage >= 3){
                Table0.append("Bord",TableOne.Tern);
                Table1.append("Bord",TableTwo.Tern);
                Table2.append("Bord",TableThree.Tern);
            }
            if(Stage == 4){
                Table0.append("Bord",TableOne.River);
                Table1.append("Bord",TableTwo.River);
                Table2.append("Bord",TableThree.River);
            }
        }
        
        if(StageUser == 2){
            if(Stage >= 3){
                Table0.append("Bord",TableOne.Tern);
               
                Table1.append("Bord",TableTwo.Tern);
                
                Table2.append("Bord",TableThree.Tern);
                for(int i = 0; i < 4; i++){
                    Table0.append("User"+String.valueOf(i),TableOne.Hands.get(i).Factor);
                    Table0.append("User"+String.valueOf(i),TableOne.Hands.get(i).Indicator);
                }
                for(int i = 0; i < 6; i++){
                    Table1.append("User"+String.valueOf(i),TableTwo.Hands.get(i).Factor);
                    Table1.append("User"+String.valueOf(i),TableTwo.Hands.get(i).Indicator);
                }
                
                for(int i = 0; i < 8; i++){
                    Table2.append("User"+String.valueOf(i),TableThree.Hands.get(i).Factor);
                    Table2.append("User"+String.valueOf(i),TableThree.Hands.get(i).Indicator);
                }
            }
            if(Stage == 4){
                Table0.append("Bord",TableOne.River);
                Table1.append("Bord",TableTwo.River);
                Table2.append("Bord",TableThree.River);
            }
        }
        
        if(StageUser == 3){
            if(Stage == 4){
                Table0.append("Bord",TableOne.River);
               
                Table1.append("Bord",TableTwo.River);
                
                Table2.append("Bord",TableThree.River);
                
                for(int i = 0; i < 4; i++){
                    Table0.append("User"+String.valueOf(i),TableOne.Hands.get(i).Factor);
                    Table0.append("User"+String.valueOf(i),TableOne.Hands.get(i).Indicator);
                }
                for(int i = 0; i < 6; i++){
                    Table1.append("User"+String.valueOf(i),TableTwo.Hands.get(i).Factor);
                    Table1.append("User"+String.valueOf(i),TableTwo.Hands.get(i).Indicator);
                }
                
                for(int i = 0; i < 8; i++){
                    Table2.append("User"+String.valueOf(i),TableThree.Hands.get(i).Factor);
                    Table2.append("User"+String.valueOf(i),TableThree.Hands.get(i).Indicator);
                }
            }
        }
        
        if(StageUser == 4){
            if(Stage == 5){
             //shutdown
            }
        }
            
        jsO.put("Table0", Table0);
        jsO.put("Table1", Table1);
        jsO.put("Table2", Table2);
        
          return jsO.toString();
    }
    
    
    public void SetPreflop(String data){
        JsonString = data;
        try {
            
            JSONObject js = new JSONObject(data);
            JSONObject T1 = js.getJSONObject("Table0");
            for(int i = 0; i < 4; i++){
                JSONArray T1Arr = T1.getJSONArray("Player" + String.valueOf(i));
                TableOne.Hands.get(i).CartOne = T1Arr.getInt(0);
                TableOne.Hands.get(i).CartTwo = T1Arr.getInt(1);
                TableOne.Hands.get(i).Factor = T1Arr.getJSONObject(2).getDouble("Factor");
                TableOne.Hands.get(i).Indicator = T1Arr.getJSONObject(2).getInt("Indicator");
            }
            
            JSONObject T2 = js.getJSONObject("Table1");
            for(int i = 0; i < 6; i++){
                JSONArray T1Arr = T2.getJSONArray("Player" + String.valueOf(i));
                TableTwo.Hands.get(i).CartOne = T1Arr.getInt(0);
                TableTwo.Hands.get(i).CartTwo = T1Arr.getInt(1);
                TableTwo.Hands.get(i).Factor = T1Arr.getJSONObject(2).getDouble("Factor");
                TableTwo.Hands.get(i).Indicator= T1Arr.getJSONObject(2).getInt("Indicator");
            }
            
            JSONObject T3 = js.getJSONObject("Table2");
            for(int i = 0; i < 8; i++){
                JSONArray T1Arr = T3.getJSONArray("Player" + String.valueOf(i));
                TableThree.Hands.get(i).CartOne = T1Arr.getInt(0);
                TableThree.Hands.get(i).CartTwo = T1Arr.getInt(1);
                TableThree.Hands.get(i).Factor = T1Arr.getJSONObject(2).getDouble("Factor");
                TableThree.Hands.get(i).Indicator = T1Arr.getJSONObject(2).getInt("Indicator");
            }
            Stage = 1;
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void SetFlop(String data){
        JsonString = data;
        try {
           
            JSONObject js = new JSONObject(data);
            JSONArray T1 = js.getJSONArray("Table0");
            TableOne.FlopOne = T1.getJSONObject(0).getJSONArray("Bord").getInt(0);
            TableOne.FlopTwo = T1.getJSONObject(0).getJSONArray("Bord").getInt(1);
            TableOne.FlopThree = T1.getJSONObject(0).getJSONArray("Bord").getInt(2);
            for(int i = 0; i < 4; i++){
                TableOne.Hands.get(i).Factor = T1.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
                TableOne.Hands.get(i).Indicator = T1.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
            
            }
            JSONArray T2 = js.getJSONArray("Table1");
            TableTwo.FlopOne = T2.getJSONObject(0).getJSONArray("Bord").getInt(0);
            TableTwo.FlopTwo = T2.getJSONObject(0).getJSONArray("Bord").getInt(1);
            TableTwo.FlopThree = T2.getJSONObject(0).getJSONArray("Bord").getInt(2);
            for(int i = 0; i < 6; i++){
                TableTwo.Hands.get(i).Factor = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
                TableTwo.Hands.get(i).Indicator = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
            }
            JSONArray T3 = js.getJSONArray("Table2");
            TableThree.FlopOne = T3.getJSONObject(0).getJSONArray("Bord").getInt(0);
            TableThree.FlopTwo = T3.getJSONObject(0).getJSONArray("Bord").getInt(1);
            TableThree.FlopThree = T3.getJSONObject(0).getJSONArray("Bord").getInt(2);
            for(int i = 0; i < 8; i++){
                TableThree.Hands.get(i).Factor = T3.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
                TableThree.Hands.get(i).Indicator = T3.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
            }
            Stage = 2; 
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void SetTern(String data){
        JsonString = data;
        try {
           
            JSONObject js = new JSONObject(data);
            JSONArray T1 = js.getJSONArray("Table0");
            TableOne.Tern = T1.getJSONObject(0).getJSONArray("Bord").getInt(3);
            for(int i = 0; i < 4; i++){
                TableOne.Hands.get(i).Factor = T1.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
                TableOne.Hands.get(i).Indicator = T1.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
            }
            JSONArray T2 = js.getJSONArray("Table1");
            TableTwo.Tern = T2.getJSONObject(0).getJSONArray("Bord").getInt(3);
            for(int i = 0; i < 6; i++){
                TableTwo.Hands.get(i).Factor = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
                TableTwo.Hands.get(i).Indicator = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
            }
            JSONArray T3 = js.getJSONArray("Table2");
            TableThree.Tern = T3.getJSONObject(0).getJSONArray("Bord").getInt(3);
            for(int i = 0; i < 8; i++){
                TableThree.Hands.get(i).Factor = T3.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
                TableThree.Hands.get(i).Indicator = T3.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
            }
             Stage = 3;
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void SetRiver(String data){
      JsonString = data;
        try {
          JSONObject js = new JSONObject(data);
          JSONArray T1 = js.getJSONArray("Table0");
          TableOne.River = T1.getJSONObject(0).getJSONArray("Bord").getInt(4);
          for(int i = 0; i < 4; i++){
              TableOne.Hands.get(i).Factor = T1.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
              TableOne.Hands.get(i).Indicator = T1.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
          }
          
          JSONArray T2 = js.getJSONArray("Table1");
          TableTwo.River = T2.getJSONObject(0).getJSONArray("Bord").getInt(4);
          for(int i = 0; i < 6; i++){
              TableTwo.Hands.get(i).Factor = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
              TableTwo.Hands.get(i).Indicator = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
          }
          JSONArray T3 = js.getJSONArray("Table2");
          TableThree.River = T3.getJSONObject(0).getJSONArray("Bord").getInt(4);
          for(int i = 0; i < 8; i++){
              TableThree.Hands.get(i).Factor = T3.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
              TableThree.Hands.get(i).Indicator = T3.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
          }
          Stage = 4;
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void Start(String data){
        try {
            Stage = 0;
            JSONObject js = new JSONObject(data);
            Round = js.getLong("Round");
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public synchronized boolean SetNetBet(int Table, int Hand,double Sum, boolean isAdd){
        if(isAdd){
            UserBet us = Bets.get(DBManager.GetInstance().GetCurrentUserLogin());
            if(us == null){
                UserBet UserData = new UserBet();
                UserData.Sum = Sum;
                List<Integer> Hands = new ArrayList<Integer>();
                Hands.add(Hand);
                UserData.TableHand.put(Table, Hands);
                Bets.put(DBManager.GetInstance().GetCurrentUserLogin(),UserData);
            }else{
                List<Integer> Hands = us.TableHand.get(Table);
                if(Hands == null)
                    us.TableHand.put(Table, Hands);
                else
                    Hands.add(Hand);
            }
        }
        else{
           UserBet us = Bets.get(DBManager.GetInstance().GetCurrentUserLogin());
           if(us != null){
             List<Integer> Hands = us.TableHand.get(Table);
              if(!Hands.isEmpty())
                  Hands.remove(Hands.indexOf(Hand));
           }
        }
        return true;
    }
}
