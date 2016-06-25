
<%@page import="com.stocktrader.model.StockModel"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String username = (String) ActionContext.getContext().getSession()
	.get("username");
	Vector<StockModel> stockVector = (Vector<StockModel>)ActionContext.getContext().getSession().get("stockvector");
	StockModel stockModel = (StockModel)ActionContext.getContext().getSession().get("stockmodel");
	String searchResult = (String)ActionContext.getContext().getSession().get("searchresult");
	
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
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="assets/css/main.css" rel="stylesheet">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

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
			<div class="span3">
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


			<div class="span9">
				<div class="hero-unit">
					<h2>Company Stock Code</h2>

					<form id="searchform"
						action="search" method="post">

						<input class="span2" type="text" name="searchkeyword"
							placeholder="search keyword...">

						<button class="btn" id="btn_search" type="submit" name="search"
							value="Search">Search</button>
					</form>

					<%
						if(searchResult != null){
							if(searchResult.equals("success")){
					%>
					<table class="table table-striped">
						<tr>
							<td>1</td>
							<td>TB - Monthly</td>
							<td>01/04/2012</td>
							<td>Approved</td>
						</tr>
						<tr>
							<td>1</td>
							<td>TB - Monthly</td>
							<td>01/04/2012</td>
							<td>Approved</td>
						</tr>
						<%
							for(int i = 0; i<stockVector.size(); i++){
						%>
						<tr>
							<td>
								<%
									out.println(stockVector.get(i).code);
								%>
							</td>
							<td>
								<%
									out.println(stockVector.get(i).name);
								%>
							</td>
							<td>01/04/2012</td>
							<td>Approved</td>
						</tr>
						<%
							}
						%>
					</table>

					<%
						} else if(searchResult.equals("error")){
					%>
					<label class="alert alert-error" id="DelFrdFailInfo"> search error ! </label>
					<%
						}
					}
					%>

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
