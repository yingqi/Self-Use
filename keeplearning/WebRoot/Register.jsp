<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'Register.jsp' starting page</title>

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
   	String reqUsername = request.getParameter("username");
   	String reqPassword = request.getParameter("userpassword");
   %>
   
   <%
   	String url = "jdbc:mysql://localhost:3306/javaweb";
    	String user = "root";
    	String password = "123456";
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    		conn = DriverManager.getConnection(url,user,password);
    	} catch (ClassNotFoundException e) {
    		out.println("can not found the class");
    	} catch (SQLException e){
    		out.println("fail to connect to database");
    	}
    	
    	try {
    		String addUser = "INSERT INTO user(userid, username, password) VALUES(null,?,?)";
    		pstmt = conn.prepareStatement(addUser);
    		pstmt.setString(1, reqUsername);
    		pstmt.setString(2, reqPassword);
    		pstmt.executeUpdate();
    	} catch (SQLException e) {
    		out.println("fail to add user information \n"+e.getMessage());
    	}
    	
    	try{
    		if(pstmt != null ){
    		pstmt.close();
    		pstmt = null;
    		}
    		if(conn != null){
    		conn.close();
    		conn = null;
    		}
    	} catch (Exception e){
    		out.println("database closing error");
    	}
   %>
  </body>
</html>
