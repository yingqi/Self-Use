<%@page import="java.sql.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'ConnectionDemo.jsp' starting page</title>

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
    	String url = "jdbc:mysql://localhost:3306/javaweb";
    	String user = "root";
    	String password = "123456";
    	Connection conn = null;
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    		conn = DriverManager.getConnection(url,user,password);
    	} catch (ClassNotFoundException e) {
    		out.println("can not found the class");
    	} catch (SQLException e){
    		out.println("fail to connect to database");
    	}
    	
    	try {
    		Statement stmt = conn.createStatement();
    		String addUser = "INSERT INTO user(userid, username, password) VALUES(null,'James','1234')";
    		stmt.executeUpdate(addUser);
    	} catch (SQLException e) {
    		out.println("fail to add user information /n"+e.getMessage());
    	}
    	
    %>
  </body>
</html>
