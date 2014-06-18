<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'JspPlugin.jsp' starting page</title>
  </head>
  
  <body>
    <jsp:plugin code="Clock.class" codebase="Applet" type="applet">
    <jsp:fallback>Can not load Applet.</jsp:fallback>
    </jsp:plugin>
    
  </body>
</html>
