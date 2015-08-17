/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.ServerHoldem;

import com.pokerweb.DB.DBManager;
import com.pokerweb.Server.Functions;
import com.pokerweb.crypto.CryptoManager;
import java.io.IOException;
import java.util.AbstractMap;
import java.util.HashMap;
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
    public Map<Integer,TableHoldem> TableList; 
    public Map<Integer,Map<Long,Integer>> UsersTable;
    private TableStatus(){
        TableList = new java.util.concurrent.ConcurrentHashMap<Integer, TableHoldem>();
        UsersTable = new HashMap<Integer, Map<Long, Integer>>();
        java.util.Timer timer = new java.util.Timer();
        TimerTask task = new TimerTask() {
            public void run(){
                try {
                    System.out.println("GetListFromServer");
                    byte[] byteCommand = Functions.intToByteArray(100);            
                    Connect.GetInstance().out.write(byteCommand);
                    Connect.GetInstance().out.flush();
                } catch (IOException ex) {
                    Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        };
  timer.schedule( task,0, 10000 );
  
    }
    
    public synchronized String GetDataTable(String Message,String Name){
        try {
            JSONObject js = new JSONObject(Message);
            
            int IdTable = js.getInt("IdTable");
            int StageClient = js.getInt("Stage");
            JSONObject jsO = new JSONObject();
            JSONArray jsUsers = new JSONArray();
            System.out.println(IdTable);
            if(TableList == null || TableList.size() <= 0)
                return jsO.toString();
            long UserId = DBManager.GetInstance().GetCurrentUserId(Name);
            UserTable us =  TableList.get(IdTable).Users.get(UsersTable.get(IdTable).get(UserId));
            if(us != null)
                us.setLastUserOnline(System.currentTimeMillis());
            int StageServer = TableList.get(IdTable).getStage();
            jsO.put("StageServer",StageServer);
            switch(StageClient){
                case 0:
                    if(StageServer >= 0)
                        jsO.put("Balance", DBManager.GetInstance().GetCurrentUserAllInfo(Name).balance);
                    break;
                case 1:
                    if(StageServer >= 1)
                        jsO.put("TimerCurrentUser", TableList.get(IdTable).Users.get(us));
                    break;
                    
            }
            
//            try {
//                for (Map.Entry<Integer,UserTable> User : TableList.get(IdTable).Users.entrySet()) {
//                    JSONObject jsUser = new JSONObject();
//                    if(UserId == User.getValue().getIdUser()){
//                        jsUser.put("CartOne", User.getValue().getCartOne());
//                        jsUser.put("CartTwo", User.getValue().getCartTwo());
//                    }else{
//                        jsUser.put("CartOne", 0);
//                        jsUser.put("CartTwo", 0);
//                    }
//                    jsUser.put("Dialer", User.getValue().isDialer());
//                    jsUser.put("UserBet", User.getValue().getUserBet());
//                    jsUser.put("UserCash", User.getValue().getUserCash());
//                    jsUser.put("UserName", User.getValue().getName());
//                    
//                    
//                    
//                    jsUser.put("TimerFoBet", User.getValue().TimerFoBet);
//                    jsUser.put("isUserSit", User.getValue().isUserSit());
//                    jsUser.put("Lack", User.getValue().isLack());
//                    jsUsers.put(jsUser);
//                    if(User.getValue().isUserSit() && User.getValue().getIdUser() == UserId)
//                        jsO.put("CurrentUserSit", true);
//                    if(User.getValue().isUserSit() && User.getValue().getIdUser() == UserId && User.getValue().isActivateButton()){
//                        JSONObject jsButton = new JSONObject();
//                        jsButton.put("IsRaise", User.getValue().isIsRaise());
//                        jsButton.put("MinRaise", User.getValue().getMinRaise());
//                        jsButton.put("MaxRaise", User.getValue().getMaxRaise());
//                        jsButton.put("ValueRaise", User.getValue().getValueRaise());
//                        jsButton.put("IsFold", User.getValue().isIsFold());
//                        jsButton.put("IsCheck", User.getValue().isIsCheck());
//                        jsButton.put("SumCall", User.getValue().getSumCall());
//                        jsButton.put("IsCall", User.getValue().isIsCall());
//                        jsO.put("ButtonActivate",jsButton.toString());
//                    }
//                    
//                }
//                jsO.put("Users", jsUsers.toString());
//                jsO.put("BankTable",TableList.get(IdTable).getBankTable());
//                jsO.put("FlopOne",TableList.get(IdTable).getFlopOne());
//                jsO.put("FlopTwo",TableList.get(IdTable).getFlopTwo());
//                jsO.put("FlopThree",TableList.get(IdTable).getFlopThree());
//                jsO.put("Tern",TableList.get(IdTable).getTern());
//                jsO.put("River",TableList.get(IdTable).getRiver());
//                jsO.put("Balance", DBManager.GetInstance().GetCurrentUserAllInfo().balance);
//                
//                
//            } catch (JSONException ex) {
//                Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
//            }
//            System.out.println("@@@@@@@@@@@GETDATA");
//            System.out.println("Time="+System.currentTimeMillis());
//            System.out.println("*********************************************************");
//            System.out.println(jsO.toString());
//            System.out.println("*********************************************************");
            return jsO.toString();
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public synchronized static TableStatus GetInstance(){
        if(instanse == null)
            instanse = new TableStatus();
        return instanse;
    }
    
    public void SendSitThisRequest(int IdTable,int Idplase,double sum,String Name){
        try {
            JSONObject js = new JSONObject();
            js.put("tableId", IdTable);
            js.put("plaseId", Idplase);
            js.put("stack", sum);
            js.put("userId", DBManager.GetInstance().GetCurrentUserId(Name));
            System.out.println("@@@@@@@@@@@@@@@SITTHIS");
            System.out.println("Time="+System.currentTimeMillis());
            System.out.println("*********************************************************");
            System.out.println(js.toString());
            System.out.println("*********************************************************");
            
            Connect.GetInstance().out.write(Functions.intToByteArray(120));
            Connect.GetInstance().out.write(Functions.intToByteArray(js.toString().length()));
            Connect.GetInstance().out.write(CryptoManager.encode(js.toString().getBytes()));
            Connect.GetInstance().out.flush();
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void SetResponceSitThis(String Message){
        try {
            JSONObject jsObj = new JSONObject(Message);
            System.out.println("!!!!!!!!!!!!!SetResponceSitThis");
            System.out.println("Time="+System.currentTimeMillis());
            System.out.println("*********************************************************");
            System.out.println(Message);
            System.out.println("*********************************************************");
            
            for(int i = 0; i < jsObj.getJSONArray("data").length(); i++)
                if(jsObj.getJSONArray("data").getJSONObject(i).length() != 0){
                    int TableId = jsObj.getInt("tableId");
                    int PlaseId = jsObj.getJSONArray("data").getJSONObject(i).getInt("plaseId");
                    long PlayerId = jsObj.getJSONArray("data").getJSONObject(i).getLong("playerId");
                    double Stack = jsObj.getJSONArray("data").getJSONObject(i).getDouble("stack");
                    TableList.get(TableId).Users.get(PlaseId).setUserSit(true);
                    TableList.get(TableId).Users.get(PlaseId).setName(DBManager.GetInstance().GetUserLoginFromId(PlayerId));
                    TableList.get(TableId).Users.get(PlaseId).setIdUser(PlayerId);
                    TableList.get(TableId).Users.get(PlaseId).setIdTable(TableId);
                    TableList.get(TableId).Users.get(PlaseId).UserCash = Stack;
                    TableList.get(TableId).Users.get(PlaseId).setPositionTable(PlaseId);
                    Map<Long, Integer> UserObj = new HashMap<Long, Integer>();
                    UserObj.put(PlayerId, PlaseId);
                    UsersTable.put(TableId, UserObj);
                    
                }
            
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
     public void SetResponceExit(String Message){
        try {
            JSONObject jsObj = new JSONObject(Message);
            System.out.println("!!!!!!SetResponceExit");
            System.out.println("Time="+System.currentTimeMillis());
            System.out.println("*********************************************************");
            System.out.println(Message);
            System.out.println("*********************************************************");
            for(int i = 0; i < jsObj.getJSONArray("data").length(); i++){
                System.out.println("LenAll="+jsObj.getJSONArray("data").length());
                System.out.println("Lenght="+jsObj.getJSONArray("data").getJSONObject(i).length());
                if(jsObj.getJSONArray("data").getJSONObject(i).length() <= 0){
                    TableList.get(jsObj.getInt("tableId")).Users.get(i).setUserSit(false);
                    TableList.get(jsObj.getInt("tableId")).Users.get(i).setName("");
                    TableList.get(jsObj.getInt("tableId")).Users.get(i).UserCash = 0;
                    TableList.get(jsObj.getInt("tableId")).Users.get(i).setDialer(false);
                    TableList.get(jsObj.getInt("tableId")).Users.get(i).setLack(false);
                }
            }
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public String GetListTable(){
        JSONArray jsArr = new JSONArray();
        System.out.println("GetListFromWeb");
        for (Map.Entry<Integer,TableHoldem> tableHoldem : TableList.entrySet()) {
            try {
                JSONObject js = new JSONObject();
                js.put("averageBank", tableHoldem.getValue().getAverageBank());
                js.put("TableId", tableHoldem.getValue().getIdTable());
                js.put("MaxBlinds", tableHoldem.getValue().getMaxBlinds());
                js.put("MinBlinds", tableHoldem.getValue().getMinBlinds());
                js.put("distributionCount", tableHoldem.getValue().getDistributionCount());
                js.put("flopView", tableHoldem.getValue().getFlopView());
                js.put("players", tableHoldem.getValue().getCountMaxUsers());
                if(tableHoldem.getValue().getType() == 0)
                    js.put("type", "Лимитный");
                else
                    js.put("type", "Безлимитный");
                js.put("PlayerSittings", tableHoldem.getValue().getCountUsers());
                jsArr.put(js);
                
            } catch (JSONException ex) {
                Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        System.out.println("Time="+System.currentTimeMillis());
        System.out.println("*********************************************************");
        System.out.println(jsArr.toString());
        System.out.println("*********************************************************");
        return jsArr.toString();
    }

    
    public boolean SetListTable(String json){
        try {
            System.out.println("!!!!!!!!!!!!!!!!!!SetListFromServer");
            System.out.println("Time="+System.currentTimeMillis());
            System.out.println("*********************************************************");
            System.out.println(json);
            System.out.println("*********************************************************");
            JSONObject jsObj = new JSONObject(json);
            System.out.println(json);
            if(TableList.size() <= 0){
            for (int i = 0; i < jsObj.getJSONArray("data").length(); i++) {
                TableHoldem table = new TableHoldem();
                table.setIdTable(jsObj.getJSONArray("data").getJSONObject(i).getInt("tableId"));
                table.setAverageBank(jsObj.getJSONArray("data").getJSONObject(i).getInt("averageBank"));
                table.setMinBlinds(jsObj.getJSONArray("data").getJSONObject(i).getJSONArray("blinds").getDouble(0));
                table.setMaxBlinds(jsObj.getJSONArray("data").getJSONObject(i).getJSONArray("blinds").getDouble(1));
                table.setDistributionCount(jsObj.getJSONArray("data").getJSONObject(i).getInt("distributionCount"));
                table.setFlopView(jsObj.getJSONArray("data").getJSONObject(i).getInt("flopView"));
                table.setCountMaxUsers(jsObj.getJSONArray("data").getJSONObject(i).getInt("players"));
                table.setType(jsObj.getJSONArray("data").getJSONObject(i).getInt("type"));
                table.setCountUsers(jsObj.getJSONArray("data").getJSONObject(i).getInt("playersSitting"));
                TableList.put(table.getIdTable(), table);
            }
            }else{
                for (int i = 0; i < jsObj.getJSONArray("data").length(); i++) {
                    int IdTable = jsObj.getJSONArray("data").getJSONObject(i).getInt("tableId");
                    
                    if(TableList.get(IdTable) != null){
                        TableList.get(IdTable).setCountUsers(jsObj.getJSONArray("data").getJSONObject(i).getInt("playersSitting"));
                        TableList.get(IdTable).setAverageBank(jsObj.getJSONArray("data").getJSONObject(i).getInt("averageBank"));
                        TableList.get(IdTable).setDistributionCount(jsObj.getJSONArray("data").getJSONObject(i).getInt("distributionCount"));
                        TableList.get(IdTable).setFlopView(jsObj.getJSONArray("data").getJSONObject(i).getInt("flopView"));
                    }else{
                        TableHoldem table = new TableHoldem();
                        table.setIdTable(jsObj.getJSONArray("data").getJSONObject(i).getInt("tableId"));
                        table.setAverageBank(jsObj.getJSONArray("data").getJSONObject(i).getInt("averageBank"));
                        table.setMinBlinds(jsObj.getJSONArray("data").getJSONObject(i).getJSONArray("blinds").getDouble(0));
                        table.setMaxBlinds(jsObj.getJSONArray("data").getJSONObject(i).getJSONArray("blinds").getDouble(1));
                        table.setDistributionCount(jsObj.getJSONArray("data").getJSONObject(i).getInt("distributionCount"));
                        table.setFlopView(jsObj.getJSONArray("data").getJSONObject(i).getInt("flopView"));
                        table.setCountMaxUsers(jsObj.getJSONArray("data").getJSONObject(i).getInt("players"));
                        table.setType(jsObj.getJSONArray("data").getJSONObject(i).getInt("type"));
                        table.setCountUsers(jsObj.getJSONArray("data").getJSONObject(i).getInt("playersSitting"));
                        TableList.put(table.getIdTable(), table);
                    }
                }
                
            }
            return true;
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
         return false;
    }
    
    public synchronized String GetNewData(int StageUser,String Token){
        return "";
    }
    
    public void ExitTable(int TableId,String Name){
        try {
            JSONObject js = new JSONObject();
            js.put("tableId", TableId);
            js.put("userId", DBManager.GetInstance().GetCurrentUserId(Name));
            System.out.println("@@@@@@@@@@@@@@@@@@@@@ExitTable");
            System.out.println("Time="+System.currentTimeMillis());
            System.out.println("*********************************************************");
            System.out.println(js.toString());
            System.out.println("*********************************************************");
            
            Connect.GetInstance().out.write(Functions.intToByteArray(140));
            Connect.GetInstance().out.write(Functions.intToByteArray(js.toString().length()));
            Connect.GetInstance().out.write(CryptoManager.encode(js.toString().getBytes()));
            Connect.GetInstance().out.flush();
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void UserMoved(long UserId,int TableId,long TimeMillils,int PlaseId){
        JSONObject js = new JSONObject();
        try {
            System.out.println("UserMoved" + TimeMillils);
            js.put("tableId", TableId);
          //  js.put("timeMillils", TimeMillils);
            js.put("userId", UserId);
           // js.put("plaseId", PlaseId);
            System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@UserMoved");
            System.out.println("Time="+System.currentTimeMillis());
            System.out.println("*********************************************************");
            System.out.println(js.toString());
            System.out.println("*********************************************************");
            
            Connect.GetInstance().out.write(Functions.intToByteArray(130));
            Connect.GetInstance().out.write(Functions.intToByteArray(js.toString().length()));
            Connect.GetInstance().out.write(CryptoManager.encode(js.toString().getBytes()));
            Connect.GetInstance().out.flush();
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void SetStartStage(String Message){
        try {
            System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!SetStartStage");
            System.out.println("Time="+System.currentTimeMillis());
            System.out.println("*********************************************************");
            System.out.println(Message);
            System.out.println("*********************************************************");
            
            JSONObject js = new JSONObject(Message);
            int TableId = js.getInt("tableId");
            long IdUserDealer = js.getJSONObject("data").getJSONObject("dealer").getLong("playerId");
            int PlaseUserDealer = js.getJSONObject("data").getJSONObject("dealer").getInt("plaseId");
            long IdUserSmallBlaind = js.getJSONObject("data").getJSONObject("smalBlind").getLong("playerId");
            int PlaseUserSmallBlaind = js.getJSONObject("data").getJSONObject("smalBlind").getInt("plaseId");
            double SummUserSmallBlaind = js.getJSONObject("data").getJSONObject("smalBlind").getDouble("stack");
            
            long IdUserBigBlaind = js.getJSONObject("data").getJSONObject("bigBlind").getLong("playerId");
            int PlaseUserBigBlaind = js.getJSONObject("data").getJSONObject("bigBlind").getInt("plaseId");
            double SummUserBigBlaind = js.getJSONObject("data").getJSONObject("bigBlind").getDouble("stack");
            
            TableList.get(TableId).Users.get(PlaseUserDealer).Dialer = true;
            
            TableList.get(TableId).Users.get(PlaseUserSmallBlaind).setUserCash(SummUserSmallBlaind);
            TableList.get(TableId).Users.get(PlaseUserBigBlaind).setUserCash(SummUserBigBlaind);
            
            System.out.println("TableId = "+TableId);
            System.out.println("Plase = "+PlaseUserDealer);
            System.out.println(TableList.get(TableId) == null? "null":"not null");
            System.out.println(TableList.get(TableId).Users.get(PlaseUserDealer) == null? "null":"not null");
                    
            System.out.println(Message);
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void SetPreflopStage(String Message){
        try {
            System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!SetPreflopStage");
            System.out.println("Time="+System.currentTimeMillis());
            System.out.println("*********************************************************");
            System.out.println(Message);
            System.out.println("*********************************************************");
            
            JSONObject js = new JSONObject(Message);
            //{"tableId":6,"request":160,"data":[{"firstCard":30,"secondCard":48,"plaseId":0,"userId":1},{"firstCard":17,"secondCard":37,"plaseId":3,"userId":7}]}
              int tableId = js.getInt("tableId");
              for (int i = 0; i < js.getJSONArray("data").length(); i++) {
                 int PlaseId = js.getJSONArray("data").getJSONObject(i).getInt("plaseId");
                 int CartOne = js.getJSONArray("data").getJSONObject(i).getInt("firstCard");
                 int CartTwo = js.getJSONArray("data").getJSONObject(i).getInt("secondCard");
                 TableList.get(tableId).Users.get(PlaseId).CartOne = CartOne;
                 TableList.get(tableId).Users.get(PlaseId).CartTwo = CartTwo;
              }
            System.out.println(Message);
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void SetButtonSettingsResponce(String Message,String Name){
        try {
            JSONObject js = new JSONObject();
            long UserId = DBManager.GetInstance().GetCurrentUserId(Name);
            JSONObject ParseCommand = new JSONObject(Message);
            int TableId = ParseCommand.getInt("TableId");
            js.put("userId", UserId);
            js.put("plaseId", UsersTable.get(TableId).get(UserId));
            js.put("tableId", TableId);
            JSONObject jsCommand = new JSONObject();
            
            switch(ParseCommand.getInt("command")){
                case 1:
                    JSONObject RaiseSumm = new JSONObject();
                    RaiseSumm.put("sum", ParseCommand.getDouble("summ"));
                    jsCommand.put("raise", RaiseSumm);
                    break;
                case 2:
                    jsCommand.put("call", "{}");
                    break;
               case 3:
                    jsCommand.put("fold", "{}");
                    break;
               case 4:
                    jsCommand.put("check", "{}");
                    break;
            }
            
            js.put("Command", jsCommand);
            Connect.GetInstance().out.write(Functions.intToByteArray(200));
            Connect.GetInstance().out.write(Functions.intToByteArray(js.toString().length()));
            Connect.GetInstance().out.write(CryptoManager.encode(js.toString().getBytes()));
            Connect.GetInstance().out.flush();
        } catch (IOException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void SetButtonSettings(String Message){
        try {
            System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!SetButtonSettings");
            System.out.println("Time="+System.currentTimeMillis());
            System.out.println("*********************************************************");
            System.out.println(Message);
            System.out.println("*********************************************************");
           
            JSONObject js = new JSONObject(Message);
            int tableId = js.getInt("tableId");
            int PlaseId = js.getJSONObject("data").getInt("plaseId");
            boolean IsCall = js.getJSONObject("data").getJSONObject("buttons").getJSONObject("call").getBoolean("visible");
            double SumCall = js.getJSONObject("data").getJSONObject("buttons").getJSONObject("call").getDouble("value");
            boolean IsCheck = js.getJSONObject("data").getJSONObject("buttons").getJSONObject("check").getBoolean("visible");
            boolean IsRaise = js.getJSONObject("data").getJSONObject("buttons").getJSONObject("raise").getBoolean("visible");
            double MinRaise = js.getJSONObject("data").getJSONObject("buttons").getJSONObject("raise").getDouble("min");
            double MaxRaise = js.getJSONObject("data").getJSONObject("buttons").getJSONObject("raise").getDouble("max");
            double ValueRaise = js.getJSONObject("data").getJSONObject("buttons").getJSONObject("raise").getDouble("value");
            boolean IsFold = js.getJSONObject("data").getJSONObject("buttons").getJSONObject("fold").getBoolean("visible");
             
            TableList.get(tableId).Users.get(PlaseId).setActivateButton(true);
            TableList.get(tableId).Users.get(PlaseId).setIsCall(IsCall);
            TableList.get(tableId).Users.get(PlaseId).setSumCall(SumCall);
            TableList.get(tableId).Users.get(PlaseId).setIsCheck(IsCheck);
            TableList.get(tableId).Users.get(PlaseId).setIsRaise(IsRaise);
            TableList.get(tableId).Users.get(PlaseId).setMinRaise(MinRaise);
            TableList.get(tableId).Users.get(PlaseId).setMaxRaise(MaxRaise);
            TableList.get(tableId).Users.get(PlaseId).setValueRaise(ValueRaise);
            TableList.get(tableId).Users.get(PlaseId).setIsFold(IsFold);
              
            System.out.println(Message);
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
}
