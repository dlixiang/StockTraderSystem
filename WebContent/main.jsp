
<%@page import="com.stocktrader.model.StockModel"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String username = (String) ActionContext.getContext().getSession()
	.get("username");
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
				<button type="button" class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="brand" href="#">Stock Trader System</a>
				<div class="nav-collapse collapse">
					<p class="navbar-text pull-right">
						Welcome, <span id="myID"><%=username%></span>, <a href="#"
							class="navbar-link">(Log out)</a>
					</p>
					<ul class="nav">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#about">About</a></li>
						<li><a href="#contact">Contact</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span4">
				<div class="well sidebar-nav">
					<ul class="nav nav-list">
						
						<li class="nav-header">ME</li>
						<li class="active" id="myli"><a href="#" class="flink">bofan</a></li>
						<li class="nav-header">FRIEND LIST</li>
					</ul>
				</div>
				<!--/.well -->

			</div>
			<!--/span-->


			<div class="span8">
				<div class="hero-unit">
				
				<div>
					<div class="panel panel-info">
					    <div class="panel-heading">
					        <h3 class="panel-title">Search Stock</h3>
					    </div>
					    <div class="panel-body">
					        <form class="form-inline" id="searchform"
											action="search" method="post">
					            <div class="form-group">
					                <input type="text" class="form-control span2" id="stockCode" placeholder="stock code" name="searchkeyword">
					            </div>
					            <button type="submit" class="btn btn-primary" id="btn_search" name="search">Search</button>
					            
					        </form>
					        <%
								if(searchResult != null){
									if(searchResult.equals("error")){
							%>
					        <label class="alert alert-error" id="DelFrdFailInfo"> search error ! </label>
					        <%
					        			//searchResult = null;
									}
								}
					        %>
					    </div>
					</div>	

					<%
						if(searchResult != null){
							if(searchResult.equals("success")){
					%>

					<!--- stock info panel ---->
					<div class="panel panel-info">
					    <div class="panel-heading">
					        <h3 class="panel-title">Stock Information</h3>
					    </div>
					    <div class="panel-body">
					        <div class="row">
					            <div class="col-xs-8">
					                <h3><%=stockModel.name%> <span class="label label-default"><%=stockModel.code%></span></h3>
					            </div>
					             <div class="col-xs-4">
					                <h3>￥<%=stockModel.priceModel.currentPrice%></h3>
					            </div>
					        </div>
					        <div class="row">
					          <div class="col-md-4">Today Opening Price:</div>
					          <div class="col-md-2"><%=stockModel.priceModel.todayOpenPrice%></div>
					          <div class="col-md-3">Max Price:</div>
					          <div class="col-md-3"><%=stockModel.priceModel.maxPrice%></div>
					        </div>
					        <div class="row">
					          <div class="col-md-4">Yesterday Closing Price:</div>
					          <div class="col-md-2"><%=stockModel.priceModel.yesterdayClosePrice%></div>
					          <div class="col-md-3">Min Price:</div>
					          <div class="col-md-3"><%=stockModel.priceModel.minPrice%></div>
					        </div>
					    </div>
					</div>

					<!--- stock line chart image panel ---->
					<div class="panel panel-warning">
					    <div class="panel-heading">
					        <h3 class="panel-title">Stock Trends</h3>
					    </div>
					    <div class="panel-body">
					        <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
					            <li class="active"><a href="#today" data-toggle="tab">Today</a></li>
					            <li><a href="#weekly" data-toggle="tab">Weekly</a></li>
					            <li><a href="#monthly" data-toggle="tab">Monthly</a></li>
					            <li><a href="#yearly" data-toggle="tab">Yearly</a></li>
					            
					        </ul>
					        <div id="my-tab-content" class="tab-content">
					            <div class="tab-pane active" id="today">
					                <img src="<%=stockModel.trendModel.todayTrendUrl%>" alt="today">
					            </div>
					            <div class="tab-pane" id="weekly">
					                <img src="<%=stockModel.trendModel.weeklyTrendUrl%>" alt="weekly">
					            </div>
					            <div class="tab-pane" id="monthly">
					                <img src="<%=stockModel.trendModel.monthlyTrendUrl%>" alt="monthly">
					            </div>
					            <div class="tab-pane" id="yearly">
					                <img src="<%=stockModel.trendModel.yearlyTrendUrl%>" alt="yearly">
					            </div>
					        </div>
					        <script type="text/javascript">
					            jQuery(document).ready(function ($) {
					                $('#tabs').tab();
					            });
					        </script>
					    </div>
					</div>
					
					<!-- Trade Stock Form Panel-->
					<div class="panel panel-success">
					    <div class="panel-heading">
					        <h3 class="panel-title">Trade Stock</h3>
					    </div>
					    <div class="panel-body">
					
					        <form id="orderstockform" action="orderstock" method="post">
					        	<div class="form-group row">
					                <label class="col-sm-2">Operations</label>
					                <div class="col-sm-10">
					                  <div class="radio">
					                    <label>
					                      <input type="radio" name="type" id="gridRadios1" value="0" checked>Buy
					                    </label>
					                  </div>
					                  <div class="radio">
					                    <label>
					                      <input type="radio" name="type" id="gridRadios2" value="1">Sell
					                    </label>
					                  </div>
					                </div>
					            </div>
					            <div class="form-group row">
					            	<label class="col-sm-2 form-control-label">Username</label>
					                <div class="col-sm-10">
					                  <input type="text" class="span6 form-control" placeholder="Username"  name="username" value="<%=username%>">
					                </div>
					            </div>
					            <div class="form-group row">
					            	<label class="col-sm-2 form-control-label">Stock Code</label>
					                <div class="col-sm-10">
					                  <input type="text" class="span6 form-control" placeholder="Stock code"  name="stockcode" value="<%=stockModel.code%>">
					                </div>
					            </div>
					            <div class="form-group row">
					            	<label class="col-sm-2 form-control-label">Amount</label>
					                <div class="col-sm-10">
					                  <input type="text" class="span6 form-control" placeholder="Amount"  name="amount" value="5">
					                </div>
					            </div>
					            <div class="form-group row">
					         	   <label class="col-sm-2 form-control-label">Unit Price</label>
					                <div class="col-sm-10">
					                  <input type="text" class="span6 form-control" placeholder="Unit Price (￥)"  name="unitprice" value="100">
					                </div>
					            </div>
					            
					            
					              <div class="form-group row">
					                <div class="col-sm-offset-2 col-sm-10">
					                  <button type="submit" class="btn btn-primary" id="btn_search" type="submit" name="order">Submit Order</button>
					                </div>
					              </div>
					            <!-- <button type="submit" class="btn btn-primary">Submit</button> -->
					        </form>
					    </div>
					</div>

					<%
							}
						}
					
						if(orderStockResult != null){
							if(orderStockResult.equals("success")){
					%>
						<label class="alert alert-success"> Order success! </label>
						<%
							} else if(orderStockResult.equals("error")){
						%>
						<label class="alert alert-error"> Order error! </label>
					<%
							}
						}
					%>
				</div>
				
				
				
				
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
