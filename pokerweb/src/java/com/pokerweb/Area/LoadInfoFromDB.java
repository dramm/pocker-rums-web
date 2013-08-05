/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Area;

import com.pokerweb.DB.DBManager;
import com.pokerweb.DB.PaymentField;
import com.pokerweb.registration.UserAllInformation;
import java.io.IOException;
import java.util.List;
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
            UserAllInformation UserInfo = DBManager.GetInstance().GetCurrentUserAllInfo();
            PaymentField Pay_info = DBManager.GetInstance().GetPaymentInfoCurrentUser();
            List<String> PaySys = DBManager.GetInstance().GetAllPaySys();
            if(Pay_info != null){
                js.append("Score",UserInfo.Score);
                js.append("Passport",UserInfo.Passport);
                js.append("Pay_sys",UserInfo.Pay_sys);
            }               
            JSONArray arrayOptionPaySystem = new JSONArray();
         
            for (String sys : PaySys)
                arrayOptionPaySystem.put(sys);
         
            js.append("Name",UserInfo.name);
            js.append("Surname",UserInfo.surname);
            js.append("Second",UserInfo.second_name);
            js.append("Country",UserInfo.country);
            js.append("Balance",UserInfo.balance);
            String email = UserInfo.email.substring(0,1);
            email += "***";
            email += UserInfo.email.substring(UserInfo.email.indexOf("@"),UserInfo.email.length());
            js.append("Email",email);
            js.append("Phone",UserInfo.tel);
            js.append("SelectOptions",arrayOptionPaySystem.toString());
            
            response.setContentType("application/json; charset=utf-8");
            response.setHeader("Cache-Control", "no-cache");
            response.getWriter().write(js.toString());                  
        } catch (JSONException ex) {
            Logger.getLogger(LoadInfoFromDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch(IOException e){
            Logger.getLogger(LoadInfoFromDB.class.getName()).log(Level.SEVERE, null, e);
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
