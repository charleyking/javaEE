<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
    
<%@ page import="java.sql.*" %>

<% 
	request.setCharacterEncoding("gbk");

	int id = Integer.parseInt(request.getParameter("id"));
	int rootId = Integer.parseInt(request.getParameter("rootid"));
	String title = request.getParameter("title");
	
	if (title == null) {
		out.println("error! Please use the bbs in right way!");
		return;
	}
	
	title = title.trim();
	
	if (title.equals("")) {
		out.println("title could not be empty!");
		return;
	}
	
	String cont = request.getParameter("cont");
	
	cont = cont.trim();
	if (cont.equals("")) {
		out.println("content could not be empty!");
		return;
	}
	
	cont = cont.replaceAll("\n", "<br>");
	
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost/bbs?user=root&password=tiger";
	Connection conn = DriverManager.getConnection(url);
	
	conn.setAutoCommit(false);
	
	String sql = "insert into article values (null, ?, ?, ?, ?, now(), 0)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	Statement stmt = conn.createStatement();
	pstmt.setInt(1, id);		//用要被回复的post的id作为回复帖子的pid
	pstmt.setInt(2, rootId);
	pstmt.setString(3, title);
	pstmt.setString(4, cont);
	pstmt.executeUpdate();
	
	stmt.executeUpdate("update article set isleaf = 1 where id = " + id); //将被回复的post的isleaf设置为1，表明它不再是叶子节点
	
	conn.commit();
	conn.setAutoCommit(true);
	
	stmt.close();
	pstmt.close();
	conn.close();
	
	response.sendRedirect("ShowArticleTree.jsp");
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>
</head>
<body>
<font color="red" size="7">
	OK!
</font>
</body>
</html>