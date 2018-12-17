<%@ page language="java" contentType="text/html; charset=utf-8"
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
request.setCharacterEncoding("utf-8");
//request.setCharacterEncoding("euc-kr");
String _id = request.getParameter("id");
String _pw = request.getParameter("pswd");
String _name = new String(request.getParameter("name").getBytes("8859_1"), "utf-8");
Class.forName("com.mysql.jdbc.Driver");
try{
int a;
	Connection conn = DriverManager.getConnection(
		"jdbc:mysql://localhost/gps?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8","root","rlacodud");

	Statement stmt = conn.createStatement();
	a=stmt.executeUpdate("insert into login (userid,userpw,name) values('"+_id+"','"+_pw+"','"+_name+"')");
	
	if(a==1){
		out.println("Creation Account is successed!");
		%>
		<input type="button" value="Let's login!" onclick="window.location='GPS_login_main.html'">
		<%
	}else{
		out.println("삑.");
	}
	stmt.close();
	conn.close();
} catch(Exception e){}
%>
</body>
</html>

