/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Area;

import com.pokerweb.DB.DBManager;
import com.pokerweb.ajax.ValidationField;
import com.pokerweb.crypto.CryptoManager;
import com.pokerweb.registration.UserAllInformation;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
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
@WebServlet(name = "SaveInfoTab6", urlPatterns = {"/SaveInfoTab6"})
public class SaveInfoTab6 extends HttpServlet {

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
            String NewPassport = jsonObject.getString("NewPassport");
            int NewPaySys = jsonObject.getInt("NewPaySys");
            String NewPayNum = jsonObject.getString("NewPayNum");
           
            UserAllInformation UserInfo = DBM.GetCurrentUserAllInfo();
            String CurrentPassword = UserInfo.Passport;
            String ReceptCurrentPassword = jsonObject.getString("CurrentPassword");
            String ReceptCurrentPasswordEn = CryptoManager.GetEnctyptPassword(ReceptCurrentPassword);
            JSONObject js = new JSONObject();
            
            if(ValidationField.ValidConfPassword(CurrentPassword,ReceptCurrentPasswordEn)){
                boolean resPassport = DBM.UpdateCurrentUserTempInfoPassport(NewPassport);
                boolean resPaySys = DBM.UpdateCurrentUserTempInfoPaySys(NewPaySys);
                boolean resPayNum = DBM.UpdateCurrentUserTempInfoScore(NewPayNum);
                               if(resPassport && resPaySys && resPayNum){
                                   js.append("Message","Для подтверждения перейдите по ссылке в письме отправленное вам на почту");
                                   DBM.SendConfirmNewSettingsCurrUser();
                               }else
                                   js.append("Message","Данные введены не корректно");
                             }else
                                  js.append("Message","Данные введены не корректно");
            
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
