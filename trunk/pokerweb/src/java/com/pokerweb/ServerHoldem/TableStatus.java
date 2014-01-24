/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.ServerHoldem;

import com.pokerweb.Server.Functions;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
    public List<TableHoldem> TableList; 
    private TableStatus(){
        TableList = new ArrayList<TableHoldem>();
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
    
    public synchronized static TableStatus GetInstance(){
        return instanse;
    }
    
    public String GetListTable(){
        JSONArray jsArr = new JSONArray();
        for (TableHoldem tableHoldem : TableList) {
            try {
                JSONObject js = new JSONObject();
                js.put("averageBank", tableHoldem.averageBank);
                js.put("MaxBlinds", tableHoldem.MaxBlinds);
                js.put("MinBlinds", tableHoldem.MinBlinds);
                js.put("distributionCount", tableHoldem.distributionCount);
                js.put("flopView", tableHoldem.flopView);
                js.put("players", tableHoldem.players);
                js.put("type", tableHoldem.type);
                js.put("PlayerSittings", tableHoldem.playersSitting);
                jsArr.put(js);
            } catch (JSONException ex) {
                Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return jsArr.toString();
    }
    
    public boolean SetListTable(String json){
        TableList.clear();
        try {
            JSONObject jsObj = new JSONObject(json);
            for (int i = 0; i < jsObj.getJSONArray("data").length(); i++) {
                TableHoldem table = new TableHoldem();
                table.averageBank = jsObj.getJSONArray("data").getJSONObject(i).getInt("averageBank");
                table.MinBlinds = jsObj.getJSONArray("data").getJSONObject(i).getJSONArray("blinds").getDouble(0);
                table.MaxBlinds = jsObj.getJSONArray("data").getJSONObject(i).getJSONArray("blinds").getDouble(1);
                table.distributionCount = jsObj.getJSONArray("data").getJSONObject(i).getInt("distributionCount");
                table.flopView = jsObj.getJSONArray("data").getJSONObject(i).getInt("flopView");
                table.players = jsObj.getJSONArray("data").getJSONObject(i).getInt("players");
                table.type = jsObj.getJSONArray("data").getJSONObject(i).getInt("type");
                TableList.add(table);
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
