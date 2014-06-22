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
    
    <title>My JSP 'DBADelete.jsp' starting page</title>
    
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
  	<input type="button" value="Delete" onclick="sel()">
	</form>
<script language="javascript">
 function sel(){
      document.thisform.submit();
}
</script>
  
	<%
      	String id = request.getParameter("id");
		AdvisorDAO advisorDAO = DAOFactory.getAdvisorDAOInstance();
		Advisor advisor = new Advisor();
		if(id!=null){
			advisor.setAdvisorId(Integer.parseInt(id));
			advisorDAO.delete(advisor);
		}
    	

    	
    	
    	AdvisorDAO advisorDAOtemp = DAOFactory.getAdvisorDAOInstance();
    	List<Advisor> all = (List<Advisor>) advisorDAOtemp.queryAll();
    	Iterator<Advisor> iter = all.iterator();
    	int i=0;
    	while(iter.hasNext()){
    		i++;
        	Advisor advisortemp = iter.next();
        	out.println("Advisorname: "+advisortemp.getAdvisorname()+"<br>");
    		out.println("Password: "+advisortemp.getPassword()+"<br>");
    		out.println("Position: "+advisortemp.getPosition()+"<br>");
    	}
		out.println("There are "+i+" advisors.<br>");
	%>
  </body>
</html>
