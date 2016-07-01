package com.stocktrader.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DBTools {
	public static String database="stocktrader";
	public static String username="root";
	public static String password="5991782";
	
	private static Connection conn = null;
	private static Statement stm = null;
	private static ResultSet rs = null;
	private static PreparedStatement pstm = null;
	
	public static void initDBHelper(String database,String username,String password)
	{
		DBTools.database=database;
		DBTools.username=username;
		DBTools.password=password;
	}
	
	public static Connection getConnection(){
	    Connection conn = null ; 
	     try {
	    	 Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/"+database, username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e)
	     {
	    	 e.printStackTrace();
	     }
	    return  conn ;
		}

	public static ArrayList<String> getStrings(String table, String colname, String value, String col){
		ArrayList<String> str = new ArrayList<String>();
		
		try
		{
			conn=DBTools.getConnection();
			if (!conn.isClosed()) {
				String sql="select "+col+" from "+table+" where "+colname+"='"+value+"'";
				System.out.println(sql);
				stm = conn.createStatement();
				rs = stm.executeQuery(sql);
				while (rs.next())
				{
					str.add(rs.getString(1));
					
				}
				conn.close();
				return str;
			}
			
			conn.close();
			return null;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
