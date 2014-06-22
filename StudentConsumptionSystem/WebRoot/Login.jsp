<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AdLogin.jsp' starting page</title>
    
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
   <form action="LoginConf.jsp" method="post">
   <h1>SCS Login</h1>
    <table>
    	<tr>
    		<td colspan="3">UserName: </td>
    		<td colspan="3"><input type="text" name="username"></td>
    	</tr>
    	<tr>
    		<td colspan="3">Password</td>
    		<td colspan="3"><input type="password" name="password"></td>
    	</tr>
    	<tr>
			<td colspan="2"><center><input type="radio" name="choice" value="DBA" />DBA</center></td>
			<td colspan="2"><center><input type="radio" name="choice" value="Advisor" />Advisor</center></td>
			<td colspan="2"><center><input type="radio" name="choice" value="Student" />Student</center></td>
		</tr>
    	<tr>
    		<td colspan="6">
    		<center>
    		<input type="submit" value="Login">
    		<input type="reset" value="Reset">
    		</center>
    		</td>
    	</tr>

    </table>
    </form>
  </center>   
  </body>
</html>
