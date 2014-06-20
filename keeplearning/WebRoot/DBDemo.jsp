<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'DBDemo.jsp' starting page</title>
  </head>
  
  <body>
    <%
    	try {
    	Class.forName("com.mysql.jdbc.Driver");
    	out.println("find driver");
    	} catch(ClassNotFoundException e){
    	out.println("can not find driver");
    	}
    %>
  </body>
</html>
