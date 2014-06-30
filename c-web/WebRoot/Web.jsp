<%@page import="compiler.Lex"%>
<%@page import="compiler.LexicalAnalysis"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Web.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  

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
  	Input: <input type="text" name="input">
  	<input type="button" value="Compile" onclick="sel()">
	</form>
	<script language="javascript">
	 function sel(){
	      document.thisform.submit();
	}
	</script>
  
	<%
     	String input = request.getParameter("input");
      	LexicalAnalysis la = new LexicalAnalysis();
		ArrayList<Lex> lexs=la.getToken(input);
		out.println("Original: "+input+"<br>");
		for(Lex lex:lexs){
			out.println("Content: "+lex.lex+"  Attribute: "+lex.attribute+"<br>");
		}	
    	
    	
	%>
  </body>

  
</html>

