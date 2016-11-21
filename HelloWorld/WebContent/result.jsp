<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="person" class="charleyking.club.Person" scope="page">
	<jsp:setProperty name="person" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table align="center" width="400">
	<tr>
		<td align="left"> name </td>
		<td>
			<jsp:getProperty property="name" name="person"/>
		</td>
	</tr>
	<tr>
		<td align="left"> sex </td>
		<td>
			<jsp:getProperty property="sex" name="person"/>
		</td>
	</tr>
	<tr>
		<td align="left"> age </td>
		<td> 
			<jsp:getProperty property="age" name="person"/>
		</td>
	</tr>
	<tr>
		<td align="left"> address </td>
		<td>
			<jsp:getProperty property="address" name="person"/>
		</td>
	</tr>
	
</table>
</body>
</html>