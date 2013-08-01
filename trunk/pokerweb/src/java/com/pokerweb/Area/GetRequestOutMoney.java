/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Area;

import com.pokerweb.DB.DBManager;
import com.pokerweb.registration.UserAllInformation;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
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

/**
 *
 * @author vadim
 */
@WebServlet(name = "GetRequestOutMoney", urlPatterns = {"/GetRequestOutMoney"})
public class GetRequestOutMoney extends HttpServlet {

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
            ResultSet rs = DBM.GetCurrentUserAllInfo();
            rs.first();
            int Role = rs.getInt("role_id");
            if(Role <= 1)
                return;
            JSONObject js = new JSONObject();
            List<FieldOutMoney> LFOM = DBM.GetRequestOutMoneyNoAccepted(PageNum,Range);
            JSONObject UserData;
            if(LFOM != null)
                for(FieldOutMoney item : LFOM){
                    UserData = new JSONObject();
                    UserData.append("Login", item.Login);
                    UserData.append("Date", item.Date);
                    UserData.append("Sum", item.Sum);
                    UserData.append("Balance", item.Balance);
                    UserData.append("Id", item.Id);
                    js.append("User", UserData);
                }
            int CountRequest = DBM.GetCountRequestOutMoneyNoAccepted();
            if(CountRequest != 0)
            js.append("Count", CountRequest);
            
            response.setContentType("application/json; charset=utf-8");
            response.setHeader("Cache-Control", "no-cache");
            response.getWriter().write(js.toString());
                        
        } catch (JSONException ex) {
            Logger.getLogger(ValidateTab1.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SaveInfoTab3.class.getName()).log(Level.SEVERE, null, ex);
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
