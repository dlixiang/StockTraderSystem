package com.stocktrader.servlet;

import java.util.Vector;

import com.stocktrader.db.DBUser;
import com.stocktrader.model.TradeRecordModel;
import com.stocktrader.model.UserAccountModel;

public class UserProfile {

	public double getUserBalance(String username) {
		DBUser dbUser = new DBUser();
		double balance = dbUser.getUserBalance(username);
		return balance;
		
	}
	
	public Vector<TradeRecordModel> getTradeRecord(String username) {
		DBUser dbUser = new DBUser();
		Vector<TradeRecordModel> resModels = dbUser.getTradeRecordVector(username);
		return resModels;
	}
	
	public Vector<UserAccountModel> getUserAccountVector(String username) {
		DBUser dbUser = new DBUser();
		Vector<UserAccountModel> resAccountModels = dbUser.getUserAccountModelVector(username);
		
		return resAccountModels;
	}
	
}
