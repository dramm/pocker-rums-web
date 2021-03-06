/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Game;

import com.pokerweb.Server.TableStatus;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
@WebServlet(name = "GameChanges", urlPatterns = {"/GameChanges"},asyncSupported = true)
public class GameChanges extends HttpServlet {

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
//        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//       System.out.println("RUNGET");
//            StringBuilder jb = new StringBuilder();
//            String line = null;
//            BufferedReader reader = request.getReader();
//            while ((line = reader.readLine()) != null)
//                jb.append(line);
//            Cookie[] c = request.getCookies();
//            String Token = null;
//            String Data = null;
//            if(c != null){
//            try {
//                for (Cookie object : c)
//                    if(object.getName().equals("JSESSIONID"))
//                        Token = object.getValue();
//                JSONObject jsonObject = new JSONObject(jb.toString());
//                Data = TableStatus.GetInstance().GetNewData(jsonObject.getInt("start"),Token);
//            } catch (JSONException ex) {
//                Logger.getLogger(GameChanges.class.getName()).log(Level.SEVERE, null, ex);
//            }
//            }
//            response.setContentType("application/json; charset=utf-8");
//            response.setHeader("Cache-Control", "no-cache");
//            response.getWriter().write(Data);
//            
//            System.out.println("!!!!");
        
 request.setCharacterEncoding("UTF-8");
        request.setAttribute("org.apache.catalina.ASYNC_SUPPORTED", true);
        AsyncContext asyncCtx = request.startAsync();
        asyncCtx.addListener(new AppAsyncListener());
        ScheduledThreadPoolExecutor executor = new ScheduledThreadPoolExecutor(10);
         Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        executor.execute(new GameChangesAsync(asyncCtx,auth.getName()));  
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
