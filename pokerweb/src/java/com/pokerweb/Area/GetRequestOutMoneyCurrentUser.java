/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Area;

import com.pokerweb.DB.DBManager;
import com.pokerweb.registration.UserAllInformation;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 *
 * @author vadim
 */
@WebServlet(name = "GetRequestOutMoneyCurrentUser", urlPatterns = {"/GetRequestOutMoneyCurrentUser"})
public class GetRequestOutMoneyCurrentUser extends HttpServlet {

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
        try{
            StringBuilder jb = new StringBuilder();
            String line = null;
            UserAllInformation ubi=new UserAllInformation();
            BufferedReader reader = request.getReader();
            DBManager DBM = DBManager.GetInstance();
            while ((line = reader.readLine()) != null)
                jb.append(line);
            
            JSONObject jsonObject = new JSONObject(jb.toString());
            int PageNum = jsonObject.getInt("PageNum");
            int Range = jsonObject.getInt("Range");
            UserAllInformation UserInfo = null;
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            
            UserInfo = DBM.GetCurrentUserAllInfo(auth.getName());
            int Role = UserInfo.Role;
            if(UserInfo == null )
                return;
            JSONObject js = new JSONObject();
            List<FieldOutMoney> LFOM = DBM.GetRequestOutMoneyNoAcceptedCurrUser(PageNum,Range,auth.getName());
            JSONObject UserData;
            if(LFOM != null)
                for(FieldOutMoney item : LFOM){
                    UserData = new JSONObject();
                    UserData.append("DateRequest", item.Date_request);
                    UserData.append("Sum", item.Sum);
                    UserData.append("BalanceRequest", item.Balance_request);
                    UserData.append("Manager", item.Login_Manager);
                    UserData.append("BalanceResponse", item.Balance_post_response);
                    UserData.append("DateResponse", item.Date_response);
                    UserData.append("Status", item.Status);
                    js.append("User", UserData);
                }
            long CountRequest = DBM.GetCountRequestOutMoneyNoAccepted(auth.getName());
            if(CountRequest != 0)
            js.append("Count", CountRequest);
            
            response.setContentType("application/json; charset=utf-8");
            response.setHeader("Cache-Control", "no-cache");
            response.getWriter().write(js.toString());
                        
        } catch (JSONException ex) {
            Logger.getLogger(ValidateTab1.class.getName()).log(Level.SEVERE, null, ex);
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
