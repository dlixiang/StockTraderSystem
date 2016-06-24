<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee-history</title>
	<link type="text/css" rel="stylesheet" href="bootstrap/bootstrap.min.css">
	<script type="text/javascript" src="bootstrap/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="bootstrap/highcharts.js"></script>
	<script type="text/javascript">
<%--	$(function () {
		Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function(color) {
    return {
        radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
        stops: [
            [0, color],
            [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
        ]
    };
});
    $('#container').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: 'Regional sales profile'
        },
        tooltip: {
    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000',
                   formatter:  function() {
                        return '<b>'+ this.point.name +'</b>: '+ this.percentage +'% ';   
                    
                    } 
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Browser share',
            data: [
                ['A',   45.0],
                ['B',       26.8],
                {
                    name: 'C',
                    y: 12.8,
                    sliced: true,
                    selected: true
                },
                ['D',    8.5],
                ['E',     6.2],              
            ]
        }]
    });
});  --%>
$(function () {
    
    var colors = Highcharts.getOptions().colors,
        categories = ['A', 'B', 'C', 'D', 'E'],
        name = 'Browser brands',
        data = [{
                y: 55.11,
                color: colors[0],
                drilldown: {
                    name: 'A Area',
                    categories: ['A lock', 'A stock', 'A barrel'],
                    data: [10.85, 7.35, 33.06],
                    color: colors[0]
                }
            }, {
                y: 21.63,
                color: colors[1],
                drilldown: {
                    name: 'B Area',
                    categories: ['B lock', 'B stock', 'B barrel'],
                    data: [ 1.58, 13.12, 5.43],
                    color: colors[1]
                }
            }, {
                y: 11.94,
                color: colors[2],
                drilldown: {
                    name: 'C Area',
                    categories: ['C lock', 'C stock', 'C barrel'],
                    data: [9.91, 0.50, 0.22],
                    color: colors[2]
                }
            }, {
                y: 7.15,
                color: colors[3],
                drilldown: {
                    name: 'D Area',
                    categories: ['C lock', 'C stock', 'C barrel'],
                    data: [4.55, 1.42, 0.23, 0.21, 0.20, 0.19, 0.14],
                    color: colors[3]
                }
            }, {
                y: 2.14,
                color: colors[4],
                drilldown: {
                    name: 'E Area',
                    categories: ['C lock', 'C stock', 'C barrel'],
                    data: [ 0.12, 0.37, 1.65],
                    color: colors[4]
                }
            }];


    // Build the data arrays
    var browserData = [];
    var versionsData = [];
    for (var i = 0; i < data.length; i++) {

        // add browser data
        browserData.push({
            name: categories[i],
            y: data[i].y,
            color: data[i].color
        });

        // add version data
        for (var j = 0; j < data[i].drilldown.data.length; j++) {
            var brightness = 0.2 - (j / data[i].drilldown.data.length) / 5 ;
            versionsData.push({
                name: data[i].drilldown.categories[j],
                y: data[i].drilldown.data[j],
                color: Highcharts.Color(data[i].color).brighten(brightness).get()
            });
        }
    }

    // Create the chart
    $('#container').highcharts({
        chart: {
            type: 'pie'
        },
        title: {
            text: 'Regional sales profile'
        },
        yAxis: {
            title: {
                text: 'Total percent market share'
            }
        },
        plotOptions: {
            pie: {
                shadow: false,
                center: ['50%', '50%']
            }
        },
        tooltip: {
    	    valueSuffix: '%'
        },
        series: [{
            name: 'Browsers',
            data: browserData,
            size: '60%',
            dataLabels: {
                formatter: function() {
                    return this.y > 5 ? this.point.name : null;
                },
                color: 'white',
                distance: -30
            }
        }, {
            name: 'Versions',
            data: versionsData,
            size: '80%',
            innerSize: '60%',
            dataLabels: {
                formatter: function() {
                    // display only if larger than 1
                    return this.y > 1 ? '<b>'+ this.point.name +':</b> '+ this.y +'%'  : null;
                }
            }
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
<div class="navbar navbar-default navbar-fixed-top" style="margin-top: 60px">
	<ul class="nav nav-tabs" style="margin-left: 60px">	
		<li><a href="Boss.jsp">Employee information</a></li>
		<li><a href="Boss_history.jsp">Sales performance</a></li>		
	</ul>
</div>
<div id="container" style="min-width:700px;height:400px;margin-top: 130px"></div>

</body>
</html>