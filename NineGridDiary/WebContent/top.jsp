<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
#notClickDiv{
	opacity:0.35;
	background:#FF0000;
	position:absolute;
	z-index:9;
	top:0px;
	left:0px;
	margin:0px;
	padding:0px;
	display:none;
}
#topDiv{
	background-image:url(images/bg_top.jpg);
	width:800px;
	height:176px;
}
#navigationDiv{
	background-image:url(images/navigation_bg.jpg);
	width:790px;
	height:26px;
	padding:5px 5px 0px 5px;
	margin:0px;
}
#navigationLeft{
	float:left;
	color:#000000;
}
#navigationRight{
	float:right;
	text-align:right;
	color:#000000;
}
#loginDiv{
	position:absolute;
	width:280px;
	padding:4px;
	height:156px;
	z-index:10;
	background-color:#546B51;
}
#loginTitle{
	padding:15px;
	background-color:#FCFBF0;
	color:#1B7F5D;
	font-size:14px;
	font-weight:bold;
	margin:0px;
}
#loginList{
	list-style:none;
	margin:0px;
}
#loginList li{
	padding:5px;
}
</style>

<div id="notClickDiv"></div>
<div id="topDiv"></div>
<div id="navigationDiv">
	<div id="navigationLeft">
		<c:if test="${!empty sessionScope.userName}">
			<b> &nbsp; >> &nbsp; welcome ${sessionScope.userName} login into nine grid diary web!</b>
		</c:if>
		<c:if test="${empty sessionScope.userName}">
			<b> &nbsp; >> &nbsp; welcome to nine grid diary web!</b>
		</c:if>
	</div>
	<div id="navigationRight">
		<a href="DiaryServlet?action=listAllDiary">Home page</a>
		<c:if test="${empty sessionScope.userName}">
			&nbsp; | &nbsp; <a href="#" onClick="LoginOpen('login')">login</a>
			&nbsp; | &nbsp; <a href="#" onClick="RegisterOpen('register')">register</a>
			&nbsp; | &nbsp; <a href="forgetPassword.jsp">forget password</a>
		</c:if>
		<c:if test="${!empty sessionScope.userName}">
			&nbsp; | &nbsp; <a href="DiaryServlet?action=listMyDiary">My diary</a>
			&nbsp; | &nbsp; <a href="writeDiary.jsp">write diary</a>
			&nbsp; | &nbsp; <a href="UserServlet?action=exit">exit</a>
		</c:if>
	</div>
</div>
<div id="loginDiv">
	<form name="form" method="post" action="" id="form">
		<div id="loginTitle">nine grid diary web -- user login<b></b></div>
		<div id="loginContent">
			<ul id="loginList">
				<li> username: <input type="text" name="username" style="width:120px"> </li>
				<li> password: <input type="password" name="password" style="width:120px"></li>
				<li style="padding-left:40px;"> 
					<input name="Submit_login" type="button" value="login">
					<input name="Submit_close" type="button" value="close">
				</li>
			</ul>
		</div>
	</form>
</div>



