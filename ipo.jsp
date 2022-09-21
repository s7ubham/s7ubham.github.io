<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
    <div style="margin-top:30px;background-color:pink;height:100px;border-style:solid;border-radius:15px">
    <span>There are no live IPOs right now.</span>
    </div>
    <div style="margin-top:50px"></div>
    <span>List of upcoming IPOs</span>

	<% 
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/details","root","");
	PreparedStatement pstmt=null;
	pstmt=con.prepareStatement("select * from upipo");
	ResultSet rs=pstmt.executeQuery();
	while (rs.next()){ 
	%>
		<div class="poop" style="margin-top:5px;width=100%;height=fit-content;display:block;border-radius:15px;border-style:solid;">
		<style>
		.poop{
		box-shadow:0px 0px 10px 0px #0769e0;
		}
		</style>
		<h1 style="display:inline-block; "><%=rs.getString("upiponame") %></h1>
		<h1 style="display:inline-block;margin-left:50px; "> <%=rs.getString("upipo date") %> </h1>
		
		<a href="viewipo.jsp?id=<%=rs.getString("upipoid") %>"  >
		<button style="float:right;height:30px;color:blue;margin-top:15px;margin-right:20px" disabled>View</button>
		</a>
		</div>
	<% }%>
	
</body>
</html>