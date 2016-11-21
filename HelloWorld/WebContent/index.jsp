<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Electrical Clock</title>
<style type="text/css">
	#clock {
		width: 420px;
		height: 80px;
		background: #E0E0E0;
		font-size: 23px;
		font-weight: bold;
		border: solid 5px orage;
		padding: 20px;
	}
	#week {
		padding-top: 15px;
		color: #0080FF;
	}
</style>
</head>
<body>
	<jsp:useBean id="date" class="charleyking.club.DateBean" scope="application"></jsp:useBean>
	<div align="center">
		<div id="clock">
			<div id="time">
				<jsp:getProperty property="dateTime" name="date"/>
			</div>
			<div id="week">
				<jsp:getProperty property="week" name="date"/>
			</div>
		</div>
	</div>


<pre>
<%
for(int i=1; i<10; i++) {
	for(int j=1; j<=i; j++) {
		out.write(i + "*" +j + "=" + i*j + "  ");
	}
	out.println("");
}
%>
</pre>

</br>
<a href="charles.jsp?id=1&user=charles">charles page</a> </br>
ip address is: <%= request.getRemoteAddr() %> </br></br>

<form action="result.jsp" method="post">
	<table align="center" width="400" height="200" border="1">
		<tr>
			<td align="center" colspan="2" height="40">
				<b>add user information</b>
			</td>
		</tr>
		<tr>
			<td align="right"> name </td>
			<td>
				<input type="text" name="name">
			</td>
		</tr>
		<tr>
			<td align="right"> sex </td>
			<td>
				<input type="text" name="sex">
			</td>
		</tr>
		<tr>
			<td align="right"> age </td>
			<td>
				<input type="text" name="age">
			</td>
		</tr>
		<tr>
			<td align="right"> address </td>
			<td>
				<input type="text" name="address">
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="submit" value="submit">
			</td>
		</tr>
	</table>
</form>
</body>
</html>