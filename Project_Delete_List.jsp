<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>Project Delete</h1>
<%
Class.forName("com.mysql.jdbc.Driver");

try {
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost/gps?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8","root","rlacodud");
	Statement stmt = conn.createStatement();

	ResultSet rs = stmt.executeQuery("select * from project");
	
	out.println("<table border=1>"
	+"<tr>"
	+"<td> Project Name </td>"
	+"<td> Project Scale</td>"
	+"<td> Number of Members</td>"
	+"<td> Due Date</td>"
	+"<td> Description</td>"
	+"<td> Object</td>"
	+"</tr>");

	while (rs.next()) {
		out.println("<tr>");
		out.println("<td><a href='Project_Delete_UI.jsp?_pname="+rs.getString("pname")+"&_pscale="+rs.getString("pscale")+"&_pnom="+rs.getString("pnom")+"&_dueDate="+rs.getString("pduedate")+"&_descr="+rs.getString("pdescr")+"&_pnoo="+rs.getString("object")+"'>"+rs.getString("pname") + "</a></td>");
		out.println("<td>"+rs.getString("pscale") + "</td>");
		out.println("<td>"+rs.getString("pnom") + "</td>");
		out.println("<td>"+rs.getString("pduedate") + "</td>");
		out.println("<td>"+rs.getString("pdescr") + "</td>");
		out.println("<td>"+rs.getString("object") + "</td>");
		out.println("</tr>");
	}

	out.println("</table>");
	
	rs.close();
	stmt.close();
	conn.close();

} catch (Exception e) {

}

%>

</body>
</html>