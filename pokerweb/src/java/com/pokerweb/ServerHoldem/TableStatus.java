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
    private static TableStatus instanse = new TableStatus();
    public Map<Integer,TableHoldem> TableList; 
    private TableStatus(){
        TableList = new HashMap<Integer, TableHoldem>();
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
    
    public String GetDataTable(int IdTable){
        JSONObject jsO = new JSONObject();
        JSONArray jsUsers = new JSONArray();
        System.out.println(IdTable);
        try {
            for (Map.Entry<Integer,UserTable> User : TableList.get(IdTable).Users.entrySet()) {
                JSONObject jsUser = new JSONObject();
                jsUser.put("CartOne", User.getValue().getCartOne());
                jsUser.put("CartTwo", User.getValue().getCartTwo());
                jsUser.put("Dialer", User.getValue().Dialer);
                jsUser.put("UserBet", User.getValue().UserBet);
                jsUser.put("UserCash", User.getValue().UserCash);
                jsUser.put("UserName", User.getValue().getName());
                jsUser.put("IsRaise", User.getValue().IsRaise);
                jsUser.put("MinRaise", User.getValue().MinRaise);
                jsUser.put("SumCall", User.getValue().SumCall);
                jsUser.put("IsCall", User.getValue().IsCall);
                jsUser.put("TimerFoBet", User.getValue().TimerFoBet);
                jsUser.put("isUserSit", User.getValue().isUserSit());
                jsUsers.put(jsUser);
            }
            
            jsO.put("Users", jsUsers.toString());
            jsO.put("BankTable",TableList.get(IdTable).getBankTable());
            jsO.put("FlopOne",TableList.get(IdTable).getFlopOne());
            jsO.put("FlopTwo",TableList.get(IdTable).getFlopTwo());
            jsO.put("FlopThree",TableList.get(IdTable).getFlopThree());
            jsO.put("Tern",TableList.get(IdTable).getTern());
            jsO.put("River",TableList.get(IdTable).getRiver());
        
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(jsO.toString());
        return jsO.toString();
    }
    
    public synchronized static TableStatus GetInstance(){
        return instanse;
    }
    
    public void SendSitThisRequest(int IdTable,int Idplase,double sum){
        try {
            JSONObject js = new JSONObject();
            js.put("tableId", IdTable);
            js.put("plaseId", Idplase);
            js.put("stack", sum);
            js.put("userId", DBManager.GetInstance().GetCurrentUserId());
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
                    TableList.get(jsObj.getInt("tableId")).
                            Users.get(jsObj.getJSONArray("data").
                                    getJSONObject(i).getInt("plaseId")).setUserSit(true);
                    
                    TableList.get(jsObj.getInt("tableId")).
                            Users.get(jsObj.getJSONArray("data").getJSONObject(i).getInt("plaseId")).
                            setName(DBManager.GetInstance().GetUserLoginFromId(jsObj.getJSONArray("data").
                                    getJSONObject(i).getLong("playerId")));
                    
                TableList.get(jsObj.getInt("tableId")).Users.get(jsObj.getJSONArray("data").
                        getJSONObject(i).getInt("plaseId")).
                        UserCash = jsObj.getJSONArray("data").getJSONObject(i).getDouble("stack");
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
        return jsArr.toString();
    }

    
    public boolean SetListTable(String json){
        try {
            System.out.println("SetListFromServer");
            JSONObject jsObj = new JSONObject(json);
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
            }}else{
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
    
   
}
