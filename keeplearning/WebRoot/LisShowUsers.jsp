<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'LisShowUsers.jsp' starting page</title>
    
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
    <%=session.getAttribute("username") %>
    Welcome and you can log out on <a href="LisLogout.jsp">Logout</a>
    <h3>Users</h3>
    <%
    	ArrayList<String> users = (ArrayList<String>) application.getAttribute("allUser");
    	Iterator<String> iter = users.iterator();
   		 while(iter.hasNext()){
    		out.println(iter.next()+"<br>");
    		}
     %>
  </body>
</html>
