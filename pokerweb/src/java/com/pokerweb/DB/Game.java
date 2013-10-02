/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.DB;

import com.pokerweb.Config.ConfigManager;
import com.pokerweb.Config.FieldJdbc;
import com.pokerweb.Server.TableStatus;
import com.pokerweb.Server.UserBet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author vadim
 */
public class Game{
    public boolean CalculateBalanceUser(JSONArray Winners){
        PreparedStatement stmt = null;
            String query = null;
            Connection connection;
        try {
            
             FieldJdbc FieldJ; 
                 FieldJ = new ConfigManager().GetPropJdbc();
                 
                 String driverName = "com.mysql.jdbc.Driver";
                 Class.forName(driverName);
                 String url = "jdbc:mysql://"+FieldJ.serverName+":"+FieldJ.port+"/"+FieldJ.database;
                 connection = DriverManager.getConnection(url, FieldJ.username, FieldJ.password);
            for (int i = 0; i<Winners.length(); i++){
                try {
                    JSONObject UserWinn = new JSONObject(Winners.get(i).toString());
                   try {
                        query = "UPDATE users SET balance = balance + " + UserWinn.getDouble("winnSize") + " where id = ?";
                        stmt = connection.prepareStatement(query);
                        stmt.setLong(1, UserWinn.getLong("playerId"));
                        stmt.executeUpdate();
                        
                        query = "UPDATE user_bet SET sum_win = sum_win + ? where id_user = ? and id_game = ? and id = ?";
                        stmt = connection.prepareStatement(query);
                        stmt.setDouble(1, UserWinn.getDouble("winnSize"));
                        stmt.setLong(2, UserWinn.getLong("playerId"));
                        stmt.setLong(3, TableStatus.GetInstance().GetRound());
                        stmt.setLong(4, UserWinn.getLong("IdBet"));
                        stmt.executeUpdate();
                        TableStatus.GetInstance().WinnUserList.clear();
                    } catch (SQLException ex) {
                        Logger.getLogger(Game.class.getName()).log(Level.SEVERE, null, ex);
                        stmt.close();
                        connection.close();
                        return false;
                    }
                 } catch (JSONException ex) {
                    Logger.getLogger(Game.class.getName()).log(Level.SEVERE, null, ex);
                    stmt.close();
                    connection.close();
                    return false;
                }
             }
            stmt.close();
            connection.close();
             return true;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Game.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(Game.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
 
    
    public long WriteBetsCurrentStage(UserBet ub){
         Connection connection;
         PreparedStatement stmt = null;
        try {
            
            FieldJdbc FieldJ; 
            FieldJ = new ConfigManager().GetPropJdbc();
            
            String driverName = "com.mysql.jdbc.Driver";
            Class.forName(driverName);
            String url = "jdbc:mysql://"+FieldJ.serverName+":"+FieldJ.port+"/"+FieldJ.database;
            connection = DriverManager.getConnection(url, FieldJ.username, FieldJ.password);
            long IdBet = 0;
            
            Long UserId = DBManager.GetInstance().GetCurrentUserId();
                String query="insert user_bet("
                        + "id_user,"
                        + "id_game,"
                        + "user_ip,"
                        + "user_agent,"
                        + "balance_start,"
                        + "balance_finish,"
                        + "sum_bet,"
                        + "date_bet"
                        + ") "
                        + "values(?,?,?,?,(select balance from users where id = ?),?,?,NOW())";
                stmt = connection.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
                stmt.setLong(1, UserId);
                stmt.setLong(2, TableStatus.GetInstance().GetRound());
                stmt.setLong(3, 123);
                stmt.setString(4, "0");
                DBManager.GetInstance().GetCurrentUserAllInfo();
                stmt.setLong(5, UserId);
                stmt.setDouble(6, 0);
                stmt.setDouble(7, ub.Sum);
                stmt.executeUpdate();
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if(generatedKeys.next()){
                    IdBet = generatedKeys.getLong(1);
                }
                for (Map.Entry<Integer,List<Integer>> object : ub.TableHand.entrySet()) {
                    for (Integer hand : object.getValue()) {
                    
                query = "insert into bet_hand(id_bet,hand) values(?,?)";
                stmt = connection.prepareStatement(query);
                stmt.setLong(1, IdBet);
                stmt.setLong(2, ((object.getKey()+1)*10)+(hand+1));
                stmt.executeUpdate();
                }
            }
                
       query = "UPDATE users as t1 SET t1.balance = t1.balance - " + ub.Sum + " where t1.id = ?";
            stmt = connection.prepareStatement(query);
            stmt.setLong(1, UserId);
            stmt.executeUpdate();
            stmt.close();
            connection.close();
            return IdBet;
        } catch (SQLException ex) {
            Logger.getLogger(Game.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Game.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
    
    public JSONArray GetCurrentUserGameStatistic(){
        Connection connection;
        PreparedStatement stmt = null;
        FieldJdbc FieldJ; 
            FieldJ = new ConfigManager().GetPropJdbc();
            
            String driverName = "com.mysql.jdbc.Driver";
            
            
        try {
            Class.forName(driverName);
            
            String url = "jdbc:mysql://"+FieldJ.serverName+":"+FieldJ.port+"/"+FieldJ.database;
            connection = DriverManager.getConnection(url, FieldJ.username, FieldJ.password);
            JSONArray jsA = new JSONArray();
            String query = "SELECT id,date_bet," +
                    "sum_bet," +
                    "sum_win " +
                    "FROM user_bet where id_user = ? ORDER BY date_bet desc " +
                    "LIMIT 11 OFFSET 0;";
            stmt = connection.prepareStatement(query);
            stmt.setLong(1,DBManager.GetInstance().GetCurrentUserId());
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                JSONObject bet = new JSONObject();
                bet.put("date", rs.getString("date_bet"));
                bet.put("sum_bet", rs.getDouble("sum_bet"));
                bet.put("sum_win", rs.getDouble("sum_win"));
                query = "SELECT id_bet,hand FROM pokerwebdb.bet_hand where id_bet = ?";
                stmt = connection.prepareStatement(query);
                stmt.setLong(1,rs.getLong("id"));
                ResultSet rsTwo = stmt.executeQuery();
                String hands = "";
                while(rsTwo.next()){
                hands += rsTwo.getString("hand")+",";
                }
                bet.put("hands",hands);
                jsA.put(bet);
            }
            stmt.close();
            rs.close();
            connection.close();
            return jsA;
        } catch (SQLException ex) {
            Logger.getLogger(Game.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } catch (JSONException ex) {
            Logger.getLogger(Game.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Game.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }finally{
        if(stmt != null)
            try {
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
        
            
    }
    
    public JSONObject GetAllUserGameStatistic(int limit,int offset){
        try {
            PreparedStatement stmt = null;
            JSONArray jsA = new JSONArray();
            String query = "select t1.id_game,"
                    + "t5.login,"
                    + "t4.s as sum_bet,"
                    + "t1.sum_win,"
                    + "t1.date_bet,t6.c as count "
                    + "from user_bet as t1,"
                    + "bet_table as t3,"
                    + "users as t5,"
                    + "(select id_user,id_game, sum(sum_bet) as s from user_bet group by id_game) as t4,"
                    + "(select count(t7.c) as c from (select count(*) as c from user_bet group by id_game) as t7) as t6 " 
                    + "where " 
                    + " t3.id_bet=t1.id and " 
                    + " t4.id_user=t1.id_user and " 
                    + " t4.id_game=t1.id_game and t5.id=t1.id_user "  
                    + "group by t1.id_game LIMIT ? OFFSET ?";
            stmt = DBManager.GetInstance().connection.prepareStatement(query);
            stmt.setInt(1, limit);
            stmt.setInt(2, offset);
            
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                JSONObject bet = new JSONObject();
                bet.put("id_game", rs.getLong("id_game"));
                bet.put("login", rs.getString("login"));
                bet.put("sum_bet", rs.getDouble("sum_bet"));
                bet.put("date_bet", rs.getString("date_bet"));
                bet.put("sum_win", rs.getDouble("sum_win"));
                jsA.put(bet);
            }
            JSONObject jsO = new JSONObject();
            jsO.put("rows", jsA);
            rs.first();
            jsO.put("records", rs.getInt("count"));
            return jsO;
        } catch (SQLException ex) {
            Logger.getLogger(Game.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } catch (JSONException ex) {
            Logger.getLogger(Game.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
            
    }
}
