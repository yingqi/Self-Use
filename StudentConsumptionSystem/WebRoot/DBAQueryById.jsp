<%@page import="com.scs.javaweb.Advisor"%>
<%@page import="com.scs.javaweb.DAOFactory"%>
<%@page import="com.scs.javaweb.AdvisorDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'DBAQueryById.jsp' starting page</title>
    
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
  	<form name="thisform" method="post">
    	<input type="text" name="id">
    	<input type="button" value="query" onclick="sel()">
	</form>
<script language="javascript">
 function sel(){
      document.thisform.submit();
}
</script>
  
	<%
      	String id = request.getParameter("id");
		AdvisorDAO advisorDAO = DAOFactory.getAdvisorDAOInstance();
		try{
			Advisor advisor = advisorDAO.queryById(Integer.parseInt(id));
			   	out.println("Name: "+advisor.getAdvisorname()+"");
    			out.println(" Password: "+advisor.getPassword());
    			out.println(" Position: "+advisor.getPosition());
		}catch(Exception e){
			out.println("Please input the right ID!!!");
		}
    	

	%>
  </body>
</html>
