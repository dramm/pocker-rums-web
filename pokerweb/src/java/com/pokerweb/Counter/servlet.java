/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Counter;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.ArrayList;
 
public class servlet implements HttpSessionListener {
    private List<String> sessions = new ArrayList<String>();
 
    public servlet() {
    }
 
    
    @Override
    public void sessionCreated(HttpSessionEvent event) {
        HttpSession session = event.getSession();
        sessions.add(session.getId());
        event.getSession().setMaxInactiveInterval(15*60);
        session.setAttribute("counter", this);
    }
 
   
    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        HttpSession session = event.getSession();
        sessions.remove(session.getId());
 
        session.setAttribute("counter", this);
    }
 
    public int getActiveSessionNumber() {
        return sessions.size();
    }
}