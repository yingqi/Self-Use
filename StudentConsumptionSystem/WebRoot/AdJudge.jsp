<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AdJudege.jsp' starting page</title>
    
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
    	String str = request.getParameter("choice");
    	if(str.equals("check")){
			response.sendRedirect("AdQueryById.jsp");
    	} else if(str.equals("add")){
    		response.sendRedirect("AdAdd.jsp");
    	} else if(str.equals("update")){
    		response.sendRedirect("AdUpdate.jsp");
    	} else if(str.equals("delete")){
			response.sendRedirect("AdDelete.jsp");
		} else if(str.equals("queryByDate")){
			response.sendRedirect("AdQueryByDate.jsp");
		} else if(str.equals("queryByStudent")){
			response.sendRedirect("AdQueryByStudent.jsp");
    	} else {
    		out.println("error! in AdJudge");
    	}   	
    %>	
  </body>
</html>
