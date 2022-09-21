<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/details","root","");
PreparedStatement pstmt=null; 
String as=request.getParameter("id");
pstmt=con.prepareStatement("select * from data1 where id=?");
pstmt.setString(1, as);
ResultSet rs=pstmt.executeQuery();
String naam="s";
float opp=200;
int up=1;
int down=1;
if (rs.next()){%>

	<% String ko=rs.getString("PRICE");
	opp=Float.parseFloat(ko);  
	up=rs.getInt("upvote");
	down=rs.getInt("downvote");
	naam=rs.getString("NAME");
	%>
<%}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>viewstock</title>
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.stock.min.js"></script>
<script type="text/javascript">
var ystart=<%=opp%> ;
var v= window.location.href ;  
var str=v.split('=');
var we=str[1];
url="price.jsp?id="+we;
var request;
var r2;
url2="buy.jsp?id="+we;
url3="sell.jsp?id="+we;

function tell() {
	
	request=new XMLHttpRequest();
	request.onreadystatechange=getInfo;  
	request.open("GET",url,true);  
	request.send();  
} 	
function getInfo(){
	if(request.readyState==4){  
		var val=request.responseText;
		//var ystart=val;
		document.getElementById('15').innerHTML=ystart; 
		//updateChart(xstart, ystart, dataCount, interval);
		ystart=val;
		updateChart(xstart, val, dataCount, interval);
		
		}  
}
window.onload=tell();
window.setInterval(tell,2000);

function buy(){
	r2=new XMLHttpRequest(); 
	r2.open("GET",url2,true);  
	r2.send();
}
function sell(){
	r3=new XMLHttpRequest(); 
	r3.open("GET",url3,true);  
	r3.send();
}
window.onload=function(){
	  var dataPoints = [], currentDate = new Date(), rangeChangedTriggered = false;
	  var stockChart = new CanvasJS.StockChart("chartContainer",{
	    theme: "light2",
	    title:{
	      text:"Price"
	    },
	    rangeChanged: function(e) {
	        rangeChangedTriggered = true;
	    },
	    charts: [{
	      axisX: {
	         crosshair: {
	          enabled: true,
	          valueFormatString: "MMM DD, YYYY HH:mm:ss"
	        }
	      },
	      axisY: {
	        title: "New Price",
	        stripLines: [{
	          showOnTop: true,
	          lineDashType: "dash",
	          color: "#ff4949",
	          labelFontColor: "#ff4949",
	          labelFontSize: 14
	        }]
	      },
	      toolTip: {
	        shared: true
	      },
	      data: [{
	        type: "line",
	        name: "Price",
	        xValueFormatString: "MMM DD, YYYY HH:mm:ss",
	        xValueType: "dateTime",
	        dataPoints : dataPoints
	      }]
	    }],
	    navigator: {
	      slider: {
	        minimum: new Date(currentDate.getTime() - (90 * 2000))
	      }
	    },
	    rangeSelector: {
	      enabled: false
	    }
	  });
	  var dataCount = 500, ystart=<%=opp%>, interval = 2000, xstart = (currentDate.getTime() - (700 * 2000));
	  updateChart(xstart, ystart, dataCount, interval);
	  function updateChart(xstart, ystart, length, interval) {
	    var xVal = xstart, yVal = ystart;
	    for(var i = 0; i < length; i++) {
	   	yVal = yVal +  Math.round(-7 + (Math.random() *(6.52 +7 +1)));
	      
	      dataPoints.push({x: xVal,y: yVal});
	      xVal += interval;
	    }
	    if(!rangeChangedTriggered) {
	        stockChart.options.navigator.slider.minimum = new Date(xVal - (90 * 2000));
	    }
	    stockChart.options.charts[0].axisY.stripLines[0].value =  dataPoints[dataPoints.length - 1].y;
	    stockChart.options.charts[0].axisY.stripLines[0].label = stockChart.options.charts[0].axisY.stripLines[0]["value"];
	    xstart = xVal;
	    dataCount = 1;
	    ystart = yVal;
	    stockChart.render();
	    setTimeout(function() { updateChart(xstart, ystart, dataCount, interval); }, 2000);
	  }
	}
function bbutton(){
	var clear=""
	document.getElementById('54').innerHTML=clear;
	var po="Congratulations, You have bought this Stock!"
	document.getElementById('54').innerHTML=po;
	r2=new XMLHttpRequest(); 
	r2.open("GET",url2,true);  
	r2.send();
	
}
function sbutton(){
	var clear=""
	document.getElementById('54').innerHTML=clear;
	var po="Congratulations, You have sold this Stock!"
	document.getElementById('54').innerHTML=po;
	r3=new XMLHttpRequest(); 
	r3.open("GET",url3,true);  
	r3.send();
	
}
</script>
</head>
<body style="">


<link rel="stylesheet" href="styles.css" >
    <div id="1" class="first" style="width: 100%;padding: 0%;margin-top: 25px;border: none;height: fit-content;"> 
        
        <div id="1a" style="margin-left: 95px;margin-right: 125px;border: none;padding: 0%;">
            
            <a href="index.html">
            <img src="image/LOGO.png"  height="75PX" style="padding: 0%;margin: 0%;">
            </a>
        </div>
        
        <div id="1b" style="  border-radius: 5% ; border-width: 2px;border-style:solid ;margin-left: 90px;margin-right: 125px;margin-top: 16px;">
            <input type="search" name="search bar" placeholder="Enter stocks" style="height: 38px;width: 300px ;vertical-align: top;border: none;">
            <button type="submit" style="background-color:#0769e0; padding: 0%;margin: 0%;float: right;width: fit-content;height: 38px;border-radius: 5%;">
            <span style="font-size: 22px;color: white;">Search</span>
            </button>
            
            
                
                
        </div>
        <div id="1c" style="margin-left: 125px;margin-right: 125px;;vertical-align: top;margin-top: 17.5px;border: none;">

            <a href="welcome.jsp">
                <button type="button" name="Account" style="border-radius: 5%;background-color:#0769e0 ; height: 38px;width: fit-content;vertical-align: top; ">    
                    <span style="font-size: 22px;color: white;">Account</span>
                </button>
            </a>
        </div>
    </div>
    <hr style="height:2px;border-width:0;color:gray;background-color:gray">
	<div style="margin-top:50px"></div>
	
<div>


	<span style="font:25px;margin-left:95px"><%=naam %></span>


</div>
<div style="margin-top:30px;margin-left:95px">
<div id="chartContainer" style="height: 450px; width: 750px;display:inline-block;border-style:solid;"></div>
<div style="display:inline-block;height:fit-content;width:fit-content;border-style:solid;margin-left:100px">
<button onclick="bbutton()"style="background-color:#0769e0;margin-left:50px;"><span style="font:25px;clolor:white">Buy</span></button>
<button onclick="sbutton()"style="background-color:#0769e0;margin-left:120px;"><span style="font:25px;clolor:white">Sell</span></button>
<div style="height:fit-content;width:fit-content;">
<span>Current Price:
		<span id="15"></span>
		
</span>
<br>
<span>Upvotes:
		<%=down%>

</span>
<br>
<span>Downvotes:
		
		<%=up
		
		%>
		<%float r2= opp; %>
		
		

</span>
<br>
<span>Expected Price:
		<%
		float exp=r2+r2*(up/down)/100;%>
		<%=exp %>

</span>

</div>

</div>
<div>
<a href="https://www.google.com/search?q=<%=naam%>">Click here to know more about this company.</a></div>
<div>
<span style=" color:green;" id="54">
</span>
</div>
</div>
</body>
</html>