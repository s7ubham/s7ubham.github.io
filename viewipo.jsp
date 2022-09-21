<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>viewipo</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/details","root","");
PreparedStatement pstmt=null; %>
<% String as=request.getParameter("id");
pstmt=con.prepareStatement("select * from ipo where id=?");
pstmt.setString(1, as);
ResultSet rs=pstmt.executeQuery();
if (rs.next()){%>
	<h1><%=rs.getString("Name") %></h1>
	<h1><%=rs.getString("Base_Price") %></h1>
	<h1><%=rs.getString("Date") %></h1>
<%}
%>




</body>
</html>