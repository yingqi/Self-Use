<%@page import="com.javaweb.User"%>
<%@page import="com.javaweb.DAOFactory"%>
<%@page import="com.javaweb.UserDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'AdCheck.jsp' starting page</title>

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
    	UserDAO userDAO = DAOFactory.getUserDAOInstance();
    	List<User> all = (List<User>) userDAO.queryAll();
    	Iterator<User> iter = all.iterator();
    	int i=0;
    	while(iter.hasNext()){
    		i++;
        	User user = iter.next();
        	out.println("Username: "+user.getUsername()+"<br>");
    		out.println("Password: "+user.getPassword()+"<br>");
    	}
		out.println(i);
     %>
</body>
</html>
