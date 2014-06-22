<%@page import="com.scs.javaweb.Advisor"%>
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
    
    <title>My JSP 'AdAdd.jsp' starting page</title>
    
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
  	Name: <input type="text" name="name">
  	Password: <input type="text" name="password">
  	<input type="button" value="Add" onclick="sel()">
	</form>
	<script language="javascript">
	 function sel(){
	      document.thisform.submit();
	}
	</script>
  
	<%
     	String name = request.getParameter("name");
     	String password = request.getParameter("password");
		StudentDAO studentDAO = DAOFactory.getStudentDAOInstance();
		Advisor advisor= (Advisor) session.getAttribute("advisor");
		if(name!=null&&password!=null&&advisor!=null){
			Student student = new Student();
   		student.setStudentname(name);
   		student.setPassword(password);
   		student.setAdvisor(advisor.getAdvisorId());
   		studentDAO.insert(student);
   		}
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
  </body>
  <p><a href="AdLogOut.jsp">Log Out   </a></p>
  <p><a href="AdChoice.jsp">Choice Page</a></p>
  
</html>
