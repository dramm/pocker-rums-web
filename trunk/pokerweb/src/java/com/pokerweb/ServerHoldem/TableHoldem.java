/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pokerweb.ServerHoldem;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author vadim
 */
public class TableHoldem {
    private int IdTable;
    private int flopView;
    private int CountMaxUsers;
    private double MinBlinds;
    private double MaxBlinds;
    private int distributionCount; 
    private int averageBank;
    private int CountUsers;
    private int type;
    private double BankTable;
    private int FlopOne;
    private int FlopTwo;
    private int FlopThree;
    private int Tern;
    private int River;
    Map<Integer,UserTable> Users;

    public int getAverageBank() {
         return averageBank;
     }

    public double getBankTable() {
         return BankTable;
     }

    public int getCountMaxUsers() {
         return CountMaxUsers;
     }

    public int getCountUsers() {
         return CountUsers;
     }

    public int getDistributionCount() {
         return distributionCount;
     }

    public int getFlopView() {
         return flopView;
     }

    public int getIdTable() {
         return IdTable;
     }

    public double getMaxBlinds() {
         return MaxBlinds;
     }

    public double getMinBlinds() {
         return MinBlinds;
     }

    public int getType() {
         return type;
     }

    public Map<Integer, UserTable> getUsers() {
         return Users;
     }

    public void setAverageBank(int averageBank) {
         this.averageBank = averageBank;
     }

    public void setBankTable(double BankTable) {
         this.BankTable = BankTable;
     }

    public void setCountMaxUsers(int CountMaxUsers) {
        Users = new HashMap<Integer, UserTable>();
        for(int i = 0; i < CountMaxUsers; i++)
            Users.put(0, new UserTable());
        this.CountMaxUsers = CountMaxUsers;
     }

    public void setCountUsers(int CountUsers) {
         this.CountUsers = CountUsers;
     }

    public void setDistributionCount(int distributionCount) {
         this.distributionCount = distributionCount;
     }

    public void setFlopView(int flopView) {
         this.flopView = flopView;
     }

    public void setIdTable(int IdTable) {
         this.IdTable = IdTable;
     }

    public void setMaxBlinds(double MaxBlinds) {
         this.MaxBlinds = MaxBlinds;
     }

    public void setMinBlinds(double MinBlinds) {
         this.MinBlinds = MinBlinds;
     }

    public void setType(int type) {
         this.type = type;
     }

    public void setUsers(Map<Integer, UserTable> Users) {
         this.Users = Users;
     } 

    public int getFlopOne() {
        return FlopOne;
    }

    public int getFlopThree() {
        return FlopThree;
    }

    public int getFlopTwo() {
        return FlopTwo;
    }

    public int getRiver() {
        return River;
    }

    public int getTern() {
        return Tern;
    }

    public void setFlopOne(int FlopOne) {
        this.FlopOne = FlopOne;
    }

    public void setFlopThree(int FlopThree) {
        this.FlopThree = FlopThree;
    }

    public void setFlopTwo(int FlopTwo) {
        this.FlopTwo = FlopTwo;
    }

    public void setRiver(int River) {
        this.River = River;
    }

    public void setTern(int Tern) {
        this.Tern = Tern;
    }
    
     
}