<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
      var object_number = Number(_pnoo);
      var points = 100/object_number;
      var completed_object = prompt("How many tasks have been finished?" + "Number of Objects: "
      + object_number , "");
      function obFunc() {
        document.getElementById( 'objectbar' ).value = points * completed_object;
      }
</script>
</head>
<body>

<h1>Register a Project</h1><p>
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
	int b;
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost/gps?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8","root","rlacodud");
	Statement stmt = conn.createStatement();
  b=stmt.executeUpdate("insert into project(pname,pscale,pnom,pduedate,pdescr,object)values('"+_pname+"','"+_pscale+"','"+_pnom+"','"+_dueDate+"','"+_descr+"','"+_pnoo+"')");

    if(b==1){
    out.println("Project Name:"+_pname);
    out.println("<p>Project Scale:"+_pscale);
    out.println("<p>Number of Members:"+_pnom);
    out.println("<p>Due Date:"+_dueDate);
    out.println("<p>Description:"+_descr);
    out.println("<p>Number of Objects:"+_pnoo);
    out.println("<p><h1>Register Success!</h1>");

    %>

<div>
  <progress value="0" max="100" id="objectbar"></progress>
</div>
<button onclick="obFunc()">Click</button>
<input type="button" value="Go to Project List" onclick="window.location='GPS_projects_viewprevious.jsp'">
<input type="button" value="Register a project" onclick="window.location='GPS_projects_createnew.html'">


  <%
	}else{
		out.println("��.");
	}
	stmt.close();
	conn.close();
}catch(Exception e){

}
  %>

</body>

</html>
