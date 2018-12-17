<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="Project_Delete_Query.jsp" method="post">
<%
request.setCharacterEncoding("utf-8");

String _pname = request.getParameter("pname");
String _pscale = request.getParameter("pscale");
String _pnom = request.getParameter("pnom");
String _dueDate = request.getParameter("duedate");
String _descr = request.getParameter("pdescription");
String _pnoo = request.getParameter("pnoo");

%>


<font size="15">Delete Project</font>

<table>
<tr><td>Project Name : </td><td><input type="text" name="pname" value=<%=_pname%>></td></tr>
<tr><td>Project Scale : </td><td><input type="password" name="pscale" value=<%=_pscale%>></td></tr>
<tr><td>Number of Members : </td><td><input type="text" name="pnom"value=<%=_pnom%>></td></tr>
<tr><td>Due Date : </td><td><input type="text" name="duedate"value=<%=_dueDate%>></td></tr>
<tr><td>Description : </td><td><input type="text" name="pdescription" value=<%=_descr%>></td></tr>
<tr><td>object : </td><td><input type="text" name="pnoo" value=<%=_pnoo%>></td></tr>

 <tr><td>	</td><td> <input type="submit" value="Delete"></td></tr>


</table>
 </form>
 
 
 
 
 
</body>
</html>