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
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vadim
 */
public class Game{
    public boolean CalculateBalanceUser(Map<Integer,Integer> Bets){
        
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
                        + "values(?,?,?,?,?,?)";
                stmt = DBManager.GetInstance().connection.prepareStatement(query);
                stmt.setLong(1, item.getKey());
                stmt.setLong(2, TableStatus.GetInstance().Round);
                stmt.setLong(3, 123);
                stmt.setString(4, "0");
                stmt.setDouble(5, DBManager.GetInstance().GetCurrentUserAllInfo().balance);
                stmt.setDouble(6, 0);
                stmt.executeUpdate();
                
                query = "select id from user_bet ORDER BY id DESC";
                ResultSet rs = stmt.executeQuery(query);
                if(!rs.first())
                    return false;
                Long id_bet = rs.getLong("id");
                
                for (Map.Entry<Integer,Map<Integer,Double>> table : item.getValue().TableHand.entrySet()) {
                    query = "insert bet_table(id_bet,id_table,flop_one,flop_two,flop_three,tern) values(?,?,?,?,?,?)";
                    stmt = DBManager.GetInstance().connection.prepareStatement(query);
                    stmt.setLong(1, id_bet);
                    stmt.setLong(1, table.getKey());
                
                }
                
            }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Game.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
