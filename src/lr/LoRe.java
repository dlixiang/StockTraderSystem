package lr;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LoRe extends ActionSupport{

	private String identity;
	private String loginname;
	private String loginpassword;
	private String registername;
	private String registerpassword;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getLoginpassword() {
		return loginpassword;
	}
	public void setLoginpassword(String loginpassword) {
		this.loginpassword = loginpassword;
	}

	public String getRegistername() {
		return registername;
	}
	public void setRegistername(String registername) {
		this.registername = registername;
	}
	public String getRegisterpassword() {
		return registerpassword;
	}
	public void setRegisterpassword(String registerpassword) {
		this.registerpassword = registerpassword;
	}
	Mysql mysql = new Mysql();
	public String Log() throws Exception {	
		ActionContext.getContext().getSession().put("username", loginname); // ∑≈÷√session Ù–‘
		String sqlr = "select * from account where username = '"+ loginname +"' and password = '"+ loginpassword +"'";
		ResultSet Rs = mysql.query(sqlr);	
		if(loginname.equals("boss") && loginpassword.equals("123456") && identity.equals("boss")){
			return "boss";
		} 
		else if(Rs.next() && identity.equals("employee")){		
			return "employee";
		} else{
			return "fail";
		} 
	}
	public String Reg() throws Exception {
		
		java.util.Date now = new java.util.Date();
		String noww = sdf.format(now);
		String sqlws = "insert into  account (username,password,type,date) values ( '"+getRegistername()+"' , '"+getRegisterpassword()+"' ,'1' , '"+noww+"')";		
		mysql.update(sqlws);
		//create table
		String sqlta = "create table "+registername+" (id int(11) auto_increment, "+"lock1 int(11), "+"  stock1 int(11), "+"barrel1 int(11), "+"location1 varchar(45), "+" da varchar(45), primary key(id) ) ";
		mysql.CreateTable(sqlta);
		return "success";
	}
}
