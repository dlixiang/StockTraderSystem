<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee_history</title>
	<link type="text/css" rel="stylesheet" href="bootstap/bootstrap.datetimpicker.min.css">
	<link type="text/css" rel="stylesheet" href="bootstrap/bootstrap.min.css">
	<script type="text/javascript" src="bootstrap/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="bootstrap/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="bootstrap/highcharts.js"></script>
	<script type="text/javascript">
	$(function () {
	    $('#container').highcharts({
	        chart: {
	            type: 'column'
	        },
	        title: {
	            text: 'Monthly sales performance'
	        },
	        subtitle: {
	            text: 'detail'
	        },
	        xAxis: {
	            categories: [
	                'Jan',
	                'Feb',
	                'Mar',
	                'Apr',
	                'May',
	                'Jun',
	                'Jul',
	                'Aug',
	                'Sep',
	                'Oct',
	                'Nov',
	                'Dec'
	            ]
	        },
	        yAxis: {
	            min: 0,
	            title: {
	                text: 'number'
	            }
	        },
	        tooltip: {
	            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	                '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
	            footerFormat: '</table>',
	            shared: true,
	            useHTML: true
	        },
	        plotOptions: {
	            column: {
	                pointPadding: 0.2,
	                borderWidth: 0
	            }
	        },
	        series: [{
	            name: 'Lock',
	            data: [49, 71, 16, 29, 44, 16, 35, 48, 16, 54, 25, 54]

	        }, {
	            name: 'Stock',
	            data: [83, 78, 28, 23, 16, 34, 45, 24, 11, 43, 26, 62]

	        }, {
	            name: 'Barrel',
	            data: [48, 38, 39, 41, 47, 48, 59, 59, 52, 65, 59, 51]

	        }]
	    });
	});	
	</script>
</head>
<body>
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
Personal Information：<image src="monkey.png" width="200" height="200"/><br><br>Your Sales this month
<br><br>	
	<font size="5" color="black">
		<a href="Employee.jsp">Personal Information</a>
		<a href="Employee_history.jsp">Historical Sales</a>
	</font>
</div>
<div class="controls" style="margin-left: 100px;float:left; margin-top: 70px">	
    <div id="container" style="margin-top: 70px;min-width:700px;height:400px"></div>
</div>

</body>
</body>
</html>