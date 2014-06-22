<%@page import="com.scs.javaweb.AdvisorDAO"%>
<%@page import="com.scs.javaweb.Advisor"%>
<%@page import="com.scs.javaweb.DAOFactory"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'DBAChoice.jsp' starting page</title>
    
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
    	AdvisorDAO advisorDAO = DAOFactory.getAdvisorDAOInstance();
    	List<Advisor> all = (List<Advisor>) advisorDAO.queryAll();
    	Iterator<Advisor> iter = all.iterator();
    	int i=0;
    	while(iter.hasNext()){
    		i++;
        	Advisor advisor = iter.next();
        	out.println("Advisorname: "+advisor.getAdvisorname()+"<br>");
    		out.println("Password: "+advisor.getPassword()+"<br>");
    		out.println("Position: "+advisor.getPosition()+"<br>");
    	}
		out.println("There are "+i+" advisors.<br>");
     %>
   
    <form action="DBAJudge.jsp" method="post">
		<center>
			<table>
				<tr>
					<td colspan="6">Work To DO</td>
				</tr>
				<tr>
					<td><input type="radio" name="choice" value="check" />check</td>
					<td><input type="radio" name="choice" value="add" />add</td>
					<td><input type="radio" name="choice" value="update" />update</td>
					<td><input type="radio" name="choice" value="delete" />delete</td>
				</tr>
				<tr>
					<td colspan="6"><input type="submit" name="submit" value="submit" /></td>
				</tr>
			</table>
		</center>
	</form>
  </body>
</html>
