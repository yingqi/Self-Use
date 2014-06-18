<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'RegisterForm.jsp' starting page</title>

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
  <center>
   <form action="Register.jsp" method="post">
    <table>
    	<tr>
    		<td colspan="2">Register</td>
    	</tr>
    	<tr>
    		<td>UserName: </td>
    		<td><input type="text" name="username"></td>
    	</tr>
    	<tr>
    		<td>Password</td>
    		<td><input type="password" name="userpassword"></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    		<input type="submit" value="Register">
    		<input type="reset" value="Reset">
    		</td>
    	</tr>

    </table>
    </form>
  </center>   
  </body>
</html>
