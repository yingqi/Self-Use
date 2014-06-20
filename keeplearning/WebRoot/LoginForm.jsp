<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'LoginForm.jsp' starting page</title>
	</head>
  
  <body>
  	<center>
  		<form action="LoginConf.jsp" method="post">
  		<table>
  			<tr>
  				<td colspan="2">Login</td>
  			</tr>
  			<tr>
  				<td>Username:</td>
  				<td><input type="text" name="username" /></td>
  			</tr>
  			<tr>
  				<td>Password</td>
  				<td><input type="text" name="password" /></td>
  			</tr>
  			<tr>
  				<td colspan="2">
  					<input type="submit" value="login" />
  					<input type="submit" value="reset" />
  				</td>
  			</tr>
  		</table> 		
  		</form>
  	</center>  
  </body>
</html>
