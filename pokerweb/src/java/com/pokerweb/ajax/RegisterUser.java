/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.ajax;

import com.pokerweb.DB.DBManager;
import com.pokerweb.registration.UserBasicInformation;
import java.io.BufferedReader;
import java.io.IOException;
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
@WebServlet(name = "RegisterUser", urlPatterns = {"/RegisterUser"})
public class RegisterUser extends HttpServlet {

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
                UserBasicInformation ubi=new UserBasicInformation();
                BufferedReader reader = request.getReader();
                    while ((line = reader.readLine()) != null)
                        jb.append(line);
                    
                        JSONObject jsonObject = new JSONObject(jb.toString());
                        ubi.login = jsonObject.getString("login");
                        ubi.password = jsonObject.getString("password");
                        ubi.confpassword = jsonObject.getString("confirmPassword");
                        ubi.email = jsonObject.getString("email");
                        ubi.tel = jsonObject.getString("tel");
                        ubi.name = jsonObject.getString("name");
                        ubi.surname = jsonObject.getString("surname");
                        JSONObject js = new JSONObject();
                        
                        
                    if(
                            ValidationField.ValidLogin(ubi.login) &&
                            ValidationField.ValidEmail(ubi.email)  &&
                            ValidationField.ValidPassword(ubi.password) &&
                            ValidationField.ValidConfPassword(ubi.password, ubi.confpassword) &&
                            ValidationField.ValidName(ubi.name) &&
                            ValidationField.ValidSurname(ubi.surname) &&
                            ValidationField.ValidPhone(ubi.tel)
                            ){
                        DBManager v = DBManager.GetInstance();
                        boolean res = v.SetNewUser(ubi);
                        if(res)
                            js.append("Regist","Регистрация прошла успешно");
                        else
                            js.append("Regist","Введенные данные некорректны");
                    }
                    
                  response.setContentType("application/json; charset=utf-8");
                  response.setHeader("Cache-Control", "no-cache");
                  response.getWriter().write(js.toString());   
        } catch (JSONException ex) {
            Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, ex);
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
