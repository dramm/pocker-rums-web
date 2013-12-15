/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pokerweb.Area;

import com.pokerweb.Server.TableStatus;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author vadim
 */
@WebServlet(name = "GetCasinoBalance", urlPatterns = {"/GetCasinoBalance"})
public class GetCasinoBalance extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

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
    @SuppressWarnings("empty-statement")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TableStatus.GetInstance().GetCasinoBalanceFromServer();
        JSONObject js = new JSONObject();
        while(TableStatus.GetInstance().BalanseServer == null || 
                TableStatus.GetInstance().BalanseServer.balance == -1 || 
                TableStatus.GetInstance().BalanseServer.profit == -1 ||
                TableStatus.GetInstance().BalanseServer.spareMoney == -1 ||
                TableStatus.GetInstance().BalanseServer.persent == -1);
            try {
                js.put("balance", TableStatus.GetInstance().BalanseServer.balance);
                js.put("profit", TableStatus.GetInstance().BalanseServer.profit);
                js.put("spareMoney", TableStatus.GetInstance().BalanseServer.spareMoney);
                js.put("persent", TableStatus.GetInstance().BalanseServer.persent);
                TableStatus.GetInstance().BalanseServer = null;
                response.setContentType("application/json; charset=utf-8");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write(js.toString());
            } catch (JSONException ex) {
                Logger.getLogger(GetCasinoBalance.class.getName()).log(Level.SEVERE, null, ex);
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
