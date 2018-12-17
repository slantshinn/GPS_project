<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");
String _id = request.getParameter("id");
String _pw = request.getParameter("pswd");
Class.forName("com.mysql.jdbc.Driver");
try{
	Connection conn = DriverManager.getConnection(
		"jdbc:mysql://localhost/gps?serverTimezone=UTC","root","rlacodud");
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from login where userid='"+_id+"' and userpw='"+_pw+"'");
	
	if(rs.next()){
		out.println("login success!");
		%>
		<input type="button" value="go to main page!" onclick="window.location='GPS_main.html'">
		<%
	}else{
		out.println("등록되지 않은 사용자 입니다.");
	}
	stmt.close();
	conn.close();
} catch(Exception e){}
%>
</body>
</html>