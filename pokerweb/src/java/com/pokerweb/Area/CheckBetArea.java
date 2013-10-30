/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pokerweb.Area;

import com.pokerweb.DB.DBManager;
import com.pokerweb.DB.Game;
import com.pokerweb.Server.StatisticBet;
import com.pokerweb.Server.TableStatus;
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
@WebServlet(name = "CheckBetArea", urlPatterns = {"/CheckBetArea"})
public class CheckBetArea extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String Token = "";
              for (Cookie object : request.getCookies()) 
                if(object.getName().equals("JSESSIONID"))
                    Token = object.getValue();
            if(Token.length() <= 0)
                return;
        JSONObject js = new JSONObject();
        for (StatisticBet object : TableStatus.GetInstance().RequestStatisticBet) 
            if(object.ToketUserRequest.equals(Token) && object.IdUserRequest == DBManager.GetInstance().GetCurrentUserId())
                if(TableStatus.GetInstance().StatisticBetCurrentUser.containsKey(object.IdBet)){
                    try {
                        Game GMData = new Game();
                   String data = data = GMData.GetDateFromBet(object.IdBet);
                   TableStatus.GetInstance().StatisticBetCurrentUser.get(object.IdBet).put("date", data);
                 js.put("StatisticCurrentUser", TableStatus.GetInstance().StatisticBetCurrentUser.get(object.IdBet));
                TableStatus.GetInstance().StatisticBetCurrentUser.remove(object.IdBet);
                TableStatus.GetInstance().RequestStatisticBet.remove(TableStatus.GetInstance().StatisticBetCurrentUser.get(object.IdBet));
                    } catch (JSONException ex) {
                    Logger.getLogger(CheckBetArea.class.getName()).log(Level.SEVERE, null, ex);
                }
                }
        response.setContentType("application/json; charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        response.getWriter().write(js.toString());
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
