/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Server;

import com.pokerweb.DB.DBManager;
import com.pokerweb.DB.DataBalanceServer;
import com.pokerweb.DB.Game;
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
    public Map<Long,List<UserBet>> Bets;
    public Map<Long,Double> WinnUserList;
    public Map<Integer,List<Integer>> ShutdownInfo;
    public Map<Long,JSONObject> StatisticBetCurrentUser;
    public Map<Long,StatisticBet> RequestStatisticBet;
    public DataBalanceServer BalanseServer;
    public int Stage;
    public int Timer;
    public long Round;
    public boolean ServerResponce;
    public JSONArray Winners;
    Game GMData;
    public String strJson;
    private TableStatus(){
        RequestStatisticBet = new HashMap<Long,StatisticBet>();
        StatisticBetCurrentUser = new HashMap<Long, JSONObject>();
        ShutdownInfo = new HashMap<Integer, List<Integer>>();
        strJson = "";
        GMData = new Game();
        this.Bets = new HashMap<Long,List<UserBet>>();
        WinnUserList = new HashMap<Long, Double>();
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
                        if(TableStatus.GetInstance().Timer == 5){
                            Connect.GetInstance().out.write(byteCommand);
                            Connect.GetInstance().out.flush();
                            TableStatus.GetInstance().Timer = 0;
                        }
                        else
                            TableStatus.GetInstance().Timer++;
                        break;
                   
                    case 0:
                        if(TableStatus.GetInstance().Timer >= 5){             
                            Connect.GetInstance().out.write(byteCommand);
                            Connect.GetInstance().out.flush();
                            TableStatus.GetInstance().Timer = 0;
                        }
                        else
                            TableStatus.GetInstance().Timer++;
                        break;
                        
                    case 1:
                        if(TableStatus.GetInstance().Timer >= 42){
                        //    ServerResponce = false;
                            Connect.GetInstance().out.write(byteCommand);
                            Connect.GetInstance().out.flush();
                            TableStatus.GetInstance().Timer = 0;
                        }
                        else{
                            TableStatus.GetInstance().Timer++;
                            if(Timer == 41){
                                SendBetsToServer();
                                Connect.GetInstance().out.write(Functions.intToByteArray(1040));
                                Connect.GetInstance().out.flush();
                            }
                            if(Timer % 2 == 0 && Timer != 42)
                                SendBetsToServer();
                        }
                        break;
                        
                    case 2:
                        if(TableStatus.GetInstance().Timer >= 42){ 
                        //    ServerResponce = false;
                            Connect.GetInstance().out.write(byteCommand);
                            Connect.GetInstance().out.flush();
                            TableStatus.GetInstance().Timer = 0;
                        }
                        else{
                            TableStatus.GetInstance().Timer++;
                            if(Timer == 41){
                                SendBetsToServer();
                                Connect.GetInstance().out.write(Functions.intToByteArray(1040));
                                Connect.GetInstance().out.flush();
                            }
                            if(Timer % 2 == 0 && Timer != 42)
                                SendBetsToServer();
                        }
                        break;
                            
                    case 3:
                        if(TableStatus.GetInstance().Timer >= 42){
                      //      ServerResponce = false;
                            Connect.GetInstance().out.write(byteCommand);
                            Connect.GetInstance().out.flush();
                            TableStatus.GetInstance().Timer = 0;
                        }
                        else{
                            TableStatus.GetInstance().Timer++;
                            if(Timer == 41){
                                SendBetsToServer();
                                Connect.GetInstance().out.write(Functions.intToByteArray(1040));
                                Connect.GetInstance().out.flush();   
                            }
                            if(Timer % 2 == 0 && Timer != 42)
                                SendBetsToServer();
                        }
                        break;
                                
                    case 4:
                        if(TableStatus.GetInstance().Timer >= 2){             
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
  if(GetTableOne() == null)
      TableOne = new Table();
  if(GetTableTwo() == null)
      TableTwo = new Table();
  if(GetTableThree() == null)
      TableThree = new Table();
  if(GetTableOne().Hands == null)
      GetTableOne().Hands = new ArrayList<Hand>();
  if(GetTableOne().Hands.isEmpty())
      for(int i = 0; i < 4; i++){
          Hand h = new Hand();
          GetTableOne().Hands.add(h); 
      }
  if(GetTableTwo().Hands == null)
      GetTableTwo().Hands = new ArrayList<Hand>();
  
  if(GetTableTwo().Hands.isEmpty())          
      for(int i = 0; i < 6; i++){
          Hand h = new Hand();
          GetTableTwo().Hands.add(h); 
      }
 
  if(GetTableThree().Hands == null)
      GetTableThree().Hands = new ArrayList<Hand>();
  if(GetTableThree().Hands.isEmpty()) 
      for(int i = 0; i < 8; i++){
          Hand h = new Hand();
          GetTableThree().Hands.add(h); 
      }
    }
    
    public synchronized static TableStatus GetInstance(){
        if(instanse == null)
            instanse = new TableStatus();
        return instanse;
    }
    
    public synchronized String GetNewData(int StageUser,String Token) throws JSONException{
        JSONObject jsO = new JSONObject();
        jsO.append("Timer", Timer);
        jsO.append("Stage", Stage);
        jsO.append("Source", strJson);
        jsO.append("Round", GetRound());
        jsO.append("Balance", DBManager.GetInstance().GetCurrentUserAllInfo().balance);
        
        jsO.append("Bets", GMData.GetCurrentUserGameStatistic());
        JSONObject Table0 = new JSONObject();
        JSONObject Table1 = new JSONObject();
        JSONObject Table2 = new JSONObject();
        long UserId = DBManager.GetInstance().GetCurrentUserId();
        if(Token != null)
            for (Map.Entry<Long,StatisticBet> statisticBet : RequestStatisticBet.entrySet()) 
               if(statisticBet.getKey() == UserId &&
                       statisticBet.getValue().ToketUserRequest.equals(Token) &&
                       StatisticBetCurrentUser.containsKey(statisticBet.getValue().IdBet)){
                   String data = data = GMData.GetDateFromBet(statisticBet.getValue().IdBet);
                   StatisticBetCurrentUser.get(statisticBet.getValue().IdBet).put("date", data);
                   StatisticBetCurrentUser.get(statisticBet.getValue().IdBet).put("round", GMData.GetRoundFromBet(statisticBet.getValue().IdBet));
                   jsO.put("StatisticCurrentUser", StatisticBetCurrentUser.get(statisticBet.getValue().IdBet));
                   boolean NonRemove = false;
                   for (Map.Entry<Long,StatisticBet> item : RequestStatisticBet.entrySet())
                       if(item.getValue().IdBet == statisticBet.getValue().IdBet && item.getKey() != UserId){
                           NonRemove = true;
                           break;
                       }
                   if(!NonRemove)
                   StatisticBetCurrentUser.remove(statisticBet.getValue().IdBet);
                   RequestStatisticBet.remove(UserId);
                   break;
               }
        
        if(StageUser == -1 || StageUser == 4){
                //jsO.append("Round", Round);
            if(Stage >= 1 && StageUser != 4){
            for(int i = 0; i < 4; i++){
                    Table0.append("User"+String.valueOf(i),GetTableOne().Hands.get(i).CartOne);
                    Table0.append("User"+String.valueOf(i),GetTableOne().Hands.get(i).CartTwo);
                    Table0.append("User"+String.valueOf(i),GetTableOne().Hands.get(i).Factor);
                    Table0.append("User"+String.valueOf(i),GetTableOne().Hands.get(i).Indicator);
                }
                
                for(int i = 0; i < 6; i++){
                    Table1.append("User"+String.valueOf(i),GetTableTwo().Hands.get(i).CartOne);
                    Table1.append("User"+String.valueOf(i),GetTableTwo().Hands.get(i).CartTwo);
                    Table1.append("User"+String.valueOf(i),GetTableTwo().Hands.get(i).Factor);
                    Table1.append("User"+String.valueOf(i),GetTableTwo().Hands.get(i).Indicator);
                }
                
                for(int i = 0; i < 8; i++){
                    Table2.append("User"+String.valueOf(i),GetTableThree().Hands.get(i).CartOne);
                    Table2.append("User"+String.valueOf(i),GetTableThree().Hands.get(i).CartTwo);
                    Table2.append("User"+String.valueOf(i),GetTableThree().Hands.get(i).Factor);
                    Table2.append("User"+String.valueOf(i),GetTableThree().Hands.get(i).Indicator);
                }
            }
            if(Stage >= 2 && StageUser != 4){
                Table0.append("Bord",GetTableOne().FlopOne);
                Table0.append("Bord",GetTableOne().FlopTwo);
                Table0.append("Bord",GetTableOne().FlopThree);
               
                Table1.append("Bord",GetTableTwo().FlopOne);
                Table1.append("Bord",GetTableTwo().FlopTwo);
                Table1.append("Bord",GetTableTwo().FlopThree);
                
                Table2.append("Bord",GetTableThree().FlopOne);
                Table2.append("Bord",GetTableThree().FlopTwo);
                Table2.append("Bord",GetTableThree().FlopThree);
            }
            if(Stage >= 3 && StageUser != 4){
                Table0.append("Bord",GetTableOne().Tern);
                Table1.append("Bord",GetTableTwo().Tern);
                Table2.append("Bord",GetTableThree().Tern);
            }
            if(Stage >= 4 && StageUser != 4){
                Table0.append("Bord",GetTableOne().River);
                Table1.append("Bord",GetTableTwo().River);
                Table2.append("Bord",GetTableThree().River);
            }
            if(Stage == 5){
                JSONArray Wins = new JSONArray();
                for(Map.Entry<Integer,List<Integer>> item: ShutdownInfo.entrySet())
                    for(Integer hands:item.getValue())
                        Wins.put(hands + 1 + (10 * (item.getKey() + 1)));
                jsO.put("Shutdown",Wins);
            }
        }
        
        
        if(StageUser == 0){
            if(Stage >= 1){
                for(int i = 0; i < 4; i++){
                    Table0.append("User"+String.valueOf(i),GetTableOne().Hands.get(i).CartOne);
                    Table0.append("User"+String.valueOf(i),GetTableOne().Hands.get(i).CartTwo);
                    Table0.append("User"+String.valueOf(i),GetTableOne().Hands.get(i).Factor);
                    Table0.append("User"+String.valueOf(i),GetTableOne().Hands.get(i).Indicator);
                }
                
                for(int i = 0; i < 6; i++){
                    Table1.append("User"+String.valueOf(i),GetTableTwo().Hands.get(i).CartOne);
                    Table1.append("User"+String.valueOf(i),GetTableTwo().Hands.get(i).CartTwo);
                    Table1.append("User"+String.valueOf(i),GetTableTwo().Hands.get(i).Factor);
                    Table1.append("User"+String.valueOf(i),GetTableTwo().Hands.get(i).Indicator);
                }
                
                for(int i = 0; i < 8; i++){
                    Table2.append("User"+String.valueOf(i),GetTableThree().Hands.get(i).CartOne);
                    Table2.append("User"+String.valueOf(i),GetTableThree().Hands.get(i).CartTwo);
                    Table2.append("User"+String.valueOf(i),GetTableThree().Hands.get(i).Factor);
                    Table2.append("User"+String.valueOf(i),GetTableThree().Hands.get(i).Indicator);
                }
            }
            if(Stage >= 2){
                Table0.append("Bord",GetTableOne().FlopOne);
                Table0.append("Bord",GetTableOne().FlopTwo);
                Table0.append("Bord",GetTableOne().FlopThree);
               
                Table1.append("Bord",GetTableTwo().FlopOne);
                Table1.append("Bord",GetTableTwo().FlopTwo);
                Table1.append("Bord",GetTableTwo().FlopThree);
                
                Table2.append("Bord",GetTableThree().FlopOne);
                Table2.append("Bord",GetTableThree().FlopTwo);
                Table2.append("Bord",GetTableThree().FlopThree);
            }
            if(Stage >= 3){
                Table0.append("Bord",GetTableOne().Tern);
                Table1.append("Bord",GetTableTwo().Tern);
                Table2.append("Bord",GetTableThree().Tern);
            }
            if(Stage >= 4){
                Table0.append("Bord",GetTableOne().River);
                Table1.append("Bord",GetTableTwo().River);
                Table2.append("Bord",GetTableThree().River);
            }
            if(Stage == 5){
                JSONArray Wins = new JSONArray();
                for(Map.Entry<Integer,List<Integer>> item: ShutdownInfo.entrySet())
                    for(Integer hands:item.getValue())
                        Wins.put(hands + 1 + (10 * (item.getKey() + 1)));
                jsO.put("Shutdown",Wins);
            }
        }
        if(StageUser == 1){
            if(Stage >= 2){
                Table0.append("Bord",GetTableOne().FlopOne);
                Table0.append("Bord",GetTableOne().FlopTwo);
                Table0.append("Bord",GetTableOne().FlopThree);
               
                Table1.append("Bord",GetTableTwo().FlopOne);
                Table1.append("Bord",GetTableTwo().FlopTwo);
                Table1.append("Bord",GetTableTwo().FlopThree);
                
                Table2.append("Bord",GetTableThree().FlopOne);
                Table2.append("Bord",GetTableThree().FlopTwo);
                Table2.append("Bord",GetTableThree().FlopThree);
                
                for(int i = 0; i < 4; i++){
                    Table0.append("User"+String.valueOf(i),GetTableOne().Hands.get(i).Factor);
                    Table0.append("User"+String.valueOf(i),GetTableOne().Hands.get(i).Indicator);
                }
                for(int i = 0; i < 6; i++){
                    Table1.append("User"+String.valueOf(i),GetTableTwo().Hands.get(i).Factor);
                    Table1.append("User"+String.valueOf(i),GetTableTwo().Hands.get(i).Indicator);
                }
                
                for(int i = 0; i < 8; i++){
                    Table2.append("User"+String.valueOf(i),GetTableThree().Hands.get(i).Factor);
                    Table2.append("User"+String.valueOf(i),GetTableThree().Hands.get(i).Indicator);
                }
            }
            if(Stage >= 3){
                Table0.append("Bord",GetTableOne().Tern);
                Table1.append("Bord",GetTableTwo().Tern);
                Table2.append("Bord",GetTableThree().Tern);
            }
            if(Stage >= 4){
                Table0.append("Bord",GetTableOne().River);
                Table1.append("Bord",GetTableTwo().River);
                Table2.append("Bord",GetTableThree().River);
            }
            if(Stage == 5){
                JSONArray Wins = new JSONArray();
                for(Map.Entry<Integer,List<Integer>> item: ShutdownInfo.entrySet())
                    for(Integer hands:item.getValue())
                        Wins.put(hands + 1 + (10 * (item.getKey() + 1)));
                jsO.put("Shutdown",Wins);
            }
        }
        
        if(StageUser == 2){
            if(Stage >= 3){
                Table0.append("Bord",GetTableOne().Tern);
               
                Table1.append("Bord",GetTableTwo().Tern);
                
                Table2.append("Bord",GetTableThree().Tern);
                for(int i = 0; i < 4; i++){
                    Table0.append("User"+String.valueOf(i),GetTableOne().Hands.get(i).Factor);
                    Table0.append("User"+String.valueOf(i),GetTableOne().Hands.get(i).Indicator);
                }
                for(int i = 0; i < 6; i++){
                    Table1.append("User"+String.valueOf(i),GetTableTwo().Hands.get(i).Factor);
                    Table1.append("User"+String.valueOf(i),GetTableTwo().Hands.get(i).Indicator);
                }
                
                for(int i = 0; i < 8; i++){
                    Table2.append("User"+String.valueOf(i),GetTableThree().Hands.get(i).Factor);
                    Table2.append("User"+String.valueOf(i),GetTableThree().Hands.get(i).Indicator);
                }
            }
            if(Stage >= 4){
                Table0.append("Bord",GetTableOne().River);
                Table1.append("Bord",GetTableTwo().River);
                Table2.append("Bord",GetTableThree().River);
            }
           if(Stage == 5){
                JSONArray Wins = new JSONArray();
                for(Map.Entry<Integer,List<Integer>> item: ShutdownInfo.entrySet())
                    for(Integer hands:item.getValue())
                        Wins.put(hands + 1 + (10 * (item.getKey() + 1)));
                jsO.put("Shutdown",Wins);
            }
        }
        
        if(StageUser == 3){
            if(Stage >= 4){
                Table0.append("Bord",GetTableOne().River);
               
                Table1.append("Bord",GetTableTwo().River);
                
                Table2.append("Bord",GetTableThree().River);
                
                for(int i = 0; i < 4; i++){
                    Table0.append("User"+String.valueOf(i),GetTableOne().Hands.get(i).Factor);
                    Table0.append("User"+String.valueOf(i),GetTableOne().Hands.get(i).Indicator);
                }
                for(int i = 0; i < 6; i++){
                    Table1.append("User"+String.valueOf(i),GetTableTwo().Hands.get(i).Factor);
                    Table1.append("User"+String.valueOf(i),GetTableTwo().Hands.get(i).Indicator);
                }
                
                for(int i = 0; i < 8; i++){
                    Table2.append("User"+String.valueOf(i),GetTableThree().Hands.get(i).Factor);
                    Table2.append("User"+String.valueOf(i),GetTableThree().Hands.get(i).Indicator);
                }
            }
            if(Stage == 5){
                JSONArray Wins = new JSONArray();
                for(Map.Entry<Integer,List<Integer>> item: ShutdownInfo.entrySet())
                    for(Integer hands:item.getValue())
                        Wins.put(hands + 1 + (10 * (item.getKey() + 1)));
                jsO.put("Shutdown",Wins);
            }
        }
        
        if(StageUser == 4)
            if(Stage == 5){
                JSONArray Wins = new JSONArray();
                for(Map.Entry<Integer,List<Integer>> item: ShutdownInfo.entrySet())
                    for(Integer hands:item.getValue())
                        Wins.put(hands + 1 + (10 * (item.getKey() + 1)));
                jsO.put("Shutdown",Wins);
            }
        jsO.put("Table0", Table0);
        jsO.put("Table1", Table1);
        jsO.put("Table2", Table2);
        Table0 = null;
        Table1 = null;
        Table2 = null;
        return jsO.toString();
    }
    
    
    public void SetPreflop(String data){
        try {
            
            JSONObject js = new JSONObject(data);
            JSONObject T1 = js.getJSONObject("Table0");
            for(int i = 0; i < 4; i++){
                JSONArray T1Arr = T1.getJSONArray("Player" + String.valueOf(i));
                GetTableOne().Hands.get(i).CartOne = T1Arr.getInt(0);
                GetTableOne().Hands.get(i).CartTwo = T1Arr.getInt(1);
                GetTableOne().Hands.get(i).Factor = T1Arr.getJSONObject(2).getDouble("Factor");
                GetTableOne().Hands.get(i).Indicator = T1Arr.getJSONObject(2).getInt("Indicator");
            }
            
            JSONObject T2 = js.getJSONObject("Table1");
            for(int i = 0; i < 6; i++){
                JSONArray T1Arr = T2.getJSONArray("Player" + String.valueOf(i));
                GetTableTwo().Hands.get(i).CartOne = T1Arr.getInt(0);
                GetTableTwo().Hands.get(i).CartTwo = T1Arr.getInt(1);
                GetTableTwo().Hands.get(i).Factor = T1Arr.getJSONObject(2).getDouble("Factor");
                GetTableTwo().Hands.get(i).Indicator= T1Arr.getJSONObject(2).getInt("Indicator");
            }
            
            JSONObject T3 = js.getJSONObject("Table2");
            for(int i = 0; i < 8; i++){
                JSONArray T1Arr = T3.getJSONArray("Player" + String.valueOf(i));
                GetTableThree().Hands.get(i).CartOne = T1Arr.getInt(0);
                GetTableThree().Hands.get(i).CartTwo = T1Arr.getInt(1);
                GetTableThree().Hands.get(i).Factor = T1Arr.getJSONObject(2).getDouble("Factor");
                GetTableThree().Hands.get(i).Indicator = T1Arr.getJSONObject(2).getInt("Indicator");
            }
            Stage = 1;
            System.gc();
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void SetFlop(String data){
        try {
           
            JSONObject js = new JSONObject(data);
            JSONArray T1 = js.getJSONArray("Table0");
            GetTableOne().FlopOne = T1.getJSONObject(0).getJSONArray("Bord").getInt(0);
            GetTableOne().FlopTwo = T1.getJSONObject(0).getJSONArray("Bord").getInt(1);
            GetTableOne().FlopThree = T1.getJSONObject(0).getJSONArray("Bord").getInt(2);
            for(int i = 0; i < 4; i++){
                GetTableOne().Hands.get(i).Factor = T1.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
                GetTableOne().Hands.get(i).Indicator = T1.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
            
            }
            JSONArray T2 = js.getJSONArray("Table1");
            GetTableTwo().FlopOne = T2.getJSONObject(0).getJSONArray("Bord").getInt(0);
            GetTableTwo().FlopTwo = T2.getJSONObject(0).getJSONArray("Bord").getInt(1);
            GetTableTwo().FlopThree = T2.getJSONObject(0).getJSONArray("Bord").getInt(2);
            for(int i = 0; i < 6; i++){
                GetTableTwo().Hands.get(i).Factor = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
                GetTableTwo().Hands.get(i).Indicator = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
            }
            JSONArray T3 = js.getJSONArray("Table2");
            GetTableThree().FlopOne = T3.getJSONObject(0).getJSONArray("Bord").getInt(0);
            GetTableThree().FlopTwo = T3.getJSONObject(0).getJSONArray("Bord").getInt(1);
            GetTableThree().FlopThree = T3.getJSONObject(0).getJSONArray("Bord").getInt(2);
            for(int i = 0; i < 8; i++){
                GetTableThree().Hands.get(i).Factor = T3.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
                GetTableThree().Hands.get(i).Indicator = T3.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
            }
            Stage = 2; 
            System.gc();
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void SetTern(String data){
        try {
           
            JSONObject js = new JSONObject(data);
            JSONArray T1 = js.getJSONArray("Table0");
            GetTableOne().Tern = T1.getJSONObject(0).getJSONArray("Bord").getInt(3);
            for(int i = 0; i < 4; i++){
                GetTableOne().Hands.get(i).Factor = T1.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
                GetTableOne().Hands.get(i).Indicator = T1.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
            }
            JSONArray T2 = js.getJSONArray("Table1");
            GetTableTwo().Tern = T2.getJSONObject(0).getJSONArray("Bord").getInt(3);
            for(int i = 0; i < 6; i++){
                GetTableTwo().Hands.get(i).Factor = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
                GetTableTwo().Hands.get(i).Indicator = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
            }
            JSONArray T3 = js.getJSONArray("Table2");
            GetTableThree().Tern = T3.getJSONObject(0).getJSONArray("Bord").getInt(3);
            for(int i = 0; i < 8; i++){
                GetTableThree().Hands.get(i).Factor = T3.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
                GetTableThree().Hands.get(i).Indicator = T3.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
            }
             Stage = 3;
             System.gc();
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void SetRiver(String data){
        try {
          JSONObject js = new JSONObject(data);
          JSONArray T1 = js.getJSONArray("Table0");
          GetTableOne().River = T1.getJSONObject(0).getJSONArray("Bord").getInt(4);
          for(int i = 0; i < 4; i++){
              GetTableOne().Hands.get(i).Factor = T1.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
              GetTableOne().Hands.get(i).Indicator = T1.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
          }
          
          JSONArray T2 = js.getJSONArray("Table1");
          GetTableTwo().River = T2.getJSONObject(0).getJSONArray("Bord").getInt(4);
          for(int i = 0; i < 6; i++){
              GetTableTwo().Hands.get(i).Factor = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
              GetTableTwo().Hands.get(i).Indicator = T2.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
          }
          JSONArray T3 = js.getJSONArray("Table2");
          GetTableThree().River = T3.getJSONObject(0).getJSONArray("Bord").getInt(4);
          for(int i = 0; i < 8; i++){
              GetTableThree().Hands.get(i).Factor = T3.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getDouble("Factor");
              GetTableThree().Hands.get(i).Indicator = T3.getJSONObject(1).getJSONObject("Player" + String.valueOf(i)).getInt("Indicator");
          }
          Stage = 4;
          System.gc();
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void SetShutdown(String data){
        try {
            Stage = 5;
            ShutdownInfo.clear();
            JSONObject js = new JSONObject(data);
            JSONArray T1 = js.getJSONObject("Table0").getJSONArray("WinnHand");
            JSONArray T2 = js.getJSONObject("Table1").getJSONArray("WinnHand");
            JSONArray T3 = js.getJSONObject("Table2").getJSONArray("WinnHand");
            if(T1.length() > 0){
                List<Integer> hands = new ArrayList<Integer>();
            for(int i = 0;i < T1.length(); i++)
                hands.add(T1.getInt(i));
            ShutdownInfo.put(0, hands);
            }
            
            if(T2.length() > 0){
                List<Integer> hands = new ArrayList<Integer>();
            for(int i = 0;i < T2.length(); i++)
                hands.add(T2.getInt(i));
            ShutdownInfo.put(1, hands);
            }
            
            if(T3.length() > 0){
                List<Integer> hands = new ArrayList<Integer>();
            for(int i = 0;i < T3.length(); i++)
                hands.add(T3.getInt(i));
            ShutdownInfo.put(2, hands);
            } 
            Winners = js.getJSONArray("Winners");
            GMData.CalculateBalanceUser(Winners);
            GMData.WriteGameStatistic();
            System.gc();
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void Start(String data){
        try {
            Stage = 0;
            JSONObject js = new JSONObject(data);
            Round = js.getLong("Round");
            System.gc();
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public synchronized boolean SetNewBet(JSONArray Table1,JSONArray Table2,JSONArray Table3,double Sum,boolean Express){
        try {
            if(Sum > DBManager.GetInstance().GetCurrentUserAllInfo().balance)
                return false;
            if(Table1.length() == 0 && Table2.length() == 0 && Table3.length() == 0)
                return false;
            if(Sum < 4)
                return false;
            Long UserId = DBManager.GetInstance().GetCurrentUserId();
            List<UserBet> bet = new ArrayList<UserBet>();
            UserBet ub = new UserBet();
            ub.Sum = Sum;
            ub.Express = Express;
            List<Integer> hand = new ArrayList<Integer>();
            if(Table1.length() > 0){
                for (int i = 0; i < Table1.length(); i++) 
                    hand.add(Table1.getInt(i));
                    ub.TableHand.put(0,hand);
                        }
            if(Table2.length() > 0){
                hand = new ArrayList<Integer>();
                for (int i = 0; i < Table2.length(); i++) 
                    hand.add(Table2.getInt(i));
                ub.TableHand.put(1,hand);
                        }
            if(Table3.length() > 0){
                hand = new ArrayList<Integer>();
                for (int i = 0; i < Table3.length(); i++) 
                    hand.add(Table3.getInt(i));
                ub.TableHand.put(2,hand);
                        }
            long IdBet = GMData.WriteBetsCurrentStage(ub);
            ub.IdBet = IdBet;
            if(Bets.containsKey(UserId))
                Bets.get(UserId).add(ub);
            else{
                bet.add(ub);
                Bets.put(UserId, bet);
            }
            System.gc();
            return true;
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean SetResponceCurrentUserBet(String data){
        try {
            JSONObject js = new JSONObject(data);
            StatisticBetCurrentUser.put(js.getJSONObject("BetInfo").getLong("BetId"), js); 
            return true;
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public synchronized boolean SendGetBet(int index,String Token){
        try {
            if(GMData.GetRoundFromBet(index) == GetRound())
                return false;
            StatisticBet st = new StatisticBet();
            st.IdBet = index;
            //st.IdUserRequest = ;
            st.TimeRequest = System.currentTimeMillis();
            st.ToketUserRequest = Token;
            RequestStatisticBet.put(DBManager.GetInstance().GetCurrentUserId(),st);
            JSONObject js = new JSONObject();
            js.put("BetId", index);
            js.put("UserId", GMData.GetUserFromBet(index));
            Connect.GetInstance().out.write(Functions.intToByteArray(1030));
            Connect.GetInstance().out.write(Functions.intToByteArray(js.toString().length()));
            Connect.GetInstance().out.write(CryptoManager.encode(js.toString().getBytes()));
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
    
    public synchronized boolean SendGetBetGame(int index,String Token){
        try {
            if(GMData.GetCurrentUserGameStatistic().getJSONObject(index).getLong("id_game") == GetRound())
                return false;
            long idBet = GMData.GetCurrentUserGameStatistic().getJSONObject(index).getLong("id");
            StatisticBet st = new StatisticBet();
            st.IdBet = idBet;
            st.TimeRequest = System.currentTimeMillis();
            st.ToketUserRequest = Token;
            RequestStatisticBet.put(DBManager.GetInstance().GetCurrentUserId(),st);
            JSONObject js = new JSONObject();
            js.put("BetId", idBet);
            js.put("UserId", DBManager.GetInstance().GetCurrentUserId());
            Connect.GetInstance().out.write(Functions.intToByteArray(1030));
            Connect.GetInstance().out.write(Functions.intToByteArray(js.toString().length()));
            Connect.GetInstance().out.write(CryptoManager.encode(js.toString().getBytes()));
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
    
    public boolean ResponceCasinoBalanceFromServer(String data){
        try {
            JSONObject js = new JSONObject(data);
            BalanseServer = new DataBalanceServer();
            BalanseServer.balance = js.getDouble("balance");
            BalanseServer.profit = js.getDouble("profit");
            BalanseServer.spareMoney = js.getDouble("spareMoney");
            BalanseServer.persent = js.getInt("persent");
            return true;
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean SendPersentToServer(int persent){
        try {
            JSONObject js = new JSONObject();
            js.put("persent", persent);
            Connect.GetInstance().out.write(Functions.intToByteArray(1055));
            Connect.GetInstance().out.write(Functions.intToByteArray(js.toString().length()));
            Connect.GetInstance().out.write(CryptoManager.encode(js.toString().getBytes()));
            Connect.GetInstance().out.flush();
            return true;
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public boolean GetCasinoBalanceFromServer(){
        try {
            Connect.GetInstance().out.write(Functions.intToByteArray(1051));
            Connect.GetInstance().out.flush();
            return true;
        } catch (IOException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
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
            for (Map.Entry<Long,List<UserBet>> item : Bets.entrySet()) {
                for (UserBet itemBet : item.getValue()) {
                UserJs = new JSONObject();
                UserJs.put("Id", item.getKey());
                UserJs.put("Sum", itemBet.Sum);
                UserJs.put("Express", itemBet.Express);
                UserJs.put("IdBet", itemBet.IdBet);
                for(Map.Entry<Integer,List<Integer>> tables : itemBet.TableHand.entrySet()){
                    HandJs = new JSONObject();
                    for (Integer hands : tables.getValue()){
                        if (tables.getKey() == 0)
                            HandJs.put(hands.toString(), GetTableOne().Hands.get(hands).Factor);
                        if (tables.getKey() == 1)
                            HandJs.put(hands.toString(), GetTableTwo().Hands.get(hands).Factor);
                        if (tables.getKey() == 2)
                            HandJs.put(hands.toString(), GetTableThree().Hands.get(hands).Factor);
                    }
                    UserJs.put("Table" + tables.getKey().toString(),HandJs);
                }
                RootJs.put(UserJs);
                }
            }
            Bets.clear();
            Connect.GetInstance().out.write(Functions.intToByteArray(1020));
            Connect.GetInstance().out.write(Functions.intToByteArray(RootJs.toString().length()));
            Connect.GetInstance().out.write(CryptoManager.encode(RootJs.toString().getBytes()));
            Connect.GetInstance().out.flush();
          //  System.gc();
            return true;
        } catch (IOException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public synchronized Map<Integer,List<Integer>> GetShutdown(){
        return ShutdownInfo;
    }
    
    public synchronized Table GetTableOne(){
        return TableOne;
    }
    
    public synchronized Table GetTableTwo(){
        return TableTwo;
    }
    
    public synchronized Table GetTableThree(){
        return TableThree;
    }
    
    public synchronized Long GetRound(){
        return Round;
    }
    public synchronized int GetStage(){
        return Stage;
    }
}
