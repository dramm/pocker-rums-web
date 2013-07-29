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
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
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
@WebServlet(name = "AjaxController", urlPatterns = {"/AjaxController"})
public class AjaxController extends HttpServlet {

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
    private ServletContext context;
   // private ComposerData compData = new ComposerData();
   // private HashMap composers = compData.getComposers();
    
        @Override
    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
    }
        
        
         @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            boolean namesAdded = false;
            StringBuilder jb = new StringBuilder();
            String line = null;
            UserBasicInformation ubi=new UserBasicInformation();
            BufferedReader reader = request.getReader();
                while ((line = reader.readLine()) != null)
                    jb.append(line);
                try {
                    JSONObject jsonObject = new JSONObject(jb.toString());
                    ubi.login = jsonObject.getString("login");
                    ubi.password = jsonObject.getString("password");
                    ubi.confpassword = jsonObject.getString("confirmPassword");
                    ubi.email = jsonObject.getString("email");
                    ubi.tel = jsonObject.getString("tel");
                    ubi.name = jsonObject.getString("name");
                    ubi.surname = jsonObject.getString("surname");
                    JSONObject js = new JSONObject();
                    
                    if(DBManager.GetInstance().UserExists(ubi.login)){
                        js.append("Login","логин занят");
                        namesAdded = true;
                    }
                    else
                    if(!ValidationField.ValidLogin(ubi.login)){
                      js.append("Login","заполните поле логина");
                      namesAdded = true;
                    }
                    
                    if(!ValidationField.ValidEmail(ubi.email)){
                      js.append("Mail","mail указан не верно");
                      namesAdded = true;
                    }
                    
                    if(!ValidationField.ValidPassword(ubi.password)){
                      js.append("Pass","пароль указан не верно");
                      namesAdded = true;
                    }
                    
                    if(!ValidationField.ValidConfPassword(ubi.password, ubi.confpassword)){
                      js.append("PassConf","пароли не совпадают");
                      namesAdded = true;
                    }
                    
                    if(!ValidationField.ValidName(ubi.name)){
                      js.append("Name","имя введено не корректно");
                      namesAdded = true;
                    }
                    
                    if(!ValidationField.ValidSurname(ubi.surname)){
                        js.append("Surname","фамилия введена не корректно");
                        namesAdded = true;
                    }
                    
                    if(!ValidationField.ValidPhone(ubi.tel)){
                        js.append("Tel","телефон введена не корректно");
                        namesAdded = true;
                    }
              
              if (namesAdded) {
                  response.setContentType("application/json; charset=utf-8");
                  response.setHeader("Cache-Control", "no-cache");
                  response.getWriter().write(js.toString());
              } else 
                  response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        } catch (JSONException ex) {
            Logger.getLogger(AjaxController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        }        
}