package com.stocktrader.servlet;

import com.stocktrader.db.DBUser;

public class Register {
	private String username;
	private String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String register(){
		DBUser dbUser = new DBUser();
		int res = dbUser.register(username, password);
		System.out.println("res="+res);
		if (res == 1) {
			return "success";
		}
		return "error"; 
	}
}
