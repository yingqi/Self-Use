<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'Practice.jsp' starting page</title>

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
    <jsp:useBean id="person1" scope="page" class="com.javaweb.Person"></jsp:useBean>
    <jsp:setProperty property="name" name="person1" value="James"/>
    <jsp:setProperty property="sex" name="person1" value="male"/>
    <jsp:setProperty property="age" name="person1" value="21"/>
    <jsp:useBean id="person2" scope="page" class="com.javaweb.Person"></jsp:useBean>
    <jsp:setProperty property="name" name="person2" value="Yao"/>
    <jsp:setProperty property="sex" name="person2" value="male"/>
    <jsp:setProperty property="age" name="person2" value="27"/>
    <table border="1">
    	<tr>
    		<td>name</td>
    		<td>sex</td>
    		<td>age</td>
    	</tr>
    	<tr>
    		<td><jsp:getProperty property="name" name="person1" /> </td>
    		<td><jsp:getProperty property="sex" name="person1" /> </td>
    		<td><jsp:getProperty property="age" name="person1" /> </td>
    	</tr>
    	<tr>
    		<td><jsp:getProperty property="name" name="person2" /> </td>
    		<td><jsp:getProperty property="sex" name="person2" /> </td>
    		<td><jsp:getProperty property="age" name="person2" /> </td>
    	</tr>
    </table>
  </body>
</html>
