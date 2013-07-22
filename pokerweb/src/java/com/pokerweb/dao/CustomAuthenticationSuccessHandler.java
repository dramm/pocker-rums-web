/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.dao;

import com.pokerweb.DB.DBManager;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

/**
 *
 * @author vadim
 */
public class CustomAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
  // getters and setters for injected services

  @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
      try {
          response.sendRedirect("/index");
      } catch (IOException ex) {
          Logger.getLogger(CustomAuthenticationSuccessHandler.class.getName()).log(Level.SEVERE, null, ex);
      }
      WebAuthenticationDetails details = (WebAuthenticationDetails) authentication.getDetails();
      String remoteAddress = details.getRemoteAddress();  
      String userAgent = request.getHeader("User-Agent");
      DBManager.GetInstance().SetStatisticUserLogin(authentication.getName(), remoteAddress,userAgent);
   }
}