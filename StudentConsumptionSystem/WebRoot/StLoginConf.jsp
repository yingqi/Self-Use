<%@page import="com.scs.javaweb.Student"%>
<%@page import="com.scs.javaweb.DAOFactory"%>
<%@page import="com.scs.javaweb.StudentDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'StLoginConf.jsp' starting page</title>
    
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
  		String name = request.getParameter("username");
     	String password = request.getParameter("password");
     	StudentDAO studentDAO = DAOFactory.getStudentDAOInstance();
     	Student student= studentDAO.query(name, password);
		if(student!=null){
		session.setAttribute("student", student);
   		response.sendRedirect("StChoice.jsp");
   		}else{
   %>
   <jsp:forward page="LoginFailure.jsp"></jsp:forward>
   <%} %>
  </body>
</html>
