<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'LoginConf.jsp' starting page</title>
  </head>
  
  <body>
  	<% 	String username = request.getParameter("username");
  		session.setAttribute("username", username);
  	 %>
  	  <jsp:forward page="LisShowUsers.jsp" />
  </body>
</html>
