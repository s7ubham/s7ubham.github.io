<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.*" %>
   <%@ page import="java.util.*" %>
   <%@ page import="java.io.*" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String stt= request.getParameter("id") ;%>
<%String logic=(String)session.getAttribute("up");%>
<%String buy=("buy");
String uu=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/details","root","");
PreparedStatement ppp=null;
ppp=con.prepareStatement("select * from data1 where id=?");
ppp.setString(1,uu);
ResultSet rs2=ppp.executeQuery();
if (rs2.next()){
	String llpp=rs2.getString("upvote");
	String llpp0= rs2.getString("countt");
	String ko=rs2.getString("price");
	
	int lpp= Integer.parseInt(llpp);
	int lpp0= Integer.parseInt(llpp0);
	
	PreparedStatement pstmt=null;
	pstmt=con.prepareStatement("update data1 set upvote=?,countt=? where id=?");
	lpp+=1;
	lpp0+=1;
	pstmt.setInt(1,lpp);
	pstmt.setInt(2,lpp0);
	pstmt.setString(3,uu);
	pstmt.executeUpdate();
}%>
</body>
	</html>