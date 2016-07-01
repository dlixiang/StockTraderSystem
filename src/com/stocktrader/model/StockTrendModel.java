package com.stocktrader.model;

public class StockTrendModel {
	private final static String stockAPIUrlPrefixToday = "http://image.sinajs.cn/newchart/min/n/";
	private final static String stockAPIUrlPrefixWeek = "http://image.sinajs.cn/newchart/daily/n/";
	private final static String stockAPIUrlPrefixMonth = "http://image.sinajs.cn/newchart/weekly/n/";
	private final static String stockAPIUrlPrefixYear = "http://image.sinajs.cn/newchart/monthly/n/";
	private final static String stockAPIUrlPostfix = ".gif";
	
	public String todayTrendUrl;
	public String weeklyTrendUrl;
	public String monthlyTrendUrl;
	public String yearlyTrendUrl;
	
	public StockTrendModel(String code) {
		todayTrendUrl = stockAPIUrlPrefixToday+code+stockAPIUrlPostfix;
		weeklyTrendUrl = stockAPIUrlPrefixWeek+code+stockAPIUrlPostfix;
		monthlyTrendUrl = stockAPIUrlPrefixMonth+code+stockAPIUrlPostfix;
		yearlyTrendUrl = stockAPIUrlPrefixYear+code+stockAPIUrlPostfix;
	}
}