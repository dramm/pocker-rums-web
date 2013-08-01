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
@WebServlet(name = "SaveInfoTab3", urlPatterns = {"/SaveInfoTab3"})
public class SaveInfoTab3 extends HttpServlet {

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
            boolean namesAdded = false;
            StringBuilder jb = new StringBuilder();
            String line = null;
            UserAllInformation ubi=new UserAllInformation();
            BufferedReader reader = request.getReader();
            DBManager DBM = DBManager.GetInstance();
            while ((line = reader.readLine()) != null)
                jb.append(line);
            
            JSONObject jsonObject = new JSONObject(jb.toString());
            String NewMail = jsonObject.getString("NewMail");
            String ConfNewMail = jsonObject.getString("ConfNewMail");
            ResultSet rs = DBM.GetCurrentUserAllInfo();
            rs.first();
            String CurrentPassword = rs.getString("password");
            String ReceptCurrentPassword = jsonObject.getString("CurrentPassword");
            String ReceptCurrentPasswordEn = CryptoManager.GetEnctyptPassword(ReceptCurrentPassword);
            JSONObject js = new JSONObject();
            
            if(ValidationField.ValidConfPassword(CurrentPassword,ReceptCurrentPasswordEn) &&
                    ValidationField.ValidEmail(NewMail) &&
                    ValidationField.ValidEmailConf(NewMail,ConfNewMail)){
                boolean res = DBM.UpdateCurrentUserTempInfoMail(NewMail);
                               if(res){
                                   js.append("Message","Для подтверждения перейдите по ссылке в письме отправленное вам на почту");
                                   DBM.SendConfirmNewSettingsCurrUser();
                               }else
                                   js.append("Message","Данные введены не корректно");
                             }
                             else
                                 js.append("Message","Данные введены не корректно");
            
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