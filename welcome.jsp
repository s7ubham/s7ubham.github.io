<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Welcome : <%=session.getAttribute("login")%></title>


<link rel="stylesheet" href="styles.css">

</head>

<body>

	<link rel="stylesheet" href="styles.css">
	<link rel="stylesheet" href="styles.css" >
    <div id="1" class="first" style="width: 100%;padding: 0%;margin-top: 25px;border: none;height: fit-content;"> 
        
        <div id="1a" style="margin-left: 95px;margin-right: 125px;border: none;padding: 0%;">
            
            <a href="home.jsp">
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
	<div class="main-content" style="margin-left">



		<%
	if(session.getAttribute("login")==null || session.getAttribute("login")==" ") //check condition unauthorize user not direct access welcome.jsp page
	{
		response.sendRedirect("index.html"); 
	}
	%>
		<h1>
			Firstname,
			<%= session.getAttribute("Name") %></h1>
		<h1>
			Lastname,
			<%=session.getAttribute("lastname") %></h1>
		<h1>
			email,
			<%=session.getAttribute("login")%>
		</h1>
		<hr style="height:2px;border-width:0;color:gray;background-color:gray">
		<h1>Transaction Details</h1>
		<div>
			<%
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/details","root","");
	PreparedStatement pstmt=null;
	pstmt=con.prepareStatement("select * from transac where emailid=?");
	String emailo=(String)session.getAttribute("login");
	pstmt.setString(1,emailo);
	ResultSet rs=pstmt.executeQuery();
	String ko="No purchases Yet";
	%>
			<table class="styled-table"
				style="border-collapse: collapse; margin-right:25px;font-size: 0.9em; font-family: sans-serif; width: 100%; box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);">
				<thead style=" background-color: #009879; color: #ffffff; text-align: left;">
					<tr>
						<th style="padding: 12px 15px;">Name</th>
						<th style="padding: 12px 15px;">Price</th>
						<th style="padding: 12px 15px;">Type</th>
					</tr>
				</thead>
				<%
            while(rs.next()){%>
				<% String sr=rs.getString("stockid");
            	PreparedStatement pstmt2=null;
            	pstmt2=con.prepareStatement("select * from data1 where id=?");
            	pstmt2.setString(1,sr);
            	ResultSet rs2=pstmt2.executeQuery();
            	if (rs2.next()){
            	 ko=rs2.getString("NAME");
            	}
            	%>
				<tbody style="border-bottom: 1px solid #dddddd;">
					<tr>
						<td style="padding: 12px 15px;"><%=ko %></td>
						<td style="padding: 12px 15px;"><%=rs.getDouble("value") %></td>
						<td style="padding: 12px 15px;"><%=rs.getString("type") %></td>

					</tr>
					<%}%>
				</tbody>
			</table>
		</div>
		<h2>
			<a href="logout.jsp">Logout </a>
		</h2>




	</div>

</body>

</html>
