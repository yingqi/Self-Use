<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'LoginConf.jsp' starting page</title>
  </head>
  
  <body>
  	<% 	String username = request.getParameter("username");
     	String password = request.getParameter("password");
  	 %>
  	 <%
  	 	if(username.contains("a")||password.contains("1")){
  	  %>  
  	  <jsp:forward page="LoginForm.jsp" />
  	  <%
  	  	}
  	  	else {
  	   %>
  	   <jsp:forward page="LoginSuccess.jsp" />
  	   <% } %>
  </body>
</html>
