

<%@page import="com.stocktrader.servlet.UserProfile"%>
<%@page import="com.stocktrader.model.StockModel"%>
<%@page import="com.stocktrader.model.TradeRecordModel"%>
<%@page import="com.stocktrader.model.UserAccountModel"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String username = (String) ActionContext.getContext().getSession()
	.get("username");
	if(username == null){
		response.sendRedirect("index.jsp");
	}
		
	UserProfile userProfile = new UserProfile();

	Double balance = userProfile.getUserBalance(username);
	Vector<TradeRecordModel> tradeRecordVector = userProfile.getTradeRecord(username);
	Vector<UserAccountModel> userAccountModel = userProfile.getUserAccountVector(username);
	
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Stock Trader System</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="clipboard, introduction, jsp">

<meta http-equiv="description" content="This is a introduction page">
<meta http-equiv="author" content="Bofan">


<!-- css -->
<link href="assets/css/bootstrap.css" rel="stylesheet">

<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>
<!-- <link href="assets/css/bootstrap-responsive.css" rel="stylesheet"> -->
<!-- <link href="assets/css/main.css" rel="stylesheet"> -->





	   	<!-- DataTables style -->
    <link rel="stylesheet" type="text/css" href="./css/jquery.dataTables.css">
     <!-- Bootstrap style -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script type="text/javascript" charset="utf8" src="./js/jquery.js"></script>
     
    <!-- DataTables -->
    <script type="text/javascript" charset="utf8" src="./js/jquery.dataTables.js"></script>

    <!-- Bootstrap js -->
   <script src="./js/bootstrap.min.js"></script>  





</head>

<body background="assets\pic\bg\bg5.jpg" onload="init();">

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				
				<a class="brand" href="./index.jsp">Stock Trader System</a>
				<!-- <div class="nav-default pull-right"> -->
					<p class="brand pull-right">
						Welcome, <span id="myID"><%=username%></span>, <a href="#"
							class="navbar-link">(Log out)</a>
					</p>
					
				<!-- </div> -->
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span4">
				<div class="well sidebar-nav">
					<ul class="nav nav-list">
						
						<li class="nav-header">Trade</li>
						<li ><a href="./main.jsp" class="flink">Stock Information</a></li>
						<li class="nav-header">Account</li>
						<li class="active"><a href="./profile.jsp" class="flink">Personal Profile</a></li>
					</ul>
				</div>
				<!--/.well -->

			</div>
			<!--/span-->


			<div class="span8">
				<div class="hero-unit">
				
				<div>
				
				
					<!-- user info panel-->
					<div class="panel panel-info">
						<div class="panel-heading">
					    	<h3 class="panel-title">User Information</h3>
					  	</div>
					  	<div class="panel-body">
					  		<h3><%=username%> <span class="label label-default"><%=balance%></span></h3>
					  	</div>
					</div>
					<!-- account info panel-->
					<div class="panel panel-warning">
					  <div class="panel-heading">
					    <h3 class="panel-title">Account Information</h3>
					  </div>
					  
					  <div class="panel-body">
						<table id="example" class="display" cellspacing="0" width="100%">
					        <thead>
					            <tr>
					                <th>code</th>
					                <th>name</th>
					                <th>amount</th>
					            </tr>
					        </thead>
					        <tbody>
					        <%
					        	for(int index = 0; index < userAccountModel.size(); index++){
					        %>
					        		<tr>
						                <td><%=userAccountModel.get(index).code %></td>
						                <td><%=userAccountModel.get(index).name %></td>
						                <td><%=userAccountModel.get(index).amount %></td>
						                
					            	</tr>
					        <%		
					        	}
					        %>
					        </tbody>
					    </table>
					  </div>
					</div>
					
					
					<!-- trade info panel-->
					<div class="panel panel-success">
					  <div class="panel-heading">
					    <h3 class="panel-title">Trade Records</h3>
					  </div>
					  <div class="panel-body">
						<table id="Trade" class="display" cellspacing="0" width="100%">
					        <thead>
					            <tr>
					                <th>id</th>
					                <th>username</th>
					                <th>type</th>
					                <th>code</th>
					                <th>amount</th>
					                <th>unitprice</th>
					                <th>time</th>
					            </tr>
					        </thead>
					        <tbody>
					        <%
					        	for(int index = 0; index < tradeRecordVector.size(); index++){
					        %>
					        		<tr>
						                <td><%=tradeRecordVector.get(index).tradeid %></td>
						                <td><%=tradeRecordVector.get(index).username %></td>
						                <td><%=tradeRecordVector.get(index).type %></td>
						                <td><%=tradeRecordVector.get(index).stockcode %></td>
						                <td><%=tradeRecordVector.get(index).amount %></td>
						                <td><%=tradeRecordVector.get(index).unitprice %></td>
						                <td><%=tradeRecordVector.get(index).tradedatetime%></td>
					            	</tr>
					        <%		
					        	}
					        %>
					                   
					        </tbody>
					    </table>
					  </div>
					</div>
					<script type="text/javascript">
					    $(document).ready(function() {
					        var table = $('#example').DataTable({
					        	"scrollY": 200,
					        	"scrollX": true
					        });
					     	
					        $('#example tbody').on( 'click', 'tr', function () {
					            $(this).toggleClass('selected');
					        } );
					     
					        // $('#button').click( function () {
					        //     alert( table.rows('.selected').data() +' row(s) selected' );
					        // } );
					
					        var table = $('#Trade').DataTable({
					        	"scrollY": 200,
					        	"scrollX": true
					        });
					     	
					        $('#Trade tbody').on( 'click', 'tr', function () {
					            $(this).toggleClass('selected');
					        } );
					     
					
					} );
					</script>
				
				</div>

			</div>
			<!--/span-->
		</div>
		<!--/row-->

		<hr>

		<footer>
			<p>&copy; Copyright 2016 Jiaqi Qin. All rights reserved.</p>
		</footer>

	</div>
	<!--/.fluid-container-->

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="assets/js/lib/jquery.js"></script>
	<script src="assets/js/lib/bootstrap.js"></script>
	<script src="assets/js/lib/bootstrap.min.js"></script>
	<script src="assets/js/lib/bootstrap-modal.js"></script>
	<script type="text/javascript" src="assets/js/lib/ZeroClipboard.js"></script>

	<script type="text/javascript" src="assets/js/init.js"></script>
	<script type="text/javascript" src="assets/js/button.js"></script>
	<script type="text/javascript" src="assets/js/clipboard.js"></script>
	<script type="text/javascript" src="assets/js/local.js"></script>

</body>
</html>
