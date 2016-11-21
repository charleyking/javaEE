<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
out.println("wirte something at first" + "\n");
Connection connection = null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1/charles","root", "charleyking");
	if (connection != null) {
		out.println("connection success");
		connection.close();
	} else {
		out.write("connection fale");
	}
} catch (ClassNotFoundException e) {
	e.printStackTrace();
	out.println("class not found");
} catch (SQLException e) {
	e.printStackTrace();
} finally {
	out.println("write something at last");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JDBC in JSP</title>
</head>
<body>

</body>
</html>