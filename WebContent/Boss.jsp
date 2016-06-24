<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "lr.*" import= "java.sql.*" import="com.opensymphony.xwork2.ActionContext"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Boss</title>
	<link type="text/css" rel="stylesheet" href="bootstrap/bootstrap.min.css">
	<script type="text/javascript" src="bootstrap/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
	
	
</head>
<body>
<%
Mysql my = new Mysql();
int []ID = new int[12];
int length = 0;
String []name = new String[12];
int []com = new int[12];
String [] dates = new String[12]; 
String sqlaccount = "select * from details"; 
String sqldate = "select * from account";

ResultSet Res = my.query(sqlaccount);
for(int i=0; Res.next(); i++){
	ID[i] = Res.getInt(1);
	name[i] = Res.getString(2);
	com[i] = Res.getInt(6);
	length++;
}
ResultSet resdate = my.query(sqldate);
for(int i=0; resdate.next(); i++){
	dates[i] = resdate.getString(5);
}
%>

<div class="home">
    <header class="header">
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="row">                               
                <div class="hidden-xs col-sm-5 col-md-4 col-lg-4">
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav pull-left">
                            <li id="nav-index" ><a href="">Boss</a></li>                               
                        </ul>
                    </div>                    	
                </div>                
            </div>
        </div>
    </nav>
    </header> 
</div>
<div class="navbar navbar-default navbar-fixed-top" style="margin-top: 60px">
	<ul class="nav nav-tabs" style="margin-left: 60px">	
		<li><a href="Boss.jsp">Employee information</a></li>
		<li><a href="Boss_history.jsp">Sales performance</a></li>				
	</ul>
</div>
<table class="table"   style="margin-top: 120px;margin-left: 70px">
	<thead>
		<tr>
			<th>编号</th>
			<th>名字</th>
			<th>注册时间</th>
			<th>状态</th>
			<th>当月销售业绩</th>
		</tr>
	</thead>
	<tbody id="tab">
	<!--  	<tr>
			<td>1</td>
			<td>TB</td>
			<td>01/04/2012</td>
			<td>Default</td>
			<td>0</td>
		</tr>
		<tr class="success">
			<td>1</td>
			<td>TB</td>
			<td>01/04/2012</td>
			<td>Default</td>
			<td>0</td>
		</tr>
		<tr class="error">
			<td>2</td>
			<td>TB</td>
			<td>02/04/2012</td>
			<td>Default</td>
			<td>0</td>
		</tr>
		<tr class="warning">
			<td>3</td>
			<td>TB</td>
			<td>03/04/2012</td>
			<td>Default</td>
			<td>0</td>
		</tr>
		<tr class="info">
			<td>4</td>
			<td>TB</td>
			<td>04/04/2012</td>
			<td>Default</td>
			<td>0</td>
		</tr>  -->
	</tbody>
</table>
<script type="text/javascript">
	$(document).ready(function(){
		var h=0;
		if( h<<%=length%>){	
			$("#tab").append("<tr>"
								+"<td>1</td>"
								+"<td><%=name[0]%></td>"
								+"<td><%=dates[0]%></td>"
								+"<td>default</td>"
								+"<td><%=com[0]%></td>"
							  +"</tr>");
			h++;
		}
		if( h<<%=length%>){	
			$("#tab").append("<tr>"
								+"<td>2</td>"
								+"<td><%=name[1]%></td>"
								+"<td><%=dates[1]%></td>"
								+"<td>default</td>"
								+"<td><%=com[1]%></td>"
							  +"</tr>");
			h++;
		}
		if( h<<%=length%>){	
			$("#tab").append("<tr>"
								+"<td>3</td>"
								+"<td><%=name[2]%></td>"
								+"<td><%=dates[2]%></td>"
								+"<td>default</td>"
								+"<td><%=com[2]%></td>"
							  +"</tr>");
			h++;
		}
		if( h<<%=length%>){	
			$("#tab").append("<tr>"
								+"<td>4</td>"
								+"<td><%=name[3]%></td>"
								+"<td><%=dates[3]%></td>"
								+"<td>default</td>"
								+"<td><%=com[3]%></td>"
							  +"</tr>");
			h++;
		}
		if( h<<%=length%>){	
			$("#tab").append("<tr>"
								+"<td>5</td>"
								+"<td><%=name[4]%></td>"
								+"<td><%=dates[4]%></td>"
								+"<td>default</td>"
								+"<td><%=com[4]%></td>"
							  +"</tr>");
			h++;
		}
		if( h<<%=length%>){	
			$("#tab").append("<tr>"
								+"<td>6</td>"
								+"<td><%=name[5]%></td>"
								+"<td><%=dates[5]%></td>"
								+"<td>default</td>"
								+"<td><%=com[5]%></td>"
							  +"</tr>");
			h++;
		}
		if( h<<%=length%>){	
			$("#tab").append("<tr>"
								+"<td>7</td>"
								+"<td><%=name[6]%></td>"
								+"<td><%=dates[6]%></td>"
								+"<td>default</td>"
								+"<td><%=com[6]%></td>"
							  +"</tr>");
			h++;
		}
		if( h<<%=length%>){	
			$("#tab").append("<tr>"
								+"<td>8</td>"
								+"<td><%=name[7]%></td>"
								+"<td><%=dates[7]%></td>"
								+"<td>default</td>"
								+"<td><%=com[7]%></td>"
							  +"</tr>");
			h++;
		}
		if( h<<%=length%>){	
			$("#tab").append("<tr>"
								+"<td>9</td>"
								+"<td><%=name[8]%></td>"
								+"<td><%=dates[8]%></td>"
								+"<td>default</td>"
								+"<td><%=com[8]%></td>"
							  +"</tr>");
			h++;
		}
		if( h<<%=length%>){	
			$("#tab").append("<tr>"
								+"<td>10</td>"
								+"<td><%=name[9]%></td>"
								+"<td><%=dates[9]%></td>"
								+"<td>default</td>"
								+"<td><%=com[9]%></td>"
							  +"</tr>");
			h++;
		}
		if( h<<%=length%>){	
			$("#tab").append("<tr>"
								+"<td>11</td>"
								+"<td><%=name[10]%></td>"
								+"<td><%=dates[10]%></td>"
								+"<td>default</td>"
								+"<td><%=com[10]%></td>"
							  +"</tr>");
			h++;
		}
	});

	</script>

</body>
</html>