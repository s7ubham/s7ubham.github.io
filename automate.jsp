<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.*" %>
   
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
String idd="";
if (rs.next()){%>

	<% String ko=rs.getString("PRICE");
	idd=rs.getString("id");
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
<title>Insert title here</title>
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.stock.min.js"></script>

<script>
var ystart=<%=opp%> ;
var v= window.location.href ;  
var str=v.split('=');
var we=str[1];
url1="upvote.jsp?id="+we;
url2="downvote.jsp?id="+we;
url="price.jsp?id="+we;
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
		updateChart(xstart, ystart, dataCount, interval);
		
		}  
}
window.onload=tell();
window.setInterval(tell,2000);

function up(){
	request=new XMLHttpRequest();
	request.open("GET",url1,true);  
	request.send();
	document.getElementById("0100").disabled = true;
	document.getElementById("0102").disabled = true;
	
}
function down(){
	request=new XMLHttpRequest(); 
	request.open("GET",url2,true);  
	request.send(); 
	document.getElementById("0100").disabled = true;
	document.getElementById("0102").disabled = true;
	
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
	  var dataCount = 1000, ystart=<%=opp%>, interval = 2000, xstart = (currentDate.getTime() - (700 * 2000));
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
</script>
</head>
<body>


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
	
<div style="margin-left:95px">


	<a href="view.jsp?id=<%=idd%>">
	<span style="font:25px"><%=naam%></span></a>

</div>

<div style="margin-top:30px;margin-left:95px">

<div id="chartContainer" style="height: 450px; width: 750px;display:inline-block;border-style:solid;"></div>

<div style="display:inline-block;height:fit-content;width:300px;border-style:solid;margin-left:100px">
<input placeholder="Enter buy amount"></input><br>
<span>Current Price:
		<span id="15"></span>
		<%String rtt=rs.getString("PRICE");
		float r2=Float.parseFloat(rtt);
		%>
</span>
<br>
<input placeholder="Enter Sell price"></input>
<br>
<button style="height:30px;width:inherit;color:">Automate</button>
</div>
<div>
<a href="https://www.google.com/search?q=<%=rs.getString("NAME")%>">Click here to know more about this company.</a></div>
</div>
</body>
</html>