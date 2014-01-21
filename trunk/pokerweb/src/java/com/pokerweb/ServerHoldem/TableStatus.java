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
    private static TableStatus instanse;
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
        if(instanse == null)
            instanse = new TableStatus();
        return instanse;
    }
    
    public String GetListTable(){
        JSONArray jsArr = new JSONArray();
        for (TableHoldem tableHoldem : TableList) {
            try {
                JSONObject js = new JSONObject();
                js.put("averageBank", tableHoldem.averageBank);
                js.put("blinds", tableHoldem.blinds);
                js.put("distributionCount", tableHoldem.distributionCount);
                js.put("flopView", tableHoldem.flopView);
                js.put("players", tableHoldem.players);
                js.put("type", tableHoldem.type);
                jsArr.put(js);
            } catch (JSONException ex) {
                Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return jsArr.toString();
    }
    
    public boolean SetListTable(String json){
        try {
            JSONArray jsArr = new JSONArray(json);
            for (int i = 0; i < jsArr.length(); i++) {
                TableHoldem table = new TableHoldem();
                table.averageBank = jsArr.getJSONObject(i).getInt("averageBank");
                table.blinds = jsArr.getJSONObject(i).getString("blinds");
                table.distributionCount = jsArr.getJSONObject(i).getInt("distributionCount");
                table.flopView = jsArr.getJSONObject(i).getInt("flopView");
                table.players = jsArr.getJSONObject(i).getInt("players");
                table.type = jsArr.getJSONObject(i).getString("type");
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
