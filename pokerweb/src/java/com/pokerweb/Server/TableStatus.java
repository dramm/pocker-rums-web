/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Server;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author vadim
 */
public class TableStatus {
    private static TableStatus instanse = new TableStatus();
    public boolean NewData;
    public String JsonString;
    public String Table1User;
    public String Table2User;
    public String Table3User;
    public String Table1;
    public String Table2;
    public String Table3;
    private TableStatus(){
        NewData = false;
    Table1User = "";
    Table2User = "";
    Table3User = "";
    Table1 = "";
    Table2 = "";
    Table3 = "";
    }
    
    public static TableStatus GetInstance(){
        return instanse;
    }
    
    public String GetNewData() throws JSONException{
        try {
            if(!NewData){
                byte[] byteCommand = Functions.intToByteArray(1010);
                Connect.GetInstance().out.write(byteCommand);
                Connect.GetInstance().out.flush();
                return "Request";
            }
            JSONObject jsonObject = new JSONObject();
            if(Table1.length() > 0)
            jsonObject.append("Table1", Table1);
            if(Table2.length() > 0)
            jsonObject.append("Table2", Table2);
            if(Table3.length() > 0)
            jsonObject.append("Table3", Table3);
            if(Table1User.length() > 0)
            jsonObject.append("Table1User", Table1User);
            if(Table2User.length() > 0)
            jsonObject.append("Table2User", Table2User);
            if(Table3User.length() > 0)
            jsonObject.append("Table3User", Table3User);
            Table1 = "";
            Table2 = "";
            Table3 = "";
            Table1User = "";
            Table2User = "";
            Table3User = "";
            NewData = false;
           return jsonObject.toString();
            // return  JsonString;
        
        } catch (IOException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public void SetNewUserData(String data){
        try {
          //  JsonString = data;
            JSONObject jsonObject = new JSONObject(data);
            String Table = jsonObject.getString("Table");
            if(Table.equals("First"))
                Table1User = data;
            if(Table.equals("Second"))
                Table2User = data;
            if(Table.equals("Third")){
                Table3User = data;
                NewData = true;
            }
            
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void SetNewStageData(String data){
        try {
         //   JsonString = data;
            JSONObject jsonObject = new JSONObject(data);
            String Table = jsonObject.getString("Table");
            if(Table.equals("First"))
                Table1 = data;
            if(Table.equals("Second"))
                Table2 = data;
            if(Table.equals("Third")){
                Table3 = data;
                NewData = true;
            }
        } catch (JSONException ex) {
            Logger.getLogger(TableStatus.class.getName()).log(Level.SEVERE, null, ex);
        }   
    }
}
