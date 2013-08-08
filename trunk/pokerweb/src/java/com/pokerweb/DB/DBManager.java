/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.DB;

import com.pokerweb.Area.FieldOutMoney;
import com.pokerweb.Config.ConfigManager;
import com.pokerweb.Config.FieldJdbc;
import com.pokerweb.crypto.CryptoManager;
import com.pokerweb.mail.NewPassFromMail;
import com.pokerweb.mail.SendConfirmRegistMessage;
import com.pokerweb.mail.SendConfirmSettingMessage;
import com.pokerweb.registration.UserAllInformation;
import com.pokerweb.registration.UserBasicInformation;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
/**
 *
 * @author vadim
 */
public class DBManager{
    private Connection connection;
    private static DBManager instanse = new DBManager();
    private DBManager(){
        try {
            FieldJdbc FieldJ; 
            FieldJ = new ConfigManager().GetPropJdbc();
            
            String driverName = "com.mysql.jdbc.Driver";
            Class.forName(driverName);
            String url = "jdbc:mysql://"+FieldJ.serverName+":"+FieldJ.port+"/"+FieldJ.database;
            connection = DriverManager.getConnection(url, FieldJ.username, FieldJ.password);
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private DBManager CreateNewInstanse(){
        instanse = new DBManager();
        return instanse;
    }
    
    private boolean ConnectIsStable(){
        PreparedStatement stmt = null;
        try {
            String query="select 1";
            stmt = connection.prepareStatement(query);
            stmt.executeQuery(query);
            return true;
        } catch (Exception e) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, e);
        return false;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
     public long GetCountAllUser(){
        PreparedStatement stmt = null;
        try {
            String query="SELECT count(id) as count FROM users";
             stmt = connection.prepareStatement(query);
                ResultSet rs = stmt.executeQuery();
                if(!rs.first())
                    return 0;
                else
                    return rs.getLong("count");
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    
    public long GetCountRequestOutMoneyNoAccepted(){
        PreparedStatement stmt = null;
        try {
            String query="SELECT count(id) as count FROM request_out_money where status=0";
             stmt = connection.prepareStatement(query);
                ResultSet rs = stmt.executeQuery();
                if(!rs.first())
                    return 0;
                else
                    return rs.getLong("count");
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
   public boolean ExecuteActionOverUser(Map<Long,Integer> lst){
       PreparedStatement stmt = null;
       Long UserId = GetCurrentUserId();
       String BlockUserQuery = "Update users "
               + "Set banned=true,"
               + "banned_date=now(),"
               + "banned_admin_id = ? "
               + "where id = ?";
       String UnBlockUserQuery = "Update users "
               + "Set banned = false,"
               + "banned_date='1999-01-01 00:00:00',"
               + "banned_admin_id = 0 "
               + "where id = ?";
       String ConvertToUserQuery = "Update user_roles "
               + "Set role_id = 3 "
               + "where user_id = ?";
       String ConvertToManagerQuery = "Update user_roles "
               + "Set role_id = 2 "
               + "where user_id = ?";
       try {
       for (Map.Entry<Long, Integer> entry : lst.entrySet()){
           if(entry.getValue() == 1){  
                   stmt = connection.prepareStatement(ConvertToManagerQuery);
                   stmt.setLong(1, entry.getKey());
                   stmt.executeUpdate();
                   stmt.close();
           }
           if(entry.getValue() == 2){  
                   stmt = connection.prepareStatement(ConvertToUserQuery);
                   stmt.setLong(1, entry.getKey());
                   stmt.executeUpdate();
                   stmt.close();
           }
           if(entry.getValue() == 3){  
                   stmt = connection.prepareStatement(BlockUserQuery);
                   stmt.setLong(1, UserId);
                   stmt.setLong(2, entry.getKey());
                   stmt.executeUpdate();
                   stmt.close();
           }
           if(entry.getValue() == 4){  
                   stmt = connection.prepareStatement(UnBlockUserQuery);
                   stmt.setLong(1, entry.getKey());
                   stmt.executeUpdate();
                   stmt.close();
           }
       }
       return true;
       } catch (SQLException ex) {
           Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
           return false;
       }
       finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
   }
    
    public boolean AcceptOutMoney(Map<Long,Map<Integer,String>> arr,String UserAgent){
        PreparedStatement stmt = null;
        try {
            long IdManager = GetCurrentUserId();
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            WebAuthenticationDetails details =  (WebAuthenticationDetails) auth.getDetails();
            String remoteAddress = details.getRemoteAddress();
            String query = "Update request_out_money "
                    + "Set status=?,comment=?,"
                    + "id_manager=?"
                    + " where id=? and status = 0";
            
            String queryLog="Update log_money_transaction as t1,"
                    + "request_out_money as t2,"
                    + "users as t3 "
                    + "SET t1.date_starting_response=now(),"
                    + "t1.id_manager=?,"
                    + "t1.ip_manager=INET_ATON(?),"
                    + "t1.balance_starting_response=t3.balance,"
                    + "t1.manager_agent=?,t1.comment=?"
                    + " where t1.id_user=t3.id and"
                    + " t2.id_user=t3.id and"
                    + " t2.id=? and t2.id=t1.id and"
                    + " t2.status=?;";
             for (Map.Entry<Long,Map<Integer,String>> entry : arr.entrySet()){
                 for (Map.Entry<Integer,String> item : entry.getValue().entrySet()) {
                     stmt = connection.prepareStatement(query);
                     if(item.getKey() == 1)
                         stmt.setInt(1, 1);
                     else
                         stmt.setInt(1, 3);
                     stmt.setString(2, item.getValue());
                     stmt.setLong(3, IdManager);
                     stmt.setLong(4,entry.getKey());
                     stmt.executeUpdate();
                     stmt.close();
                     
                     stmt = connection.prepareStatement(queryLog);
                     stmt.setLong(1, IdManager);
                     stmt.setString(2, remoteAddress);
                     stmt.setString(3,UserAgent);
                     stmt.setString(4,item.getValue());
                     stmt.setLong(5,entry.getKey());
                     if(item.getKey() == 1)
                         stmt.setInt(6,1);
                     else
                         stmt.setInt(6,3);
                     stmt.executeUpdate();
                     stmt.close();
                 }
             }
            
            query = " Update users as t1,request_out_money as t4 "
                    + "Set t1.balance = t1.balance-(select sum(sum) "
                    + "from (select * from request_out_money) as t3 "
                    + "where t3.id=? and t3.id_user=t1.id  and "
                    + "status=1) "
                    + "where t1.id in (select t3.id_user "
                    + "from (select * from request_out_money) as t3"
                    + " where t3.id=? and status=1) "
                    + "and t4.id_user=t1.id and t4.id=?;";
            
            for (Map.Entry<Long,Map<Integer,String>> entry : arr.entrySet()){
                 for (Map.Entry<Integer,String> item : entry.getValue().entrySet()) {
                     if(item.getKey() == 2)
                         continue;
                     stmt = connection.prepareStatement(query);
                     stmt.setLong(1, entry.getKey());
                     stmt.setLong(2, entry.getKey());
                     stmt.setLong(3, entry.getKey());
                     stmt.executeUpdate();
                     stmt.close();
                 }
             }
            
            query = "Update request_out_money as t1,users as t2 "
                    + "Set t1.balance_response=t2.balance,t1.status=?,"
                    + "data_response=now() "
                    + "where t1.id=? and t2.id=t1.id_user";
            
            queryLog="Update log_money_transaction as t1,"
                    + " request_out_money as t2,"
                    + "users as t3 "
                    + "SET t1.date_completed=now(),"
                    + "t1.balance_completed_response=t3.balance "
                    + "where t1.id_user=t3.id and"
                    + " t2.id_user=t3.id and"
                    + " t2.id=? and"
                    + " t2.status=?";
            
            for (Map.Entry<Long,Map<Integer,String>> entry : arr.entrySet()){
                 for (Map.Entry<Integer,String> item : entry.getValue().entrySet()) {
                     if(item.getKey() == 2)
                         continue;
                      stmt = connection.prepareStatement(query);
                      stmt.setInt(1,item.getKey());
                      stmt.setLong(2,entry.getKey());
                      stmt.executeUpdate();
                      stmt.close();
                      
                      stmt = connection.prepareStatement(queryLog);
                      stmt.setLong(1,entry.getKey());
                      stmt.setInt(2,item.getKey());
                      stmt.executeUpdate();
                      stmt.close();
              
                 }
             }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public List<FieldOutMoney> GetRequestOutMoneyNoAcceptedCurrUser(int PageNum,int Range){
        PreparedStatement stmt = null;
        try {
            Long IdUser=GetCurrentUserId();
            String query="SELECT '' as id_manager,"
                    + "sum,"
                    + "balance_request,"
                    + "'' as balance_responce,"
                    + "data_request,"
                    + "data_response,"
                    + "status "
                    + "from request_out_money as t4"
                    + " where t4.id_user=? and t4.status=0 "
                    + "union all "
                    + "SELECT t1.login,"
                    + "sum,"
                    + "balance_request,"
                    + "balance_response,"
                    + "data_request,"
                    + "data_response,"
                    + "status "
                    + "from users as t1,"
                    + "request_out_money as t2"
                    + " where t2.id_user=? and"
                    + " t1.id=t2.id_manager and t2.status=2"
                    + " LIMIT ? OFFSET ? ";
            List<FieldOutMoney> LFOM = new ArrayList<FieldOutMoney>();
            FieldOutMoney FOM;
            stmt = connection.prepareStatement(query);
            stmt.setLong(1, IdUser);
            stmt.setLong(2, IdUser);
            stmt.setInt(3, Range);
            stmt.setInt(4, PageNum);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                FOM = new FieldOutMoney();
                FOM.Login_Manager = rs.getString("id_manager");
                FOM.Sum = rs.getDouble("sum");
                FOM.Balance_request = rs.getDouble("balance_request");
                FOM.Balance_post_response = rs.getDouble("balance_responce");
                FOM.Date_request = rs.getString("data_request");
                FOM.Date_response = rs.getString("data_response");
                FOM.Status = rs.getInt("status");
                LFOM.add(FOM);
            }
            return LFOM;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public List<UserAllInformation> GetAllUserInfo(int PageNum,int Range){
        PreparedStatement stmt = null;
        try {
            String query="SELECT t1.id,"
                    + "t1.login,"
                    + "t1.register_date,"
                    + "t3.role_name,"
                    + "t1.balance,"
                    + "t1.banned,"
                    + "t1.activated "
                    + "from users as t1,"
                    + "user_roles as t2,"
                    + "roles as t3 "
                    + "where t3.id=t2.role_id and"
                    + " t2.user_id=t1.id "
                    + "LIMIT ? OFFSET ? ";
            List<UserAllInformation> UsersInfo = new ArrayList<UserAllInformation>();
            UserAllInformation UserInfo;
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, Range);
            stmt.setInt(2, PageNum);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                UserInfo = new UserAllInformation();
                UserInfo.Id= rs.getLong("id");
                UserInfo.login = rs.getString("login");
                UserInfo.register_date = rs.getString("register_date");
                UserInfo.RoleName = rs.getString("role_name");
                UserInfo.balance = rs.getDouble("balance");
                UserInfo.banned = rs.getBoolean("banned");
                UserInfo.Activated = rs.getBoolean("activated");
                UsersInfo.add(UserInfo);
            }
            return UsersInfo;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public List<FieldOutMoney> GetRequestOutMoneyNoAccepted(int PageNum,int Range){
        PreparedStatement stmt = null;
        try {
            String query="SELECT login,"
                    + "sum,"
                    + "data_request,"
                    + "balance,"
                    + "t1.id as id "
                    + "FROM request_out_money as t1,"
                    + "users as t2 "
                    + "where t1.id_user=t2.id and t1.status=0"
                    + " LIMIT ? OFFSET ? ";
            List<FieldOutMoney> LFOM = new ArrayList<FieldOutMoney>();
            FieldOutMoney FOM;
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, Range);
            stmt.setInt(2, PageNum);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                FOM=new FieldOutMoney();
                FOM.Date_request = rs.getString("data_request");
                FOM.Login = rs.getString("login");
                FOM.Sum = rs.getFloat("sum");
                FOM.Balance_request = rs.getDouble("balance");
                FOM.Id = rs.getLong("id");
                LFOM.add(FOM);
            }
            return LFOM;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public AuthenticationField GetUserAccessFromLogin(String Login){
        AuthenticationField autF = new AuthenticationField();
        PreparedStatement stmt = null;
        try {
            String query="select password,"
                    + "role_id "
                    + "from users,"
                    + "user_roles "
                    + "where login=? and activated=true and user_id=id and banned=false";
            stmt = connection.prepareStatement(query);
            stmt.setString(1, Login);
            ResultSet rs = stmt.executeQuery();
            if(rs.first()){
            autF.Password = rs.getString("password");
            autF.Role = rs.getInt("role_id");
            }
            return autF;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public static DBManager GetInstance(){
            if(!instanse.ConnectIsStable())
               instanse.CreateNewInstanse();
        return instanse;
    }
    
    public String GetCurrentUserLogin(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if(auth == null)
            return null;
        return auth.getName();
    }
    
    public boolean SetNewDateOnline(){
        PreparedStatement stmt = null;
        try {
            long idUser = GetCurrentUserId();
            if(idUser==0)
                return false;
            String query="Update stat_logins Set logout=now() "
                + "where id=(select id "
                + "from (select * from stat_logins) as t1 "
                + "where t1.user_id=? and "
                + "t1.id=any(select max(id) "
                + "from (select * from stat_logins) as t2 "
                + "where t2.user_id=t1.user_id))";
            stmt = connection.prepareStatement(query);
                   stmt.setLong(1, idUser);
                   stmt.executeUpdate();
                   return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public long GetCurrentUserId(){
        PreparedStatement stmt = null;
        try {
            String query="select id from users where login=?";
            stmt = connection.prepareStatement(query);
            String name = GetCurrentUserLogin();
            if(name == null)
                return 0;
            stmt.setString(1, name);
            ResultSet rs = stmt.executeQuery();
            if(!rs.first())
                return 0;
            return rs.getLong(1);
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    } 
    
    
    public List<String> GetAllPaySys(){
        PreparedStatement stmt = null;
        List<String> ListPaySys = new ArrayList<String>();
        try {
            String query="select title from pay_sys";
            stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
                ListPaySys.add(rs.getString("title"));
            return ListPaySys;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public boolean SendConfirmNewSettingsCurrUser(){
        PreparedStatement stmt = null;
        try {
            UUID uuid = UUID.randomUUID();
              String Login = GetCurrentUserLogin();
              String query="insert into token_user("
                       + "id_user,"
                       + "token_confirm,"
                       + "type_confirm,"
                       + "date_request,"
                       + "date_response,"
                       + "confirmed) "
                       + "values((select id from users where login=?),'"
                       +uuid.toString()+"',2,now(),'1999-01-01 00:00:00',false)";
               stmt = connection.prepareStatement(query);
               stmt.setString(1, Login);
               stmt.executeUpdate();
               SendConfirmSettingMessage SendCSM = new SendConfirmSettingMessage();
               UserAllInformation UserInfo = GetCurrentUserAllInfo();
               SendCSM.SetMail(UserInfo.email);
               SendCSM.SetToken(uuid.toString());
               Thread myT = new Thread(SendCSM);
               myT.start();
               return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public PaymentField GetPaymentInfoCurrentUser(){
        PaymentField PF = new PaymentField();
        PreparedStatement stmt = null;
        try {
            long idUser = GetCurrentUserId();
            if(idUser == 0)
                return null;
            String query="select passport,"
                    + "pay_sys,"
                    + "score "
                    + "from payment_info "
                    + "where id_user=?";
            stmt = connection.prepareStatement(query);
            stmt.setLong(1, idUser);
            ResultSet rs = stmt.executeQuery();
            if(rs.first()){
                PF.Passport = rs.getString("passport");
                PF.Pay_sys = rs.getInt("pay_sys");
                PF.Score = rs.getString("score");
            }
            return PF;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
        
    }
      
    public boolean ExistsNewSettingsCurUser(long Id){
        PreparedStatement stmt = null;
        try {
            String query="select * "
                    + "from request_edit_user_info "
                    + "where id_user=? and processed=true";
                    stmt = connection.prepareStatement(query);
                    stmt.setLong(1, Id);
                   ResultSet rs = stmt.executeQuery();
                      if(!rs.first())
                          return false;
                      else
                          return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public boolean UpdateCurrentUserTempInfoScore(String Score){
        PreparedStatement stmt = null;
        try {
            PaymentField PF = GetPaymentInfoCurrentUser();
            String OldScore = PF.Score;
            if(Score.equals(OldScore))
                return true;
            String Login = GetCurrentUserLogin();
            long Id = GetIdFromLogin(Login);
            String query="INSERT INTO request_edit_user_info("
                     + "id_user,"
                     + "type,"
                     + "date_request,"
                     + "data"
                     + ") "
                     + "values(?,6,now(),?)";
              stmt = connection.prepareStatement(query);
              stmt.setLong(1, Id);
              stmt.setString(2, Score);
              stmt.executeUpdate();
              return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public boolean UpdateCurrentUserTempInfoPaySys(int PaySys){
        PreparedStatement stmt = null;
        try {
            PaymentField PF = GetPaymentInfoCurrentUser();
            int OldPaySys = PF.Pay_sys;
            if(PaySys == OldPaySys)
                return true;
            String Login = GetCurrentUserLogin();
            long Id = GetIdFromLogin(Login);
            String query="INSERT INTO request_edit_user_info("
                     + "id_user,"
                     + "type,"
                     + "date_request,"
                     + "data"
                     + ") "
                     + "values(?,5,now(),?)";
              stmt = connection.prepareStatement(query);
              stmt.setLong(1, Id);
              stmt.setInt(2, PaySys);
              stmt.executeUpdate();
              return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public boolean UpdateCurrentUserTempInfoPassport(String Passport){
        PreparedStatement stmt = null;
        try {
            PaymentField PF = GetPaymentInfoCurrentUser();
            String OldPassport = PF.Passport;
            if(Passport.equals(OldPassport))
                return true;
            String Login = GetCurrentUserLogin();
            long Id = GetIdFromLogin(Login);
             String query="INSERT INTO request_edit_user_info("
                     + "id_user,"
                     + "type,"
                     + "date_request,"
                     + "data"
                     + ") "
                     + "values(?,4,now(),?)";
              stmt = connection.prepareStatement(query);
              stmt.setLong(1, Id);
              stmt.setString(2, Passport);
              stmt.executeUpdate();
              return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public boolean UpdateCurrentUserTempInfoPhone(String Phone){
        PreparedStatement stmt = null;
        try {
            UserAllInformation UserInfo = GetCurrentUserAllInfo();
            if(Phone.equals(UserInfo.tel))
                return true;
            String Login = GetCurrentUserLogin();
            long Id = GetIdFromLogin(Login);
              
           String query="INSERT INTO request_edit_user_info("
                     + "id_user,"
                     + "type,"
                     + "date_request,"
                     + "data"
                     + ") "
                     + "values(?,3,now(),?)";
              stmt = connection.prepareStatement(query);
              stmt.setLong(1, Id);
              stmt.setString(2, Phone);
              stmt.executeUpdate();
              return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public boolean UpdateCurrentUserTempInfoPassword(String Password){
        PreparedStatement stmt = null;
        try {
            UserAllInformation UserInfo = GetCurrentUserAllInfo();
            String EncodePass = CryptoManager.GetEnctyptPassword(Password);
            if(EncodePass.equals(UserInfo.password))
                return true;
            String Login = GetCurrentUserLogin();
            Long Id = GetIdFromLogin(Login);
            String query="INSERT INTO request_edit_user_info("
                     + "id_user,"
                     + "type,"
                     + "date_request,"
                     + "data"
                     + ") "
                     + "values(?,2,now(),?)";
              stmt = connection.prepareStatement(query);
              stmt.setLong(1, Id);
              stmt.setString(2, Password);
              stmt.executeUpdate();
              return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public boolean UpdateCurrentUserTempInfoMail(String Mail){
        PreparedStatement stmt = null;
        try {
            UserAllInformation UserInfo = GetCurrentUserAllInfo();
            if(Mail.equals(UserInfo.email))
                return true;
            String Login = GetCurrentUserLogin();
            long Id = GetIdFromLogin(Login);
             String query="INSERT INTO request_edit_user_info("
                     + "id_user,"
                     + "type,"
                     + "date_request,"
                     + "data"
                     + ") "
                     + "values(?,1,now(),?)";
              stmt = connection.prepareStatement(query);
              stmt.setLong(1, Id);
              stmt.setString(2, Mail);
              stmt.executeUpdate();
              return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public UserAllInformation GetCurrentUserAllInfo(){
        UserAllInformation UserInfo = new UserAllInformation();
        PreparedStatement stmt = null;
        String query="select "
                + "name,"
                + "surname,"
                + "second_name,"
                + "country,"
                + "balance,"
                + "email,"
                + "tel,"
                + "password,role_id"
                + " from users,user_roles where login=? and user_id=id";
        try {
            stmt = connection.prepareStatement(query);
            String name = GetCurrentUserLogin();
            if(name == null)
                return null;
            stmt.setString(1, name);
            ResultSet rs = stmt.executeQuery();
            if(rs.first()){
                UserInfo.name = rs.getString("name");
                UserInfo.surname = rs.getString("surname");
                UserInfo.second_name = rs.getString("second_name");
                UserInfo.country = rs.getString("country");
                UserInfo.balance = rs.getDouble("balance");
                UserInfo.email = rs.getString("email");
                UserInfo.tel = rs.getString("tel");
                UserInfo.password = rs.getString("password");
                UserInfo.Role = rs.getInt("role_id");
            }
            return UserInfo;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
        
    
    }
    
    public boolean UserExists(String login){
        PreparedStatement stmt = null;
     String query="select * from users where login=?";
        try {
            stmt = connection.prepareStatement(query);
            stmt.setString(1, login);
            ResultSet rs = stmt.executeQuery();
            if(rs.first())                                  
                return true;
            else
                return false;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
          finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public boolean UpdateUserInfoAreaT1(String Name,
            String Surname,
            String Second_name,
            String Country){
        PreparedStatement stmt = null;
        try {
            String query="UPDATE users SET name=?,surname=?,second_name=?,country=? WHERE login=?";
            String login = GetCurrentUserLogin();
            if(login == null)
                return false;
            stmt = connection.prepareStatement(query);
               stmt.setString(1, Name);
               stmt.setString(2, Surname);
               stmt.setString(3, Second_name);
               stmt.setString(4, Country);
               stmt.setString(5, login);
               stmt.executeUpdate();
             return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
          finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public boolean SetNewUser(UserBasicInformation ubi){
        PreparedStatement stmt = null;
        try {
            String query="insert into users("
                    + "login,"
                    + "password,"
                    + "email,"
                    + "surname,"
                    + "name,"
                    + "tel,"
                    + "register_date)" +
                    "values(?,?,?,?,?,?,now());";
          //  java.util.Date dt = new java.util.Date();
          //  java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
          //  String currentTime = sdf.format(dt);
            stmt = connection.prepareStatement(query);
            String EncoderS = CryptoManager.GetEnctyptPassword(ubi.password);
            stmt.setString(1, ubi.login);
            stmt.setString(2, EncoderS);
            stmt.setString(3, ubi.email);
            stmt.setString(4, ubi.surname);
            stmt.setString(5, ubi.name);
            stmt.setString(6, ubi.tel);
            stmt.executeUpdate();
            stmt.close();
            query="insert into user_roles("
                    + "role_id,user_id)"
                    + " values(3,(select id from users where login=?))";
            stmt = connection.prepareStatement(query);
            stmt.setString(1, ubi.login);
            stmt.executeUpdate();
            stmt.close();
            UUID uuid = UUID.randomUUID();
            
            query="insert into token_user("
                    + "id_user,"
                    + "token_confirm,"
                    + "type_confirm,"
                    + "date_request) "
                    + "values((select id from users where login=?),'"
                    +uuid.toString()+"',1,now())";
            stmt = connection.prepareStatement(query);
            stmt.setString(1, ubi.login);
            stmt.executeUpdate();
            stmt.close();
            query="insert into payment_info(id_user,passport,pay_sys,score) "
                    + "values((select id from users where login=?),'',0,'')";
            stmt = connection.prepareStatement(query);
            stmt.setString(1, ubi.login);
            stmt.executeUpdate();
            stmt.close();
            SendConfirmRegistMessage sm=new SendConfirmRegistMessage();
            sm.SetMail(ubi.email);
            sm.SetToken(uuid.toString());
            Thread myT = new Thread(sm);
            myT.start();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        return false;
        }
          finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    
    public boolean ConfirmPrivatAreaToken(String token){
        PreparedStatement stmt = null;
        try {
          String query="select id_user from token_user where token_confirm=? and type_confirm=2 and confirmed=false";
          stmt = connection.prepareStatement(query);
          stmt.setString(1, token);
          ResultSet rs = stmt.executeQuery();
          if(!rs.first())
              return false;
         long Id = rs.getLong("id_user");
         stmt.close();
         String Login = GetLoginFromId(Id);
         query="select t1.type,t1.data"
                  + " from request_edit_user_info as t1"
                  + " where id_user=? and processed=false and "
                  + "date_request=(select max(t2.date_request) "
                  + "from request_edit_user_info as t2 "
                  + "where t2.type=t1.type and t2.id_user=t1.id_user and t2.processed=false)";
          stmt = connection.prepareStatement(query);
          stmt.setLong(1, Id);
          rs = stmt.executeQuery();
          while(rs.next()){
              switch(rs.getInt("type")){
                  case 1:
                      SetUserNewMail(rs.getString("data"),Login);
                      break;
                  case 2:
                      SetUserNewPassword(rs.getString("data"), Login);
                      break;
                  case 3:
                      SetUserNewPhone(rs.getString("data"), Login);
                      break;
                  case 4:
                      SetUserNewPassport(rs.getString("data"), Id);
                      break;
                  case 5:
                      SetUserNewPaySys(rs.getString("data"), Id);
                      break;
                  case 6:
                      SetUserNewScore(rs.getString("data"), Id);
                      break;
              }
          }
          stmt.close();
          query="Update request_edit_user_info Set processed=true,date_response=now()"
                  + " where id in (select t1.id "
                  + "from (select * from request_edit_user_info) as t1"
                  + " where t1.id_user=? and t1.processed=false and "
                  + "t1.date_request=(select max(t2.date_request)"
                  + " from (select * from request_edit_user_info) as t2"
                  + " where t2.type=t1.type and t2.id_user=t1.id_user and t2.processed=false));";
          stmt = connection.prepareStatement(query);
          stmt.setLong(1, Id);
          stmt.executeUpdate();
          stmt.close();
          query="Update token_user Set date_response=now(),confirmed=true WHERE id_user=?";
          stmt = connection.prepareStatement(query);
          stmt.setLong(1, Id);
          stmt.executeUpdate();
          stmt.close();
          return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
          finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public boolean SetUserNewScore(String Score,long Id){
        PreparedStatement stmt = null;
        try {
            String query="UPDATE payment_info SET score=? WHERE id_user=?";
                    stmt = connection.prepareStatement(query);
                    stmt.setString(1, Score);
                    stmt.setLong(2, Id);
                    stmt.executeUpdate();
                    return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
          finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
     public boolean SetUserNewPaySys(String PaySys,long Id){
         PreparedStatement stmt = null;
        try {
            String query="UPDATE payment_info SET pay_sys=? WHERE id_user=?";
                    stmt = connection.prepareStatement(query);
                    stmt.setString(1, PaySys);
                    stmt.setLong(2, Id);
                    stmt.executeUpdate();
                    return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
          finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
     public boolean SetUserNewPassport(String Passport,long Id){
         PreparedStatement stmt = null;
        try {
            String query="UPDATE payment_info SET passport=? WHERE id_user=?";
                    stmt = connection.prepareStatement(query);
                    stmt.setString(1, Passport);
                    stmt.setLong(2, Id);
                    stmt.executeUpdate();
                    return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
          finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
     public boolean SetUserNewPhone(String Phone,String Login){
         PreparedStatement stmt = null;
        try {
            String query="UPDATE users SET tel=? WHERE login=?";
                    stmt = connection.prepareStatement(query);
                    stmt.setString(1, Phone);
                    stmt.setString(2, Login);
                    stmt.executeUpdate();
                    return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
          finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
     public boolean SetUserNewPassword(String Password,String Login){
         PreparedStatement stmt = null;
        try {
            String query="UPDATE users SET password=? WHERE login=?";
                    stmt = connection.prepareStatement(query);
                    stmt.setString(1, Password);
                    stmt.setString(2, Login);
                    stmt.executeUpdate();
                    return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
          finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public boolean SetUserNewMail(String Mail,String Login){
        PreparedStatement stmt = null;
        try {
            String query="UPDATE users SET email=? WHERE login=?";
                    stmt = connection.prepareStatement(query);
                    stmt.setString(1, Mail);
                    stmt.setString(2, Login);
                    stmt.executeUpdate();
                    return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
          finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
  
    public boolean ConfirmRegistToken(String token){
        PreparedStatement stmt = null;
        try {
          String query="(select id_user from token_user where token_confirm=? and type_confirm=1 and confirmed=false)";
          stmt = connection.prepareStatement(query);
          stmt.setString(1, token);
          ResultSet rs = stmt.executeQuery();
          if(!rs.first())
              return false;
          long IdUser = rs.getLong("id_user");
          stmt.close();
          stmt.executeUpdate("UPDATE users SET activated=true WHERE id="+IdUser);
          stmt.close();
          query="UPDATE token_user SET confirmed=true,date_response=now() WHERE token_confirm=?";
          stmt = connection.prepareStatement(query);
          stmt.setString(1, token);
          stmt.executeUpdate();
          stmt.close();
        return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        return false;
        }
          finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    private String GetLoginFromId(long Id){
        PreparedStatement stmt = null;
        try {
            String query="select login from users where id=?";
                 stmt = connection.prepareStatement(query);
                 stmt.setLong(1, Id);
                 ResultSet rs = stmt.executeQuery();
                 if(!rs.first())
                     return null;
                 else
                     return rs.getString("login");
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
          finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    private long GetIdFromLogin(String login){
        PreparedStatement stmt = null;
        try {
            String query="(select id from users where login=?)";
                 stmt = connection.prepareStatement(query);
                 stmt.setString(1, login);
                 ResultSet rs = stmt.executeQuery();
                 if(!rs.first())
                     return -1;
                 else
                     return rs.getLong("id");
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
          finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    
    public boolean SetNewRequestOutMoney(double Sum,String UserAgent){
        PreparedStatement stmt = null;
        try {
            UserAllInformation UserInfo = GetCurrentUserAllInfo();
            String Login = GetCurrentUserLogin();
            long Id = GetIdFromLogin(Login);
            String query="insert into request_out_money("
                    + "id_user,"
                    + "sum,"
                    + "data_request,"
                    + "balance_request) "
                    + "values(?,?,now(),?) ";
            stmt = connection.prepareStatement(query);
            stmt.setLong(1, Id);
            stmt.setDouble(2, Sum);
            stmt.setDouble(3, UserInfo.balance);
            stmt.executeUpdate();
            stmt.close();
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            WebAuthenticationDetails details =  (WebAuthenticationDetails) auth.getDetails();
            String remoteAddress = details.getRemoteAddress();  
            query="insert into log_money_transaction("
                    + "id_user,"
                    + "sum,"
                    + "current_balance,"
                    + "date_request,"
                    + "user_agent,"
                    + "ip_user) "
                    + "values(?,?,?,now(),?,INET_ATON(?)) ";
            stmt = connection.prepareStatement(query);
            stmt.setLong(1, Id);
            stmt.setDouble(2, Sum);
            stmt.setDouble(3, UserInfo.balance);
            stmt.setString(4, UserAgent);
            stmt.setString(5, remoteAddress);
            stmt.executeUpdate();
            stmt.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
          finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    
    public boolean SetStatisticUserLogin(String login,String ipAddress,String userAgent){
        PreparedStatement stmt = null;
        try {
            String query="UPDATE users SET last_login=now() WHERE login=?";
            stmt = connection.prepareStatement(query);
            stmt.setString(1, login);
            stmt.executeUpdate();
            stmt.close();
            query="insert into stat_logins("
                    + "user_id,"
                    + "login_time,"
                    + "logout,"
                    + "ip,"
                    + "user_agent"
                    + ")"
                    + "values("
                    + "?,"
                    + "now(),"
                    + "'1999-01-01 00:00:00',"
                    + "INET_ATON(?),"
                    + "?)";
            long UserId = GetIdFromLogin(login);
            if(UserId<0)
                return false;
            stmt = connection.prepareStatement(query);
            stmt.setLong(1, UserId);
            stmt.setString(2, ipAddress);
            stmt.setString(3, userAgent);
            stmt.executeUpdate();
            stmt.close();
               return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
          finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public boolean SetNewPassReset(String token,String Pass){
        PreparedStatement stmt = null;
        try {
               Long IdUser = 0L;
               String query="select id_user from token_user where token_confirm=?";
               stmt = connection.prepareStatement(query);
               stmt.setString(1, token);
               ResultSet rs = stmt.executeQuery();
               if(!rs.first())
                   return false;
               IdUser = rs.getLong("id_user");
              query="Update users Set password=? where id=?";
               stmt = connection.prepareStatement(query);
               stmt.setString(1, CryptoManager.GetEnctyptPassword(Pass));
               stmt.setLong(2,IdUser );
               stmt.executeUpdate();
                   return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public boolean ConfirmNewPass(String token){
        PreparedStatement stmt = null;
        try {
            UUID uuid = UUID.randomUUID();
              String query="select id_user from token_user where token_confirm=?";
               stmt = connection.prepareStatement(query);
               stmt.setString(1, token);
               ResultSet rs = stmt.executeQuery();
               if(!rs.first())
                   return false;
               if(rs.getString("id_user") != null)
                   return true;
               return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public boolean SendConfirmNewPass(String Login){
        PreparedStatement stmt = null;
        try {
            UUID uuid = UUID.randomUUID();
              String query="insert into token_user("
                       + "id_user,"
                       + "token_confirm,"
                       + "type_confirm,"
                       + "date_request,"
                       + "date_response,"
                       + "confirmed) "
                       + "values((select id from users where login=?),'"
                       +uuid.toString()+"',3,now(),'1999-01-01 00:00:00',false)";
               stmt = connection.prepareStatement(query);
               stmt.setString(1, Login);
               stmt.executeUpdate();
               query="select email from users where login=?";
               stmt = connection.prepareStatement(query);
               stmt.setString(1, Login);
               ResultSet rs = stmt.executeQuery();
               if(!rs.first())
                   return false;
               String Mail = rs.getString("email");
               NewPassFromMail SendCSM = new NewPassFromMail();
               SendCSM.SetMail(Mail);
               SendCSM.SetToken(uuid.toString());
               Thread myT = new Thread(SendCSM);
               myT.start();
               return true;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
}