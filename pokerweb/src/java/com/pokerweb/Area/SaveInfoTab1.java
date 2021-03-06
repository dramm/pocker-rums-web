/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Area;

import com.pokerweb.DB.DBManager;
import com.pokerweb.ajax.ValidationField;
import com.pokerweb.registration.UserAllInformation;
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
@WebServlet(name = "SaveInfoTab1", urlPatterns = {"/SaveInfoTab1"})
public class SaveInfoTab1 extends HttpServlet {

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
                    while ((line = reader.readLine()) != null)
                        jb.append(line);
                    
                        JSONObject jsonObject = new JSONObject(jb.toString());
                        ubi.name = jsonObject.getString("Name");
                        ubi.surname = jsonObject.getString("Surname");
                        ubi.second_name = jsonObject.getString("SecondName");
                        ubi.country = jsonObject.getString("Country");
                        JSONObject js = new JSONObject();
                        DBManager DBM = DBManager.GetInstance();
                             if(ValidationField.ValidName(ubi.name) &&
                                ValidationField.ValidSurname(ubi.surname) &&
                                ValidationField.ValidSecond(ubi.second_name) &&
                                ValidationField.ValidCountry(ubi.country)){
                                
                               boolean res = DBM.UpdateUserInfoAreaT1(
                                         ubi.name,
                                         ubi.surname,
                                         ubi.second_name,
                                         ubi.country);
                               if(res)
                                   js.append("Message","Информация сохранена");
                               else
                                   js.append("Message","Данные введены не корректно");
                             }
                             else
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
