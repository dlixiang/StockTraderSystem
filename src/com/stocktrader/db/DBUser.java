package com.stocktrader.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import org.apache.catalina.User;

import com.stocktrader.model.StockModel;
import com.stocktrader.model.TradeRecordModel;
import com.stocktrader.model.UserAccountModel;

public class DBUser {

	private Connection conn = null;
	private Statement stm = null;
	private ResultSet rs = null;
	private PreparedStatement pstm = null;

	private Vector<StockModel> stockVector = null;
	private Vector<TradeRecordModel> tradeRecordVector = null;
	private Vector<UserAccountModel> userAccountVector = null;
	
	public Vector<UserAccountModel> getUserAccountModelVector(String username) {
		UserAccountModel userAccountModel = null;
		userAccountVector = new Vector<UserAccountModel>();
		try {
			conn = (Connection) DBTools.getConnection();
			String sql = "SELECT s.stockcode, s.name, SUM(amount) as amount FROM traderecord t, stock s WHERE t.stockcode=s.stockcode and t.username='"+username+"' GROUP BY stockcode;";
			System.out.println(sql);
			//SELECT stockcode, SUM(amount) FROM traderecord WHERE username='bofan' GROUP BY stockcode;

			if (!conn.isClosed()) {
				stm = conn.createStatement();
				rs = stm.executeQuery(sql);
				while (rs.next()) {
					userAccountModel = new UserAccountModel();
					userAccountModel.code = rs.getString("stockcode");
					userAccountModel.name = rs.getString("name");
					userAccountModel.amount = rs.getString("amount");
					userAccountVector.add(userAccountModel);
				}
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userAccountVector;
	}
	public Vector<TradeRecordModel> getTradeRecordVector(String username) {
		TradeRecordModel tradeRecordModel = null;
		tradeRecordVector = new Vector<TradeRecordModel>();
		try {
			conn = (Connection) DBTools.getConnection();
			String sql = "select * from traderecord where username='"+username+"';";

			if (!conn.isClosed()) {
				stm = conn.createStatement();
				rs = stm.executeQuery(sql);
				while (rs.next()) {
					tradeRecordModel = new TradeRecordModel();
					tradeRecordModel.tradeid = rs.getString("tradeid");
					tradeRecordModel.username = rs.getString("username");
					tradeRecordModel.type = rs.getString("type");
					tradeRecordModel.stockcode = rs.getString("stockcode");
					tradeRecordModel.amount = rs.getString("amount");
					tradeRecordModel.unitprice = rs.getString("unitprice");
					tradeRecordModel.tradedatetime = rs.getString("tradedatetime");
					
					tradeRecordVector.add(tradeRecordModel);
					
				}
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tradeRecordVector;
	}
	
	public Vector<StockModel> getStockVector() {
		String stockcode = null;
		String stockname = null;
		StockModel stock = null;
		int count = 0;
		stockVector = new Vector<StockModel>();
		try {
			conn = (Connection) DBTools.getConnection();
			String sql = "select * from stock limit 0,10";

			if (!conn.isClosed()) {
				stm = conn.createStatement();
				rs = stm.executeQuery(sql);
				while (rs.next()) {
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

	public String checkLogin(String username, String password) {
		String uname = null;
		String pwd = null;

		try {
			conn = (Connection) DBTools.getConnection();
			String sql = "select * from stockuser";

			if (!conn.isClosed()) {
				stm = conn.createStatement();
				rs = stm.executeQuery(sql);
				while (rs.next()) {
					uname = rs.getString("username");
					pwd = rs.getString("password");
					if (uname.equals(username) && pwd.equals(password)) {
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

	public int register(String username, String password) {
		if (isUserExisted(username)) {
			return -1;
		}
		try {
			conn = DBTools.getConnection();
			String sql = "insert into stockuser values(?, ?, ?)";

			if (!conn.isClosed()) {
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
		try {
			conn = DBTools.getConnection();
			if (!conn.isClosed()) {
				stm = conn.createStatement();
				rs = stm.executeQuery("select * from stockuser");
				while (rs.next()) {
					uname = rs.getString("username");
					if (uname.equals(username)) {
						res = true;
					}
				}
			}
			conn.close();
		} catch (SQLException e2) {
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
				rs = stm.executeQuery("select * from stock where stockcode='"
						+ searchkeyword + "'");
				while (rs.next()) {
					resStockModel = new StockModel(searchkeyword,
							rs.getString("name"));

				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resStockModel;
	}

	public boolean orderStock(String username, String type, String stockcode,
			int amount, double unitprice) {
		boolean res = false;
		double balance = getUserBalance(username);
		double totalPrice = unitprice * amount;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date nowDate = new Date();
		String tradeDateTime = sdf.format(nowDate);
		System.out.println(tradeDateTime);
		System.out.println("type: "+type);

		if (type.equals("0")) { // buy stock
			if (balance >= totalPrice) {
				balance -= totalPrice;
				updateBalance(balance, username);
				recordTrade(username, type, stockcode, amount, unitprice,
						tradeDateTime);
				res = true;
			}
		} else if (type.equals("1")) { // sell stock
			balance += totalPrice;

			updateBalance(balance, username);
			recordTrade(username, type, stockcode, -amount, unitprice,
					tradeDateTime);
			res = true;
		}

		return res;
	}

	private void updateBalance(double balance, String username) {
		conn = DBTools.getConnection();
		String sql = "update stockuser set balance=" + balance
				+ " where username='" + username + "';";
		System.out.println(sql);
		try {
			if (!conn.isClosed()) {
				stm = conn.createStatement();
				stm.executeUpdate(sql);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void recordTrade(String username, String type, String stockcode,
			int amount, double unitprice, String tradeDateTime) {
		conn = DBTools.getConnection();
		String sql = "insert into traderecord(username, type, stockcode, amount, unitprice, tradedatetime) values('"
				+ username
				+ "', '"
				+ type
				+ "', '"
				+ stockcode
				+ "', "
				+ amount + ", " + unitprice + ", '" + tradeDateTime + "');";
		System.out.println(sql);
		try {
			if (!conn.isClosed()) {
				stm = conn.createStatement();
				stm.executeUpdate(sql);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public double getUserBalance(String username) {
		double res = -1.0;
		
		conn = DBTools.getConnection();
		String sql = "select balance from stockuser where username='"
				+ username + "'";
		System.out.println(sql);
		try {
			if (!conn.isClosed()) {
				
				stm = conn.createStatement();
				rs = stm.executeQuery(sql);
				while (rs.next()) {
					res = Double.parseDouble(rs.getString("balance"));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
}
