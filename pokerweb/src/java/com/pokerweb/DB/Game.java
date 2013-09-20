/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.DB;

import com.pokerweb.Server.TableStatus;
import com.pokerweb.Server.UserBet;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    public boolean CalculateBalanceUser(){
       PreparedStatement stmt = null;
       String query = null;
        for (Map.Entry<Long, Double> entry : TableStatus.GetInstance().WinnUserList.entrySet()) {
           try {
               query = "UPDATE users SET balance = balance + " + entry.getValue() + " where id = ?";
               stmt = DBManager.GetInstance().connection.prepareStatement(query);
               stmt.setLong(1, entry.getKey());
               stmt.executeUpdate();
               
               query = "UPDATE user_bet SET sum_win = ? where id_user = ? and id_game = ?";
               stmt = DBManager.GetInstance().connection.prepareStatement(query);
               stmt.setDouble(1, entry.getValue());
               stmt.setLong(2, entry.getKey());
               stmt.setLong(3, TableStatus.GetInstance().Round);
               stmt.executeUpdate();
               TableStatus.GetInstance().WinnUserList.clear();
           } catch (SQLException ex) {
               Logger.getLogger(Game.class.getName()).log(Level.SEVERE, null, ex);
           }
        }
        return true;
    }
 
    
    public boolean WriteBetsCurrentStage(){
        try {
            PreparedStatement stmt = null;
            for (Map.Entry<Long,UserBet> item : TableStatus.GetInstance().Bets.entrySet()) {
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
                stmt = DBManager.GetInstance().connection.prepareStatement(query);
                stmt.setLong(1, item.getKey());
                stmt.setLong(2, TableStatus.GetInstance().Round);
                stmt.setLong(3, 123);
                stmt.setString(4, "0");
                DBManager.GetInstance().GetCurrentUserAllInfo();
                stmt.setLong(5, item.getKey());
                stmt.setDouble(6, 0);
                stmt.setDouble(7, item.getValue().Sum);
                stmt.executeUpdate();
                query = "select id from user_bet where id_game="+TableStatus.GetInstance().Round+" and id_user="+item.getKey()+" order by id DESC";
                ResultSet rs = stmt.executeQuery(query);
                if(!rs.first())
                    return false;
                Long id_bet = rs.getLong("id");
                
                for (Map.Entry<Integer,List<Integer>> table : item.getValue().TableHand.entrySet()) {
                    
                    if(TableStatus.GetInstance().Stage == 1){
                        query = "insert bet_table(id_bet,id_table) values(?,?)";
                        stmt = DBManager.GetInstance().connection.prepareStatement(query);
                        stmt.setLong(1, id_bet);
                        stmt.setLong(2, table.getKey());
                        stmt.executeUpdate();
                }
                    if (TableStatus.GetInstance().Stage == 2){
                        query = "select id from bet_table where id_bet = ? and id_table = ?";
                        stmt = DBManager.GetInstance().connection.prepareStatement(query);
                        stmt.setLong(1, id_bet);
                        stmt.setLong(2, table.getKey());
                        rs = stmt.executeQuery();
                        if(!rs.first()){
                            query = "insert bet_table(id_bet,id_table) values(?,?)";
                            stmt = DBManager.GetInstance().connection.prepareStatement(query);
                            stmt.setLong(1, id_bet);
                            stmt.setLong(2, table.getKey());
                            stmt.executeUpdate();
                        }
                        query = "UPDATE bet_table SET flop_one = ?,flop_two = ?,flop_three = ? where id_bet = ? and id_table = ?";
                        stmt = DBManager.GetInstance().connection.prepareStatement(query);
                        stmt.setLong(4, id_bet);
                        stmt.setLong(5, table.getKey());
                            if(table.getKey() == 0){
                                stmt.setInt(1, TableStatus.GetInstance().TableOne.FlopOne);
                                stmt.setInt(2, TableStatus.GetInstance().TableOne.FlopTwo);
                                stmt.setInt(3, TableStatus.GetInstance().TableOne.FlopThree);
                        }
                        
                        if(table.getKey() == 1){
                            stmt.setInt(1, TableStatus.GetInstance().TableTwo.FlopOne);
                            stmt.setInt(2, TableStatus.GetInstance().TableTwo.FlopTwo);
                            stmt.setInt(3, TableStatus.GetInstance().TableTwo.FlopThree);
                        }
                        
                        if(table.getKey() == 2){
                            stmt.setInt(1, TableStatus.GetInstance().TableThree.FlopOne);
                            stmt.setInt(2, TableStatus.GetInstance().TableThree.FlopTwo);
                            stmt.setInt(3, TableStatus.GetInstance().TableThree.FlopThree);
                        }
                        stmt.executeUpdate();
                    }
                    
                    if(TableStatus.GetInstance().Stage == 3){
                         query = "select id from bet_table where id_bet = ? and id_table = ?";
                        stmt = DBManager.GetInstance().connection.prepareStatement(query);
                        stmt.setLong(1, id_bet);
                        stmt.setLong(2, table.getKey());
                        rs = stmt.executeQuery();
                        if(!rs.first()){
                        query = "insert bet_table(id_bet,id_table) values(?,?)";
                        stmt = DBManager.GetInstance().connection.prepareStatement(query);
                        stmt.setLong(1, id_bet);
                        stmt.setLong(2, table.getKey());
                        stmt.executeUpdate();
                        }
                        query = "UPDATE bet_table SET tern = ? where id_bet = ? and id_table = ?";
                        stmt = DBManager.GetInstance().connection.prepareStatement(query);
                        stmt.setLong(2, id_bet);
                        stmt.setLong(3, table.getKey());   
                        if(table.getKey() == 0)
                            stmt.setInt(1, TableStatus.GetInstance().TableOne.Tern);
                        
                        if(table.getKey() == 1)
                            stmt.setInt(1, TableStatus.GetInstance().TableTwo.Tern);
                     
                        if(table.getKey() == 2)
                            stmt.setInt(1, TableStatus.GetInstance().TableThree.Tern);
                    stmt.executeUpdate();
                    }
                    
                    query = "select id from bet_table where id_bet = ? and id_table = ?";
                        stmt = DBManager.GetInstance().connection.prepareStatement(query);
                        stmt.setLong(1, id_bet);
                        stmt.setLong(2, table.getKey());
                        rs = stmt.executeQuery();
                        if (!rs.first())
                            return false;
                        Long id_table = rs.getLong("id");
                        
                        query = "INSERT INTO bet_stage(id_bet_table,stage) values(?,?)";
                        stmt = DBManager.GetInstance().connection.prepareStatement(query);
                        stmt.setLong(1, id_table);
                        stmt.setLong(2, TableStatus.GetInstance().Stage);
                        stmt.executeUpdate();
                        
                        query = "select id from bet_stage where id_bet_table = ? and stage = ?";
                        stmt = DBManager.GetInstance().connection.prepareStatement(query);
                        stmt.setLong(1, id_table);
                        stmt.setLong(2, TableStatus.GetInstance().Stage);
                        rs = stmt.executeQuery();
                        if (!rs.first())
                            return false;
                        Long id_table_stage = rs.getLong("id");
                    
                    for (Integer hand : table.getValue()) {
                        query = "INSERT INTO bet_hand(id_bet_stage,id_hand,factor,date_bet,cart_one,cart_two,sum,win) values(?,?,?,NOW(),?,?,?,?)";
                        stmt = DBManager.GetInstance().connection.prepareStatement(query);
                        stmt.setLong(1, id_table_stage);
                        stmt.setInt(2, hand);
                        if(table.getKey() == 0){
                            stmt.setDouble(3, TableStatus.GetInstance().TableOne.Hands.get(hand).Factor);
                            stmt.setInt(4, TableStatus.GetInstance().TableOne.Hands.get(hand).CartOne);
                            stmt.setInt(5, TableStatus.GetInstance().TableOne.Hands.get(hand).CartTwo);
                       
                        }
                        
                        if(table.getKey() == 1){
                            stmt.setDouble(3, TableStatus.GetInstance().TableTwo.Hands.get(hand).Factor);
                            stmt.setInt(4, TableStatus.GetInstance().TableTwo.Hands.get(hand).CartOne);
                            stmt.setInt(5, TableStatus.GetInstance().TableTwo.Hands.get(hand).CartTwo);
                        }
                        
                        if(table.getKey() == 2){
                            stmt.setDouble(3, TableStatus.GetInstance().TableThree.Hands.get(hand).Factor);
                            stmt.setInt(4, TableStatus.GetInstance().TableThree.Hands.get(hand).CartOne);
                            stmt.setInt(5, TableStatus.GetInstance().TableThree.Hands.get(hand).CartTwo);
                        }
                        
                        stmt.setDouble(6, item.getValue().Sum);
                        stmt.setBoolean(7, false);
                        stmt.executeUpdate();
                    }
                }
            query = "UPDATE users as t1 SET t1.balance = t1.balance - " + item.getValue().Sum + " where t1.id = ?";
            stmt = DBManager.GetInstance().connection.prepareStatement(query);
            stmt.setLong(1, item.getKey());
            stmt.executeUpdate();
            }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Game.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public JSONObject GetCurrentUserGameStatistic(int limit,int offset){
        try {
            PreparedStatement stmt = null;
            JSONArray jsA = new JSONArray();
            String query = "select t1.id_game,t1.id_user," +
"                    t4.s as sum_bet," +
"                    t1.sum_win,t1.date_bet,t5.c as count" +
"                    from user_bet as t1," +
"                    bet_table as t3," +
"                    (select id_user,id_game, sum(sum_bet) as s from user_bet group by id_game) as t4," +
"(select count(t6.c) as c from (select count(*) as c from user_bet where id_user=? group by id_game) as t6) as t5 " +
"                    where " +
"                    t3.id_bet=t1.id and" +
"                     t4.id_user=t1.id_user and" +
"                     t4.id_game=t1.id_game and t1.id_user=? " +
"                    group by t1.id_game  LIMIT ? OFFSET ?";
            stmt = DBManager.GetInstance().connection.prepareStatement(query);
            stmt.setLong(1, DBManager.GetInstance().GetCurrentUserId());
            stmt.setLong(2, DBManager.GetInstance().GetCurrentUserId());
            stmt.setInt(3, limit);
            stmt.setInt(4, offset);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                JSONObject bet = new JSONObject();
                bet.put("id_game", rs.getLong("id_game"));
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
