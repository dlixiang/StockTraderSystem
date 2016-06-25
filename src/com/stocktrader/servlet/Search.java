package com.stocktrader.servlet;

import com.opensymphony.xwork2.ActionContext;
import com.stocktrader.db.DBUser;
import com.stocktrader.model.StockModel;

public class Search {
	private String searchkeyword;
	
	public String getSearchkeyword() {
		return searchkeyword;
	}

	public void setSearchkeyword(String searchkeyword) {
		this.searchkeyword = searchkeyword;
	}

	public String search(){
		System.out.println("searchkeyword: "+searchkeyword);
		DBUser dbUser = new DBUser();
		StockModel resStockModel = dbUser.searchStock(searchkeyword);
		
		if (resStockModel != null) {
			System.out.println("res stock model not null");
			ActionContext.getContext().getSession().put("stockmodel", resStockModel);
			ActionContext.getContext().getSession().put("searchresult", "success");
			return "success";
		}
		System.out.println("res stock model is null!");
		ActionContext.getContext().getSession().put("searchresult", "error");
		return "error";
	}
}
