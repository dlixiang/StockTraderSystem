package com.stocktrader.servlet;

import com.stocktrader.db.DBUser;

public class UserProfile {

	public double getUserBalance(String username) {
		DBUser dbUser = new DBUser();
		double balance = dbUser.getUserBalance(username);
		return balance;
		
	}
	
	
}
