<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "lr.*" import= "java.sql.*" import="com.opensymphony.xwork2.ActionContext"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link type="text/css" rel="stylesheet" href="bootstap/bootstrap.datetimpicker.min.css">
	<link type="text/css" rel="stylesheet" href="bootstrap/bootstrap.min.css">
	<script type="text/javascript" src="bootstrap/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="bootstrap/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="bootstrap/highcharts.js"></script>
	<script type="text/javascript">
    function done(){
        $('.yyy').attr("disabled",true);
        //alert("??????"+ salary);
    }
	</script>
	
<title>Employee</title>
</head>
<body>
<%
Mysql my = new Mysql();
int []sal = new int[3];
String username = (String)ActionContext.getContext().getSession().get("username");
String sqldetail = "select * from details where username = '"+username+"' ";
ResultSet Rsdetail = my.query(sqldetail);
if(Rsdetail.next()){
	sal[0] = Rsdetail.getInt(3);
	sal[1] = Rsdetail.getInt(4);
	sal[2] = Rsdetail.getInt(5);
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
                            <li id="nav-index" ><a href="">Employee</a></li>                               
                        </ul>
                    </div>                    	
                </div>                
            </div>
        </div>
    </nav>
    </header> 
</div>
<div class="form-horizontal"  style="margin-top:70px;width:20%; margin-left:70px; float:left;height:500px ;background: aqua;">
Personal Information：<%=username %><image src="monkey.png" width="200" height="200"/><br><br>Your Sales this month<br>Locks: <%=sal[0] %> <br>Stocks: <%=sal[1] %><br>Barrels: <%=sal[2] %>
<br><br>	
	<font size="5" color="black">
		<a href="Employee_history.jsp">Historical Sales</a>
	</font>
</div>
<div class="controls" style="margin-left: 100px;float:left; margin-top: 70px">
	<form action="uploadd" method="post" >
		<div style="float:left">                   <label>Locks</label>     <input style="width: 100px " class="form-control yyy" type="text" name= "locks"/> </div>    
		<div style="margin-left: 50px;float:left"> <label>Stocks</label>    <input style="width: 100px" class="form-control yyy" type="text" name= "stocks"/> </div>
		<div style="margin-left: 50px;float:left"> <label>Barrels</label>   <input style="width: 100px" class="form-control yyy" type="text" name= "barrels"/> </div>
		
          <br><br><br>
          <label class="control-label">Select - town</label>
          <div class="controls"> 
					              <select  class="input-xlarge" name="town">
							      	<option value="A">A</option>
							      	<option value="B">B</option>	
							      	<option value="C">C</option>
							      	<option value="D">D</option>
							      	<option value="E">E</option>					
							      </select>		
         </div>  

       
		<button style="margin-left: 10px;float:left;margin-top: 25px" type="submit" id="btn-stop" class="btn btn-success" >Submit</button>
	</form>

    <button style="margin-left: 30px;float:left;margin-top: 25px" id="btn-stop" class="btn btn-success" onclick="done()" >END TRANSACTION</button>
    
</div>

</body>
</html>