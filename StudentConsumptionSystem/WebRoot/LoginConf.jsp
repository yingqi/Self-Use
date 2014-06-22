<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AdLoginConf.jsp' starting page</title>
    
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
  	<% 	
  		String username = request.getParameter("username");
     	String password = request.getParameter("password");
     	String choice = request.getParameter("choice");
  	%>
  	<%
  	 	if(username.equals("dba")&&password.equals("123")&&choice.equals("DBA")){
  	%>  
  	<jsp:forward page="DBALoginSuccess.jsp" />
    <%  
    	}
    	else if(choice.equals("Advisor")){
	%>
  	<jsp:forward page="AdLoginConf.jsp" />
	<%  
    	}
    	else if(choice.equals("Student")){
	%>
	<jsp:forward page="StLoginConf.jsp" />
	<%  
    	}
    	else {
	%>
	<jsp:forward page="LoginFailure.jsp" />
	<%} %>
  </body>
</html>
