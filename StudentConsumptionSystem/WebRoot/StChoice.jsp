<%@page import="com.scs.javaweb.ConsumptionDAO"%>
<%@page import="com.scs.javaweb.Consumption"%>
<%@page import="com.scs.javaweb.Student"%>
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

<title>My JSP 'StChoice.jsp' starting page</title>

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
    	Student student = (Student) session.getAttribute("student");
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

		<form action="StJudge.jsp" method="post">
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
					</tr>
					<tr>
						<td colspan="4"><input type="submit" name="submit" value="submit"/>
						</td>
					</tr>
				</table>
			</center>
		</form>
	</center>
</body>
  <p><a href="StLogOut.jsp">Log Out   </a></p>
  <p><a href="StChoice.jsp">Choice Page</a></p>
</html>
