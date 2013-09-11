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
                        + "balance_finish"
                        + ") "
                        + "values(?,?,?,?,(select balance from users where id = ?),?)";
                stmt = DBManager.GetInstance().connection.prepareStatement(query);
                stmt.setLong(1, item.getKey());
                stmt.setLong(2, TableStatus.GetInstance().Round);
                stmt.setLong(3, 123);
                stmt.setString(4, "0");
                DBManager.GetInstance().GetCurrentUserAllInfo();
                stmt.setLong(5, item.getKey());
                stmt.setDouble(6, 0);
                stmt.executeUpdate();
                query = "select id from user_bet where id_game=" + TableStatus.GetInstance().Round;
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
}
