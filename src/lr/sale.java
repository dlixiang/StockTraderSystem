package lr;

import java.sql.Date;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class sale extends ActionSupport{
	private int locks;
	private int stocks;
	private int barrels;
	private String town;
	public String getTown() {
		return town;
	}
	public void setTown(String town) {
		this.town = town;
	}
	public int getLocks() {
		return locks;
	}
	public void setLocks(int locks) {
		this.locks = locks;
	}
	public int getStocks() {
		return stocks;
	}
	public void setStocks(int stocks) {
		this.stocks = stocks;
	}
	public int getBarrels() {
		return barrels;
	}
	public void setBarrels(int barrels) {
		this.barrels = barrels;
	}
	Mysql mysql = new Mysql();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public String update1() throws Exception{
		String username = (String)ActionContext.getContext().getSession().get("username");
		java.util.Date now = new java.util.Date();
		String noww = sdf.format(now);	
		String sqldetail = "insert into  "+username+" (lock1,stock1,barrel1,location1,da) values ( '"+getLocks()+"' , '"+getStocks()+"' ,'"+getBarrels()+"','"+getTown()+"','"+noww+"')";
		mysql.update(sqldetail);
		//¼ÆËãÐ½½ð
		String sqlr = "select * from details where username = '"+username+"'";
		ResultSet Rs = mysql.query(sqlr);
		
		if(Rs.next()){
			if((Rs.getInt(3)+locks)>70||(Rs.getInt(4)+stocks)>80||(Rs.getInt(5)+barrels)>90){
				return "fail";
			}
			int com1 = money(Rs.getInt(3)+locks,Rs.getInt(4)+stocks,Rs.getInt(5)+barrels);
			mysql.update("update details set lock11='"+(Rs.getInt(3)+locks)+"',stock='"+(Rs.getInt(4)+stocks)+"' ,barrel='"+(Rs.getInt(5)+barrels)+"', commission='"+com1+"' where username ='"+username+"' ");
		}else{
			int com2 = money(locks,stocks,barrels);
			mysql.update("insert into details (username,lock11,stock,barrel,commission) values ('"+username+"','"+getLocks()+"','"+getStocks()+"','"+getBarrels()+"','"+com2+"')");
		}
		return "success";
	}
	public int money(int loc,int sto,int bar){
		double money = 45*loc + 30*sto + 25*bar;
		double commission ;
		if(money <= 1000){
			commission = money*0.1;
		}else if(money <= 1800){
			commission = 1000*0.1 + (money-1000)*0.15;
		}else {
			commission = 1000*0.1 + 800*0.15 + (money-1800)*0.2;
		}
		return (int)commission;
	}
}
