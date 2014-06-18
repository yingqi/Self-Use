<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'UseBeanDemo.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <jsp:useBean id="user" scope="page" class="com.javaweb.UserBean">
    </jsp:useBean>
    <%
     user.setUsername("James");
     user.setPassword("1234");
     out.println("Username: "+user.getUsername()+"<br>");
     out.println("Password: "+user.getPassword());
    %>
  </body>
</html>
