package com.stocktrader.servlet;

import com.opensymphony.xwork2.ActionSupport;
import com.stocktrader.db.DBUser;

public class Login extends ActionSupport {

	
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
	
	public String login(){
		System.out.println(""+ username+", "+ password);
		DBUser dbuser = new DBUser();
		String result = dbuser.checkLogin(username, password);
		if(result != null){
			return "success";
		}
		return "error";
	}
}
