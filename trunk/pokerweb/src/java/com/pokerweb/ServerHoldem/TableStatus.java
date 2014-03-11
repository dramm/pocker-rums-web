/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.ServerHoldem;

import com.pokerweb.DB.DBManager;
import com.pokerweb.Server.Functions;
import com.pokerweb.crypto.CryptoManager;
import java.io.IOException;
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
    public Map<Integer,TableHoldem> TableList; 
    public Map<Long,UserTable> Users;
    private TableStatus(){
        TableList = new java.util.concurrent.ConcurrentHashMap<Integer, TableHoldem>();
        Users = new java.util.concurrent.ConcurrentHashMap<Long,UserTable>();
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
    
    public synchronized String GetDataTable(int IdTable){
        JSONObject jsO = new JSONObject();
        JSONArray jsUsers = new JSONArray();
        System.out.println(IdTable);
         if(TableList == null || TableList.size() <= 0)
            return jsO.toString();
        long UserId = DBManager.GetInstance().GetCurrentUserId();
        System.out.println("UserId= "+UserId);
        System.out.println("Size = "+TableList.get(IdTable).Users.size());
        UserTable us =  Users.get(UserId);
        if(us != null)
            us.setLastUserOnline(System.currentTimeMillis());
        try {
            for (Map.Entry<Integer,UserTable> User : TableList.get(IdTable).Users.entrySet()) {
                JSONObject jsUser = new JSONObject();
                jsUser.put("CartOne", User.getValue().getCartOne());
                jsUser.put("CartTwo", User.getValue().getCartTwo());
                jsUser.put("Dialer", User.getValue().isDialer());
                jsUser.put("UserBet", User.getValue().getUserBet());
                jsUser.put("UserCash", User.getValue().getUserCash());
                jsUser.put("UserName", User.getValue().getName());
                jsUser.put("IsRaise", User.getValue().IsRaise);
                jsUser.put("MinRaise", User.getValue().getMinRaise());
                jsUser.put("SumCall", User.getValue().SumCall);
                jsUser.put("IsCall", User.getValue().IsCall);
                jsUser.put("TimerFoBet", User.getValue().TimerFoBet);
                jsUser.put("isUserSit", User.getValue().isUserSit());
                jsUser.put("Lack", User.getValue().isLack());
                jsUsers.put(jsUser);
                if(User.getValue().isUserSit() && User.getValue().getIdUser() == UserId)
                    jsO.put("CurrentUserSit", true);
                    
            }
            jsO.put("Users", jsUsers.toString());
            jsO.put("BankTable",TableList.get(IdTable).getBankTable());
            jsO.put("FlopOne",TableList.get(IdTable).getFlopOne());
            jsO.put("FlopTwo",TableList.get(IdTable).getFlopTwo());
            jsO.put("FlopThree",TableList.get(IdTable).getFlopThree());
            jsO.put("Tern",TableList.get(IdTable).getTern());
            jsO.put("River",TableList.get(IdTable).getRiver());
            jsO.put("Balance", DBManager.GetInstance().GetCurrentUserAllInfo().balance);
            
            
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(jsO.toString());
        return jsO.toString();
    }
    
    public synchronized static TableStatus GetInstance(){
        if(instanse == null)
            instanse = new TableStatus();
        return instanse;
    }
    
    public void SendSitThisRequest(int IdTable,int Idplase,double sum){
        try {
            JSONObject js = new JSONObject();
            js.put("tableId", IdTable);
            js.put("plaseId", Idplase);
            js.put("stack", sum);
            js.put("userId", DBManager.GetInstance().GetCurrentUserId());
            System.out.println("SITTHIS");
            System.out.println(js.toString());
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
            System.out.println("SetResponceSitThis");
            System.out.println(Message);
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
                    Users.put(PlayerId, TableList.get(TableId).Users.get(PlaseId));
                    
                }
            
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
     public void SetResponceExit(String Message){
        try {
            JSONObject jsObj = new JSONObject(Message);
            System.out.println("SetResponceExit");
            System.out.println(Message);
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
        
        System.out.println(jsArr.toString());
        return jsArr.toString();
    }

    
    public boolean SetListTable(String json){
        try {
            System.out.println("SetListFromServer");
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
    
    public void ExitTable(int TableId){
        try {
            JSONObject js = new JSONObject();
            js.put("tableId", TableId);
            js.put("userId", DBManager.GetInstance().GetCurrentUserId());
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
            js.put("TableId", TableId);
            js.put("TimeMillils", TimeMillils);
            js.put("UserId", UserId);
            js.put("PlaseId", PlaseId);
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
            System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
            //{"tableId":6,"request":150,"data":{"dealer":{"playerId":7,"plaseId":0,"stack":14.9},"smalBlind":"Empty","bigBlind":"Empty"}}
            JSONObject js = new JSONObject(Message);
            int TableId = js.getInt("tableId");
            long IdUserDealer = js.getJSONObject("data").getJSONObject("dealer").getLong("playerId");
            int PlaseUserDealer = js.getJSONObject("data").getJSONObject("dealer").getInt("plaseId");
            System.out.println("TableId = "+TableId);
            System.out.println("Plase = "+PlaseUserDealer);
            System.out.println(TableList.get(TableId) == null? "null":"not null");
            System.out.println(TableList.get(TableId).Users.get(PlaseUserDealer) == null? "null":"not null");
             for (Map.Entry<Integer,UserTable> User : TableList.get(TableId).Users.entrySet()) {
                System.out.println("CartOne="+ User.getValue().getCartOne());
                System.out.println("CartTwo="+ User.getValue().getCartTwo());
                System.out.println("Dialer="+ User.getValue().isDialer());
                System.out.println("UserBet="+ User.getValue().getUserBet());
                System.out.println("UserCash="+ User.getValue().getUserCash());
                System.out.println("UserName="+ User.getValue().getName());
                System.out.println("IsRaise="+ User.getValue().IsRaise);
                System.out.println("MinRaise="+ User.getValue().getMinRaise());
                System.out.println("SumCall="+ User.getValue().SumCall);
                System.out.println("IsCall="+ User.getValue().IsCall);
                System.out.println("TimerFoBet="+ User.getValue().TimerFoBet);
                System.out.println("isUserSit="+ User.getValue().isUserSit());
                    System.out.println("PLASE!!! = "+User.getKey());
            }
            TableList.get(TableId).Users.get(PlaseUserDealer).Dialer = true;
            
                    
            System.out.println(Message);
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
   
}
