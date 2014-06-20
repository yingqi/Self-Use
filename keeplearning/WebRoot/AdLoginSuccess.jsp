<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'AdLoginSuccess.jsp' starting page</title>

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
	<form action="AdJudge.jsp" method="post">
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
					<td colspan="4"><input type="submit" name="submit" /></td>
				</tr>
			</table>
		</center>
	</form>

</body>
</html>
