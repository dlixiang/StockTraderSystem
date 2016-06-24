package lr;

import java.sql.*;

public class Mysql {

	Connection con;
	Statement statement;
	ResultSet rs;
	
	public Mysql(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
		//	System.out.println("成功加载数据库");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/gun","root","5991782");
		//	System.out.println("成功连接数据库");
			statement = con.createStatement();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//更新数据库信息 void类型也是可以的
	public int update (String sql) throws SQLException{
		
		try {
			statement.executeUpdate(sql);
			return 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	} 
	//读取数据库信息
	public ResultSet query(String sql) throws SQLException{
			
		try {
			rs = statement.executeQuery(sql);			
		} catch (SQLException e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return rs;		
		
	}
	//建立数据库表
	public void CreateTable(String sql) throws SQLException{
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
}
