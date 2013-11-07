/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Area;

import com.pokerweb.DB.DBManager;
import com.pokerweb.DB.Game;
import com.pokerweb.Server.TableStatus;
import com.pokerweb.registration.UserAllInformation;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author vadim
 */
@WebServlet(name = "GetStatisticUserBet", urlPatterns = {"/GetStatisticUserBet"})
public class GetStatisticUserBet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            StringBuilder jb = new StringBuilder();
               String line = null;
               UserAllInformation ubi=new UserAllInformation();
               BufferedReader reader = request.getReader();
               while ((line = reader.readLine()) != null)
                   jb.append(line);
               JSONObject jsonObject = new JSONObject(jb.toString());
               JSONObject js = new JSONObject();
               js.put("ok", true);
               int index = jsonObject.getInt("index");
                String Token = "";
              for (Cookie object : request.getCookies()) 
                if(object.getName().equals("JSESSIONID"))
                    Token = object.getValue();
            if(Token.length() <= 0)
                return;
              boolean correct = TableStatus.GetInstance().SendGetBet(index,Token);
               JSONObject jsO = new JSONObject();
               jsO.put("correct", correct);
            response.setContentType("application/json; charset=utf-8");
            response.setHeader("Cache-Control", "no-cache");
            response.getWriter().write(jsO.toString());
        } catch (JSONException ex) {
            Logger.getLogger(GetStatisticUserBet.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
