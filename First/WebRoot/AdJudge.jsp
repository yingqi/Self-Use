<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'AdJudge.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="style	s.css">
	-->

  </head>
  
  <body>
    <%
    	String str = request.getParameter("choice");
    	if(str.equals("check")){
    %>
    	<jsp:forward page="AdCheck.jsp"></jsp:forward>
    <%
    	} else if(str.equals("add")){
    	
    %>	
     	<jsp:forward page="AdAdd.jsp"></jsp:forward>
    <%
    	} else if(str.equals("update")){
    	
    %>	
     	<jsp:forward page="AdUpdate.jsp"></jsp:forward>
    <%
    	} else if(str.equals("delete")){
    	
    %>		
     	<jsp:forward page="AdDelete.jsp"></jsp:forward>
    <%
    	} else {
    		out.println("error! not found why");
    	}
    	
    %>	
  </body>
</html>
