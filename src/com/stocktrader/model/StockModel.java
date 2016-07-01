package com.stocktrader.model;

public class StockModel {
	public String name;
	
	public String code;
	
	public StockPriceModel priceModel;
	
	public StockTrendModel trendModel;
	
	public StockModel(String code, String name) {
		this.code = code;
		this.name = name;
		priceModel = new StockPriceModel();
		trendModel = new StockTrendModel(code);
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	
	
}
