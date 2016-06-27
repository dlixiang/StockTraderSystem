package com.stocktrader.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class StockAdapter {
	private String getUrlString(String code){
		String url = "http://hq.sinajs.cn/list="+code;
		return url;
	}
	
	public boolean loadStockModel(StockModel stockModel){
		System.out.println("==>in loadStockModel, get data from url.");
		
		boolean res = false;
		String urlString = getUrlString(stockModel.code);
		URL url = null;
        try {
            url = new URL(urlString);
            HttpURLConnection urlcon  = (HttpURLConnection) url.openConnection();
            urlcon.connect();
            InputStream is = urlcon.getInputStream();
            BufferedReader buffer = new BufferedReader(new InputStreamReader(is, "GBK"));

            StringBuffer bs = new StringBuffer();
            String line = null;
            String result = null;
            while ((line = buffer.readLine()) != null){
                result += line;
            }
            result = result.substring(result.indexOf("=")+2, result.length()-2);
            
            System.out.println("return string: "+result);
            String[] resArray = result.split(",");
            
            if(resArray.length > 0){
            	stockModel.priceModel.todayOpenPrice = Double.parseDouble(resArray[1]);
                stockModel.priceModel.yesterdayClosePrice = Double.parseDouble(resArray[2]);
                stockModel.priceModel.currentPrice = Double.parseDouble(resArray[3]);
                stockModel.priceModel.maxPrice = Double.parseDouble(resArray[4]);
                stockModel.priceModel.minPrice = Double.parseDouble(resArray[5]);
                res = true;
            } else {
				res = false;
			}
            
            
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return res;
	}
}
