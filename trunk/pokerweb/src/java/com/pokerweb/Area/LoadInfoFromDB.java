/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Area;

import com.pokerweb.DB.DBManager;
import com.pokerweb.registration.UserAllInformation;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author vadim
 */
@WebServlet(name = "LoadInfoFromDB", urlPatterns = {"/LoadInfoFromDB"})
public class LoadInfoFromDB extends HttpServlet {

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
            JSONObject js = new JSONObject();
            UserAllInformation ubi=new UserAllInformation();
            ResultSet rs = DBManager.GetInstance().GetCurrentUserAllInfo();
            ResultSet Pay_info = DBManager.GetInstance().GetPaymentInfoCurrentUser();
            ResultSet PaySysResultSet = DBManager.GetInstance().GetAllPaySys();
            boolean res = rs.first();
            ubi.name = rs.getString(1);
            ubi.surname = rs.getString(2);
            ubi.second_name = rs.getString(3);
            ubi.country = rs.getString(4);
            ubi.balance = rs.getFloat(5);
            ubi.email = rs.getString(6);
            ubi.tel = rs.getString(7);
            if(Pay_info.first()){
                ubi.Passport = Pay_info.getString(1);
                ubi.Pay_sys = Pay_info.getInt(2);
                ubi.Score = Pay_info.getString(3);
               
                js.append("Score",ubi.Score);
                js.append("Passport",ubi.Passport);
                js.append("Pay_sys",ubi.Pay_sys);
            }               
            JSONArray arrayOptionPaySystem = new JSONArray();
            while (PaySysResultSet.next()) 
                arrayOptionPaySystem.put(PaySysResultSet.getString(1));
            
            js.append("Name",ubi.name);
            js.append("Surname",ubi.surname);
            js.append("Second",ubi.second_name);
            js.append("Country",ubi.country);
            js.append("Balance",ubi.balance);
            String email = ubi.email.substring(0,1);
            email += "***";
            email += ubi.email.substring(ubi.email.indexOf("@"),ubi.email.length());
            js.append("Email",email);
            js.append("Phone",ubi.tel);
            js.append("SelectOptions",arrayOptionPaySystem.toString());
            
            response.setContentType("application/json; charset=utf-8");
            response.setHeader("Cache-Control", "no-cache");
            response.getWriter().write(js.toString());                  
        } catch (JSONException ex) {
            Logger.getLogger(LoadInfoFromDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LoadInfoFromDB.class.getName()).log(Level.SEVERE, null, ex);
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
