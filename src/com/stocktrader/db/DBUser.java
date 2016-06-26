package com.stocktrader.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import com.stocktrader.model.StockModel;


public class DBUser {

	private Connection conn = null;
	private Statement stm = null;
	private ResultSet rs = null;
	private PreparedStatement pstm = null;
	
	private Vector<StockModel> stockVector = null;
	
	public Vector<StockModel> getStockVector(){
		String stockcode = null;
		String stockname = null;
		StockModel stock = null;
		int count = 0;
		stockVector = new Vector<StockModel>();
		try
		{
			conn=(Connection) DBTools.getConnection();
			String sql="select * from stock limit 0,10";
			
			if(!conn.isClosed()){
				stm = conn.createStatement();
				rs = stm.executeQuery(sql);
				while (rs.next())
				{
					stockcode = rs.getString("stockcode");
					stockname = rs.getString("name");
					stock = new StockModel(stockcode, stockname);
					stockVector.add(stock);
					if (count > 10) {
						break;
					}
					count++;
				}
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stockVector;
	}
	
	public String checkLogin(String username, String password){
		String uname = null;
		String pwd = null;
		
		try
		{
			conn=(Connection) DBTools.getConnection();
			String sql="select * from stockuser";
			
			if(!conn.isClosed()){
				stm = conn.createStatement();
				rs = stm.executeQuery(sql);
				while (rs.next())
				{
					uname = rs.getString("username");
					pwd = rs.getString("password");
					if (uname.equals(username) && pwd.equals(password))
					{
						conn.close();
						return uname;
					}
				}
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	
	public int register(String username, String password){
		if (isUserExisted(username)) {
			return -1;
		}
		try
		{
			conn=DBTools.getConnection();
			String sql="insert into stockuser values(?, ?, ?)";
			
			if(!conn.isClosed()){
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, username);
				pstm.setString(2, password);
				pstm.setInt(3, 10000);
				pstm.executeUpdate();
			}
			conn.close();
			return 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public boolean isUserExisted(String username) {
		String uname = null;
		boolean res = false;
		try
		{
			conn=DBTools.getConnection();
			if (!conn.isClosed())
			{
				stm = conn.createStatement();
				rs = stm.executeQuery("select * from stockuser");
				while (rs.next())
				{
					uname = rs.getString("username");
					if (uname.equals(username))
					{
						res = true;
					}
				}
			}
			conn.close();
		} catch (SQLException e2)
		{
			e2.printStackTrace();
		}
		return res;
		
	}


	public StockModel searchStock(String searchkeyword) {
		StockModel resStockModel = null;
		conn = DBTools.getConnection();
		try {
			if (!conn.isClosed()) {
				stm = conn.createStatement();
				rs = stm.executeQuery("select * from stock where stockcode='"+searchkeyword+"'");
				while (rs.next()){
					resStockModel = new StockModel(searchkeyword, rs.getString("name"));
					
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resStockModel;
	}

	public boolean orderStock(String username, String type,
			String stockcode, String amount, String unitprice) {
		
		
		return false;
	}
}
