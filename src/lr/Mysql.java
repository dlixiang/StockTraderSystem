package lr;

import java.sql.*;

public class Mysql {

	Connection con;
	Statement statement;
	ResultSet rs;
	
	public Mysql(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
		//	System.out.println("�ɹ��������ݿ�");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/gun","root","5991782");
		//	System.out.println("�ɹ��������ݿ�");
			statement = con.createStatement();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//�������ݿ���Ϣ void����Ҳ�ǿ��Ե�
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
	//��ȡ���ݿ���Ϣ
	public ResultSet query(String sql) throws SQLException{
			
		try {
			rs = statement.executeQuery(sql);			
		} catch (SQLException e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return rs;		
		
	}
	//�������ݿ��
	public void CreateTable(String sql) throws SQLException{
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
}
