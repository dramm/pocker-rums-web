/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Server;

import com.pokerweb.DB.DBManager;
import com.pokerweb.crypto.CryptoManager;
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
    private static TableStatus instanse;
    public boolean NewData;
    public String Start;
    public Table TableOne;
    public Table TableTwo;
    public Table TableThree;
    public Map<Long,UserBet> Bets;
    public JSONArray ShutdownInfo = new JSONArray();
    public int Stage;
    public int Timer;
    public long Round;
    public boolean ServerResponce;
    private TableStatus(){
        this.Bets = new HashMap<Long,UserBet>();
        Timer = 0;
        Stage = -1;
        ServerResponce = true;
        java.util.Timer timer = new java.util.Timer();
        TimerTask task = new TimerTask() {
            public void run(){
                byte[] byteCommand = Functions.intToByteArray(1010);
                if(ServerResponce)
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
                        if(TableStatus.GetInstance().Timer >= 2){             
                            Connect.GetInstance().out.write(byteCommand);
                            Connect.GetInstance().out.flush();
                            TableStatus.GetInstance().Timer = 0;
                        }
                        else
                            TableStatus.GetInstance().Timer++;
                        break;
                        
                    case 1:
                        if(TableStatus.GetInstance().Timer >= 42){
                            ServerResponce = false;
                            SendBetsToServer();
                            Connect.GetInstance().out.write(byteCommand);
                            Connect.GetInstance().out.flush();
                            TableStatus.GetInstance().Timer = 0;
                        }
                        else
                            TableStatus.GetInstance().Timer++;
                        break;
                        
                    case 2:
                        if(TableStatus.GetInstance().Timer >= 42){ 
                            ServerResponce = false;
                            SendBetsToServer();
                            Connect.GetInstance().out.write(byteCommand);
                            Connect.GetInstance().out.flush();
                            TableStatus.GetInstance().Timer = 0;
                        }
                        else
                            TableStatus.GetInstance().Timer++;
                        break;
                            
                    case 3:
                        if(TableStatus.GetInstance().Timer >= 42){
                            ServerResponce = false;
                            SendBetsToServer();
                            Connect.GetInstance().out.write(byteCommand);
                            Connect.GetInstance().out.flush();
                            TableStatus.GetInstance().Timer = 0;
                        }
                        else
                            TableStatus.GetInstance().Timer++;
                        break;
                                
                    case 4:
                        if(TableStatus.GetInstance().Timer >= 42){             
                            Connect.GetInstance().out.write(byteCommand);
                            Connect.GetInstance().out.flush();
                            TableStatus.GetInstance().Timer = 0;
                        }
                        else
                            TableStatus.GetInstance().Timer++;
                        break;
                    case 5:{
                        if(TableStatus.GetInstance().Timer >= 42){             
                            Connect.GetInstance().out.write(byteCommand);
                            Connect.GetInstance().out.flush();
                            TableStatus.GetInstance().Timer = 0;
                        }
                        else
                            TableStatus.GetInstance().Timer++;
                    break;
                    }
                        
                        
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
    
    public synchronized static TableStatus GetInstance(){
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
        
        if(StageUser == 4)
            if(Stage == 5)
             jsO.put("Shutdown",ShutdownInfo);
            
        jsO.put("Table0", Table0);
        jsO.put("Table1", Table1);
        jsO.put("Table2", Table2);
        
          return jsO.toString();
    }
    
    
    public void SetPreflop(String data){
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
    
    public void SetShutdown(String data){
        try {
            JSONObject js = new JSONObject(data);
            JSONObject T1 = js.getJSONObject("Table0");
            for(int i=0; i < T1.length(); i++){
                for(int j = 0; j < T1.getJSONArray("Combination"+i).length(); j++){
                    for(int h = 0; h < 4; h++){
                      if(TableOne.Hands.get(h).CartOne == T1.getJSONArray("Combination"+i).getInt(j))
                          ShutdownInfo.put("Table1User"+(h+1)+"Cart1");
                      if(TableOne.Hands.get(h).CartTwo == T1.getJSONArray("Combination"+i).getInt(j))
                          ShutdownInfo.put("Table1User"+(h+1)+"Cart2");
                    }
                    if(TableOne.FlopOne == T1.getJSONArray("Combination"+i).getInt(j))
                        ShutdownInfo.put("Table1Flop1");
                    if(TableOne.FlopTwo == T1.getJSONArray("Combination"+i).getInt(j))
                        ShutdownInfo.put("Table1Flop2");
                    if(TableOne.FlopThree == T1.getJSONArray("Combination"+i).getInt(j))
                        ShutdownInfo.put("Table1Flop3");
                    if(TableOne.Tern == T1.getJSONArray("Combination"+i).getInt(j))
                        ShutdownInfo.put("Table1Tern");
                    if(TableOne.River == T1.getJSONArray("Combination"+i).getInt(j))
                        ShutdownInfo.put("Table1River");
                }
            }
          
            JSONObject T2 = js.getJSONObject("Table1");
            for(int i=0; i < T2.length(); i++){
                for(int j = 0; j < T2.getJSONArray("Combination"+i).length(); j++){
                    for(int h = 0; h < 6; h++){
                      if(TableTwo.Hands.get(h).CartOne == T2.getJSONArray("Combination"+i).getInt(j))
                          ShutdownInfo.put("Table2User"+(h+1)+"Cart1");
                      if(TableTwo.Hands.get(h).CartTwo == T2.getJSONArray("Combination"+i).getInt(j))
                          ShutdownInfo.put("Table2User"+(h+1)+"Cart2");
                    }
                    if(TableTwo.FlopOne == T2.getJSONArray("Combination"+i).getInt(j))
                        ShutdownInfo.put("Table2Flop1");
                    if(TableTwo.FlopTwo == T2.getJSONArray("Combination"+i).getInt(j))
                        ShutdownInfo.put("Table2Flop2");
                    if(TableTwo.FlopThree == T2.getJSONArray("Combination"+i).getInt(j))
                        ShutdownInfo.put("Table2Flop3");
                    if(TableTwo.Tern == T2.getJSONArray("Combination"+i).getInt(j))
                        ShutdownInfo.put("Table2Tern");
                    if(TableTwo.River == T2.getJSONArray("Combination"+i).getInt(j))
                        ShutdownInfo.put("Table2River");
                }
            }
          
            JSONObject T3 = js.getJSONObject("Table2");
            for(int i=0; i < T3.length(); i++){
                for(int j = 0; j < T3.getJSONArray("Combination"+i).length(); j++){
                    for(int h = 0; h < 8; h++){
                      if(TableThree.Hands.get(h).CartOne == T3.getJSONArray("Combination"+i).getInt(j))
                          ShutdownInfo.put("Table3User"+(h+1)+"Cart1");
                      if(TableThree.Hands.get(h).CartTwo == T3.getJSONArray("Combination"+i).getInt(j))
                          ShutdownInfo.put("Table3User"+(h+1)+"Cart2");
                    }
                    if(TableThree.FlopOne == T3.getJSONArray("Combination"+i).getInt(j))
                        ShutdownInfo.put("Table3Flop1");
                    if(TableThree.FlopTwo == T3.getJSONArray("Combination"+i).getInt(j))
                        ShutdownInfo.put("Table3Flop2");
                    if(TableThree.FlopThree == T3.getJSONArray("Combination"+i).getInt(j))
                        ShutdownInfo.put("Table3Flop3");
                    if(TableThree.Tern == T3.getJSONArray("Combination"+i).getInt(j))
                        ShutdownInfo.put("Table3Tern");
                    if(TableThree.River == T3.getJSONArray("Combination"+i).getInt(j))
                        ShutdownInfo.put("Table3River");
                }
            }
          
            Stage = 5;
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void Start(String data){
        try {
            Stage = 0;
            JSONObject js = new JSONObject(data);
            Round = js.getLong("Round");
            ShutdownInfo = new JSONArray();
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public synchronized boolean SetNewBet(JSONArray Table1,
            JSONArray Table2,
            JSONArray Table3,
            double Sum){
        try {
            UserBet bet = new UserBet();
            bet.Sum = Sum;
            List<Integer> hand = new ArrayList<Integer>();
            if(Table1.length() > 0){
                for (int i = 0; i < Table1.length(); i++) 
                    hand.add(Table1.getInt(i));
                bet.TableHand.put(0,hand);
                        }
            if(Table2.length() > 0){
                hand = new ArrayList<Integer>();
                for (int i = 0; i < Table2.length(); i++) 
                    hand.add(Table2.getInt(i));
                bet.TableHand.put(1,hand);
                        }
            if(Table3.length() > 0){
                hand = new ArrayList<Integer>();
                for (int i = 0; i < Table3.length(); i++) 
                    hand.add(Table3.getInt(i));
                bet.TableHand.put(2,hand);
                        }
            Bets.put(DBManager.GetInstance().GetCurrentUserId(), bet);
          
            return true;
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean SendBetsToServer(){
        try {
            JSONArray RootJs = new JSONArray();
            JSONObject UserJs = new JSONObject();
            JSONObject HandJs = new JSONObject();
            if(Bets.isEmpty()){
            Connect.GetInstance().out.write(Functions.intToByteArray(1020));
            Connect.GetInstance().out.write(Functions.intToByteArray("[]".length()));
            Connect.GetInstance().out.write(CryptoManager.encode("[]".getBytes()));
            Connect.GetInstance().out.flush();
            return true;
            }
            for (Map.Entry<Long,UserBet> item : Bets.entrySet()) {
                UserJs = new JSONObject();
                UserJs.put("Id", item.getKey());
                UserJs.put("Sum",item.getValue().Sum);
                for(Map.Entry<Integer,List<Integer>> tables : item.getValue().TableHand.entrySet()){
                    HandJs = new JSONObject();
                    for (Integer hands : tables.getValue()){
                        if (tables.getKey() == 0)
                            HandJs.put(hands.toString(), TableOne.Hands.get(hands).Factor);
                        if (tables.getKey() == 1)
                            HandJs.put(hands.toString(), TableTwo.Hands.get(hands).Factor);
                        if (tables.getKey() == 2)
                            HandJs.put(hands.toString(), TableThree.Hands.get(hands).Factor);
                    }
                    UserJs.put("Table" + tables.getKey().toString(),HandJs);
                }
                RootJs.put(UserJs);
            }
            
            Connect.GetInstance().out.write(Functions.intToByteArray(1020));
            Connect.GetInstance().out.write(Functions.intToByteArray(RootJs.toString().length()));
            Connect.GetInstance().out.write(CryptoManager.encode(RootJs.toString().getBytes()));
            Connect.GetInstance().out.flush();
            
            return true;
        } catch (IOException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
