

<%@page import="com.stocktrader.servlet.UserProfile"%>
<%@page import="com.stocktrader.model.StockModel"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String username = (String) ActionContext.getContext().getSession()
	.get("username");
	UserProfile userProfile = new UserProfile();

	Double balance = userProfile.getUserBalance(username);

StockModel stockModel = (StockModel)ActionContext.getContext().getSession().get("stockmodel");
String searchResult = (String)ActionContext.getContext().getSession().get("searchresult");
String orderStockResult = (String)ActionContext.getContext().getSession().get("orderstockresult");
	
	if(username == null)
		response.sendRedirect("index.jsp");
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
				
				<a class="brand" href="#">Stock Trader System</a>
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
					                <th>Stock Name</th>
					                <th>Stock Code</th>
					                <th>Amount</th>
					            </tr>
					        </thead>
					        <tfoot>
					            <tr>
					                <th>Stock Name</th>
					                <th>Stock Code</th>
					                <th>Amount</th>
					            </tr>
					        </tfoot>
					        <tbody>
					            <tr>
					                <td data-search="Tiger Nixon">T. Nixon</td>
					                <td>System Architect</td>
					                <td>Edinburgh</td>
					            </tr>
					            <tr>
					                <td data-search="Garrett Winters">G. Winters</td>
					                <td>Accountant</td>
					                <td>Tokyo</td>
					            </tr>
					            <tr>
					                <td data-search="Ashton Cox">A. Cox</td>
					                <td>Junior Technical Author</td>
					                <td>San Francisco</td>
					            </tr>
					            <tr>
					                <td data-search="Cedric Kelly">C. Kelly</td>
					                <td>Senior Javascript Developer</td>
					                <td>Edinburgh</td>
					            </tr>
					                  
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
					                <th>Time</th>
					                <th>Type(Buy/Sell)</th>
					                <th>Stock Code</th>
					                <th>Stock Name</th>
					                <th>Amount</th>
					                <th>Unit Price</th>
					                <th>Total Price</th>
					            </tr>
					        </thead>
					        <tfoot>
					            <tr>
					                <th>Time</th>
					                <th>Type(Buy/Sell)</th>
					                <th>Stock Code</th>
					                <th>Stock Name</th>
					                <th>Amount</th>
					                <th>Unit Price</th>
					                <th>Total Price</th>
					            </tr>
					        </tfoot>
					        <tbody>
					            <tr>
					                <td data-search="Tiger Nixon">T. Nixon</td>
					                <td>System Architect</td>
					                <td>Edinburgh</td>
					                <td>61</td>
					                <td data-order="1303686000">Mon 25th Apr 11</td>
					                <td data-order="320800">$320,800/y</td>
					                <td data-order="320800">$320,800/y</td>
					            </tr>
					            <tr>
					                <td data-search="Garrett Winters">G. Winters</td>
					                <td>Accountant</td>
					                <td>Tokyo</td>
					                <td>63</td>
					                <td data-order="1311548400">Mon 25th Jul 11</td>
					                <td data-order="170750">$170,750/y</td>
					                <td data-order="320800">$320,800/y</td>
					            </tr>
					            <tr>
					                <td data-search="Ashton Cox">A. Cox</td>
					                <td>Junior Technical Author</td>
					                <td>San Francisco</td>
					                <td>66</td>
					                <td data-order="1231718400">Mon 12th Jan 09</td>
					                <td data-order="86000">$86,000/y</td>
					                <td data-order="320800">$320,800/y</td>
					            </tr>
					            <tr>
					                <td data-search="Cedric Kelly">C. Kelly</td>
					                <td>Senior Javascript Developer</td>
					                <td>Edinburgh</td>
					                <td>22</td>
					                <td data-order="1332975600">Thu 29th Mar 12</td>
					                <td data-order="433060">$433,060/y</td>
					                <td data-order="320800">$320,800/y</td>
					            </tr>
					            <tr>
					                <td data-search="Airi Satou">A. Satou</td>
					                <td>Accountant</td>
					                <td>Tokyo</td>
					                <td>33</td>
					                <td data-order="1227830400">Fri 28th Nov 08</td>
					                <td data-order="162700">$162,700/y</td>
					                <td data-order="320800">$320,800/y</td>
					            </tr>
					            <tr>
					                <td data-search="Brielle Williamson">B. Williamson</td>
					                <td>Integration Specialist</td>
					                <td>New York</td>
					                <td>61</td>
					                <td data-order="1354406400">Sun 2nd Dec 12</td>
					                <td data-order="372000">$372,000/y</td>
					                <td data-order="320800">$320,800/y</td>
					            </tr>
					            <tr>
					                <td data-search="Herrod Chandler">H. Chandler</td>
					                <td>Sales Assistant</td>
					                <td>San Francisco</td>
					                <td>59</td>
					                <td data-order="1344207600">Mon 6th Aug 12</td>
					                <td data-order="137500">$137,500/y</td>
					                <td data-order="320800">$320,800/y</td>
					            </tr>
					            <tr>
					                <td data-search="Herrod Chandler">H. Chandler</td>
					                <td>Sales Assistant</td>
					                <td>San Francisco</td>
					                <td>59</td>
					                <td data-order="1344207600">Mon 6th Aug 12</td>
					                <td data-order="137500">$137,500/y</td>
					                <td data-order="320800">$320,800/y</td>
					            </tr>   
					            <tr>
					                <td data-search="Herrod Chandler">H. Chandler</td>
					                <td>Sales Assistant</td>
					                <td>San Francisco</td>
					                <td>59</td>
					                <td data-order="1344207600">Mon 6th Aug 12</td>
					                <td data-order="137500">$137,500/y</td>
					                <td data-order="320800">$320,800/y</td>
					            </tr>   
					            <tr>
					                <td data-search="Herrod Chandler">H. Chandler</td>
					                <td>Sales Assistant</td>
					                <td>San Francisco</td>
					                <td>59</td>
					                <td data-order="1344207600">Mon 6th Aug 12</td>
					                <td data-order="137500">$137,500/y</td>
					                <td data-order="320800">$320,800/y</td>
					            </tr> 
					            <tr>
					                <td data-search="Herrod Chandler">H. Chandler</td>
					                <td>Sales Assistant</td>
					                <td>San Francisco</td>
					                <td>59</td>
					                <td data-order="1344207600">Mon 6th Aug 12</td>
					                <td data-order="137500">$137,500/y</td>
					                <td data-order="320800">$320,800/y</td>
					            </tr>   
					            <tr>
					                <td data-search="Herrod Chandler">H. Chandler</td>
					                <td>Sales Assistant</td>
					                <td>San Francisco</td>
					                <td>59</td>
					                <td data-order="1344207600">Mon 6th Aug 12</td>
					                <td data-order="137500">$137,500/y</td>
					                <td data-order="320800">$320,800/y</td>
					            </tr>              
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
			<p>&copy; Copyright 2013 Bofan. All rights reserved.</p>
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
