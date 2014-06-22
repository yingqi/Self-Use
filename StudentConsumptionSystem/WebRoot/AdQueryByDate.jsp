<%@page import="com.scs.javaweb.ConsumptionDAO"%>
<%@page import="com.scs.javaweb.Consumption"%>
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
    
    <title>My JSP 'AdQueryByDate.jsp' starting page</title>
    
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
    	StartDate: <input type="text" name="start">
    	EndDate: <input type="text" name="end">
    	<input type="button" value="query" onclick="sel()">
	</form>
<script language="javascript">
 function sel(){
      document.thisform.submit();
}
</script>
  
	<%
      	Advisor advisor = (Advisor) session.getAttribute("advisor");
      	String start = request.getParameter("start");
      	String end = request.getParameter("end");
      	if(start==null||start.equals("null")){
      		start = "1920-1-1";
      	}
      	if(end==null||end.equals("null")){
      		end = "2020-1-1";
      	}
		StudentDAO StudentDAO = DAOFactory.getStudentDAOInstance();
		ConsumptionDAO consumptionDAO = DAOFactory.getConsumptionDAOInstance();
		try{
			List<Student> students = StudentDAO.queryByAdvisor(advisor.getAdvisorId());
			List<Consumption> cons = new ArrayList<Consumption>();
			for(Student student: students){
				List<Consumption> con = consumptionDAO.query(start, end, student.getStudentId());
				for(Consumption c:con){
					cons.add(c);		
				}
			}
			
			Iterator<Consumption> iter = cons.iterator();
    		int i=0;
    		while(iter.hasNext()){
    			i++;
        		Consumption contemp = iter.next();
       		 	out.println("ID: "+contemp.getId()+"<br>");
    			out.println("Date: "+contemp.getDate()+"<br>");
    			out.println("Money: "+contemp.getMoney()+"<br>");
    			out.println("Student: "+contemp.getStudent()+"<br>");
    		}
			out.println("There are "+i+" students.<br>");
			
		}catch(Exception e){
			out.println("Please input the right ID!!!");
		}
	%>
  </body>
    <p><a href="AdLogOut.jsp">Log Out   </a></p>
  <p><a href="AdChoice.jsp">Choice Page</a></p>
  </html>
