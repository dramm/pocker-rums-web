/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.ServerHoldem;

import com.pokerweb.Server.Functions;
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
                    byte[] byteCommand = Functions.intToByteArray(100);            
                    Connect.GetInstance().out.write(byteCommand);
                    Connect.GetInstance().out.flush();
                } catch (IOException ex) {
                    Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        };
  timer.schedule( task,0, 1000 );
  
    }
    
    public String GetDataTable(int IdTable){
        JSONObject jsO = new JSONObject();
        JSONObject jsUsers = new JSONObject();
        JSONObject jsUser = new JSONObject();
        try {
            for (Map.Entry<Integer,UserTable> User : TableList.get(IdTable).Users.entrySet()) {
                jsUser.put("CartOne", User.getValue().CartOne);
                jsUser.put("CartTwo", User.getValue().CartTwo);
                jsUser.put("Dialer", User.getValue().Dialer);
                jsUser.put("UserBet", User.getValue().UserBet);
                jsUser.put("UserCash", User.getValue().UserCash);
                jsUsers.put("User"+User.getKey(), jsUser);
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
        
        return jsO.toString();
    }
    
    public synchronized static TableStatus GetInstance(){
        return instanse;
    }
    
    public String GetListTable(){
        JSONArray jsArr = new JSONArray();
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
                js.put("type", tableHoldem.getValue().getType());
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
