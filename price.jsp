<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/details","root","");
PreparedStatement pstmt=null; %>
<% String as=request.getParameter("id");
pstmt=con.prepareStatement("select * from data1 where id=?");
pstmt.setString(1, as);
ResultSet rs=pstmt.executeQuery();%>
<%
		if (rs.next()){
		String varr=rs.getString("PRICE");
		float vv=Float.parseFloat(varr);
		int MAX = 3;
		Random random = new Random();
		int rand = random.nextInt(MAX) * (random .nextBoolean() ? -1 : 1);
		float x=vv+vv*(rand)/100;
		String sw=Float.toString(x); ;
		String finall=request.getParameter("id");
		PreparedStatement pp=null;
		pp=con.prepareStatement("update data1 set PRICE=? where id=?");
		pp.setString(1,sw);
		pp.setString(2,finall);
		pp.executeUpdate();
		PreparedStatement test=null;
		test=con.prepareStatement("select * from data1 where id=?");
		test.setString(1,finall);
		ResultSet woo= test.executeQuery();
		if (woo.next()){%>
		<%String y=woo.getString("PRICE");
		out.print(y);
		%>
		
		
	
		<%}}%>
</body>
</html>