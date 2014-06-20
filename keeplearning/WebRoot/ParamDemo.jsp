<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'ParamDemo.jsp' starting page</title>

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
    <form action="UseForm.jsp" method="post">
    	User name:<input type="text" name="username" /><br>
    	Password:<input type="text" name="password" /><br>
    	Name:<input type="text" name="name" /><br>
    	Sex:<input type="text" name="sex" /><br>
    	Hobby:<input type="checkbox" name="interest" value="basketball"/>basketball
    	<input type="checkbox" name="interest" value="books"/>books
    	<input type="checkbox" name="interest" value="coding"/>coding    	
    	<br>
    	<input type="submit" value="submit" />
    	<input type="reset" value="reset" />    	
    </form>
  </body>
</html>
