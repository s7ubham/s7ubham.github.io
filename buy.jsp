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
<%String logi=(String)session.getAttribute("login");%>
<%String buy=("buy");
String uu=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/details","root","");
PreparedStatement ppp=null;
ppp=con.prepareStatement("select * from data1 where id=?");
ppp.setString(1,uu);
ResultSet rs2=ppp.executeQuery();
if (rs2.next()){
	String u22=rs2.getString("price");
	double  uuuu=Double.parseDouble(u22);
	PreparedStatement pstmt=null;
	pstmt=con.prepareStatement("insert into transac(emailid,stockid,type,value) values(?,?,?,?)");
	pstmt.setString(1,logi);
	pstmt.setString(2,stt);
	pstmt.setString(3,buy);
	pstmt.setDouble(4,uuuu);
	pstmt.executeUpdate();
	PreparedStatement pp1=null;
	pp1=con.prepareStatement("select * from login where email=?");
	pp1.setString(1,logi);
	ResultSet rrr=pp1.executeQuery();
	if (rrr.next()){
	double xx=rrr.getDouble("money");
	double x=xx-uuuu;




	PreparedStatement pp0=null;
	pp0=con.prepareStatement("update login set money=? where email=?");
	pp0.setDouble(1,x);
	pp0.setString(2,logi);
	pp0.executeUpdate();
	}}
%>

</body>
</html>