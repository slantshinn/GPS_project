<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<hi>Project Delete</h1><p>
<%

request.setCharacterEncoding("utf-8");

String _pname = request.getParameter("pname");
String _pscale = request.getParameter("pscale");
String _pnom = request.getParameter("pnom");
String _dueDate = request.getParameter("duedate");
String _descr = request.getParameter("pdescription");
String _pnoo = request.getParameter("pnoo");


	Class.forName("com.mysql.jdbc.Driver");
try{
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost/gps?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8","root","rlacodud");
	Statement stmt = conn.createStatement();
    stmt.executeUpdate( "delete from project where pname='"+_pname+"'");

    
  out.println("Project Name:"+_pname);
    out.println("<p>Project Scale:"+_pscale);
    out.println("<p>Number of Members:"+_pnom);
    out.println("<p>Due Date:"+_dueDate);
    out.println("<p>Description:"+_descr);
	out.println("<p>Description:"+_pnoo);
    out.println("<p><h1>Delete Success!</h1>");
%>
<input type="button" value="go to project List!" onclick="window.location='Project_Update_List.jsp'">
<%
	stmt.close();
	conn.close();
}catch(Exception e){
	
}
%>

</body>
</html>