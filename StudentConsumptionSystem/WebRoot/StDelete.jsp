<%@page import="com.scs.javaweb.Student"%>
<%@page import="com.scs.javaweb.Consumption"%>
<%@page import="com.scs.javaweb.DAOFactory"%>
<%@page import="com.scs.javaweb.ConsumptionDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'StDelete.jsp' starting page</title>
    
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
  	ID: <input type="text" name="id">
  	<input type="button" value="Add" onclick="sel()">
	</form>
	<script language="javascript">
	 function sel(){
	      document.thisform.submit();
	}
	</script>
  
	<%
     	String id = request.getParameter("id");

		ConsumptionDAO ConsumptionDAO = DAOFactory.getConsumptionDAOInstance();
		Student student= (Student) session.getAttribute("student");
		if(id!=null&&student!=null){
			Consumption Consumption = new Consumption();			Consumption.setId(Integer.parseInt(id));

   			ConsumptionDAO.delete(Consumption);
   		}

    	ConsumptionDAO ConsumptionDAOtemp = DAOFactory.getConsumptionDAOInstance();
    	List<Consumption> all = (List<Consumption>) ConsumptionDAOtemp.queryByStudent(student.getStudentId());
    	Iterator<Consumption> iter = all.iterator();
    	int i=0;
    	while(iter.hasNext()){
    		i++;
        	Consumption Consumptiontemp = iter.next();
        	out.println("ID: "+Consumptiontemp.getId()+"<br>");
    		out.println("Money: "+Consumptiontemp.getMoney()+"<br>");
    		out.println("Date: "+Consumptiontemp.getDate()+"<br>");
    	}
		out.println("There are "+i+" Consumptions.<br>");
    	
    	
	%>
  </body>
    <p><a href="StLogOut.jsp">Log Out   </a></p>
  <p><a href="StChoice.jsp">Choice Page</a></p>
</html>
