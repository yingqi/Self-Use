<%@page import="com.scs.javaweb.StudentDAO"%>
<%@page import="com.scs.javaweb.Student"%>
<%@page import="com.scs.javaweb.Advisor"%>
<%@page import="com.scs.javaweb.AdvisorDAO"%>
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
    
    <title>My JSP 'AdChoice.jsp' starting page</title>
    
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
    <h1>Login Success</h1>
   
   <%
     	Advisor advisor= (Advisor) session.getAttribute("advisor");
     		StudentDAO studentDAOtemp = DAOFactory.getStudentDAOInstance();
    		List<Student> all = (List<Student>) studentDAOtemp.queryByAdvisor(advisor.getAdvisorId());
    		Iterator<Student> iter = all.iterator();
    		int i=0;
    		while(iter.hasNext()){
    			i++;
        		Student studenttemp = iter.next();
       		 	out.println("Studentname: "+studenttemp.getStudentname()+"<br>");
    			out.println("Password: "+studenttemp.getPassword()+"<br>");
    			out.println("Advisor: "+studenttemp.getAdvisor()+"<br>");
    			out.println("ConsumptionSum: "+studenttemp.getConsumption()+"<br>");
    		}
			out.println("There are "+i+" students.<br>");
	%>
	<form action="AdJudge.jsp" method="post">
		<center>
			<table>
				<tr>
					<td colspan="4">Work To DO</td>
				</tr>
				<tr>
					<td><input type="radio" name="choice" value="check" />check</td>
					<td><input type="radio" name="choice" value="add" />add</td>
					<td><input type="radio" name="choice" value="update" />update</td>
					<td><input type="radio" name="choice" value="delete" />delete</td>
					<td><input type="radio" name="choice" value="queryByDate" />queryByDate</td>
					<td><input type="radio" name="choice" value="queryByStudent" />queryByStudent</td>
				</tr>
				<tr>
					<td colspan="4"><input type="submit" name="submit" value="submit" /></td>
				</tr>
			</table>
		</center>
	</form>
	</center>
  </body>
  <p><a href="AdLogOut.jsp">Log Out   </a></p>
  <p><a href="AdChoice.jsp">Choice Page</a></p>
</html>
