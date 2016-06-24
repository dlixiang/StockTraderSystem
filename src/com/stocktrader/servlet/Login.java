package com.stocktrader.servlet;

import java.util.Vector;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.stocktrader.db.DBUser;
import com.stocktrader.db.Stock;

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
		Vector<Stock> stockVector = dbuser.getStockVector();
		
		if(result != null){
			ActionContext.getContext().getSession().put("username", username);
			ActionContext.getContext().getSession().put("stockvector", stockVector);
			return "success";
		}
		return "error";
	}
}
