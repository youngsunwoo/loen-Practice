<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="/css/base.css">
<link rel="stylesheet" type="text/css" href="/css/layout.css">
<link rel="stylesheet" type="text/css" href="/css/menu.css">
<link rel="stylesheet" type="text/css" href="/css/padm/cms.css">
<link rel="stylesheet" type="text/css" href="/css/jquery-ui-1.10.4.min.css">

<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<script type="text/javascript" src="/js/flatui-checkbox.js"></script>
<script type="text/javascript" src="/js/flatui-radio.js"></script>
<script type="text/javascript" src="/js/Chart.js"></script>

<!-- bootstrap-table -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/bootstrap-table.css">
<script type="text/javascript" src="/js/bootstrap-table.js"></script>

<!-- x-editable (bootstrap 3) -->
<link rel="stylesheet" href="/css/bootstrap-editable.css">
<script type="text/javascript" src="/js/bootstrap-editable.min.js"></script>
<script type="text/javascript" src="/js/bootstrap-table-editable.min.js"></script> 

<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
 <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>




</head>
<body>



<canvas id="speedChart" width="600" height="400"></canvas>



</body>

<script>   

	var USER_DAYS = ${xList};
	
	var speedCanvas = document.getElementById("speedChart");
	Chart.defaults.global.defaultFontFamily = "Lato";
	Chart.defaults.global.defaultFontSize = 18;
	
	var speedData = {
	  labels: USER_DAYS,
	  datasets: [{
	    label: "Car Speed",
	    data: [0, 59, 75, 20, 20, 55, 40],
	    lineTension: 0,
	    fill: false,
	    borderColor: 'orange',
	    backgroundColor: 'transparent',
	    pointBorderColor: 'orange',
	    pointBackgroundColor: 'rgba(255,150,0,0.5)',
	    pointRadius: 5,
	    pointHoverRadius: 10,
	    pointHitRadius: 30,
	    pointBorderWidth: 2,
	    pointStyle: 'rectRounded'
	  }]
	};
	
	var chartOptions = {
	  legend: {
	    display: true,
	    position: 'top',
	    labels: {
	      boxWidth: 80,
	      fontColor: 'black'
	    }
	  },
	  scales: {
	    xAxes: [{
	      gridLines: {
	        display: false,
	        color: "black"
	      },
	      scaleLabel: {
	        display: true,
	        labelString: "Time in Seconds",
	        fontColor: "red"
	      }
	    }],
	    yAxes: [{
	      gridLines: {
	        color: "black",
	        borderDash: [2, 5],
	      },
	      scaleLabel: {
	        display: true,
	        labelString: "Speed in Miles per Hour",
	        fontColor: "green"
	      }
	    }]
	  }
	};
	
	var lineChart = new Chart(speedCanvas, {
	  type: 'line',
	  data: speedData,
	  options: chartOptions
	});
	
	

</script>



</script>
</html>