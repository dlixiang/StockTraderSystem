package com.stocktrader.servlet;

import com.opensymphony.xwork2.ActionContext;
import com.stocktrader.db.DBUser;
import com.stocktrader.model.StockModel;

public class OrderStock {
	private String username;
	private String type;
	private String stockcode;
	private String amount;
	private String unitprice;
	
	public String orderStock(){
		System.out.println("username: "+username);
		System.out.println("type: "+type);
		System.out.println("stockcode£º "+stockcode);
		System.out.println("amount: "+amount);
		System.out.println("unitprice: "+unitprice);
		DBUser dbUser = new DBUser();
		boolean res = dbUser.orderStock(username, type, stockcode, amount, unitprice);
		
		if (res) {
			ActionContext.getContext().getSession().put("orderstockresult", "success");
			return "success";
		}
		
		ActionContext.getContext().getSession().put("orderstockresult", "error");
		return "error";
	}

	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getStockcode() {
		return stockcode;
	}
	
	public void setStockcode(String stockcode) {
		this.stockcode = stockcode;
	}
	
	public String getAmount() {
		return amount;
	}
	
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	public String getUnitprice() {
		return unitprice;
	}
	
	public void setUnitprice(String unitprice) {
		this.unitprice = unitprice;
	}
	
	
}

