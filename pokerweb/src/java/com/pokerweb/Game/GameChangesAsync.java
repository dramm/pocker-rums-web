/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Game;

import com.pokerweb.Server.TableStatus;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.AsyncContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Vadim
 */
public class GameChangesAsync implements Runnable{

    private AsyncContext asyncContext;
    private String Name;

    public GameChangesAsync(AsyncContext asyncContext,String Name) {
        this.asyncContext = asyncContext;
        this.Name = Name;
    }
    
    @Override
    public void run() {
        try {
            System.out.println("RUNGET"+System.currentTimeMillis());
            StringBuilder jb = new StringBuilder();
            String line = null;
            BufferedReader reader = asyncContext.getRequest().getReader();
            while ((line = reader.readLine()) != null)
                jb.append(line);
            Cookie[] c = ((HttpServletRequest)asyncContext.getRequest()).getCookies();
            String Token = null;
            String Data = null;
            if(c != null){
              for (Cookie object : c) 
                if(object.getName().equals("JSESSIONID"))
                    Token = object.getValue();
                System.out.println(jb.toString());
                if(jb.length()>0){
            JSONObject jsonObject = new JSONObject(jb.toString());
                System.out.println("Token-"+Token);
            Data = TableStatus.GetInstance().GetNewData(jsonObject.getInt("start"),Token,Name);
                System.out.println("Data-"+Data);
            }
            }
            asyncContext.getResponse().setContentType("application/json; charset=utf-8");
            ((HttpServletResponse)asyncContext.getResponse()).setHeader("Cache-Control", "no-cache");
            asyncContext.getResponse().getWriter().write(Data);
            
            System.out.println("END-RUNGET"+System.currentTimeMillis());
            asyncContext.complete();
        } catch (IOException ex) {
            Logger.getLogger(GameChangesAsync.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JSONException ex) {
            Logger.getLogger(GameChangesAsync.class.getName()).log(Level.SEVERE, null, ex);
        }
         
     
    }  
    
    
}
