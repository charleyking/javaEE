<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<style>
#div_register{
	width:680px;
	height:400px;
	background-color:green;
	padding:4px;
	position:absolute;
	z-index:11;
}
#div_register_title{
	text-align:center;
	font-weight:bold;
	background-color:pink;
}
#table{
	height:320px;
	background-color:#FFFFFF;
}
#tr_user{
}
#div_user{
	border:#FF0000 2px solid;
	color:#FF0000;
	width:90%;
	height:29px;
	padding-top:8px;
}
</style>

<div id="div_register">
	<form name="registerForm" action="" method="post">
		<div id="div_register_title">
			nine grid diary web--user register
		</div>			
		<table id="table">
			<tr id="tr_user">
				<td height="40" colspan="2" align="center">
					<div id="div_user"></div>
				</td>
			</tr>
			<tr>
				<td height="40" align="left">user name:</td>
				<td height="40" align="left"><input name="user" type="text"></td>
			</tr>
			<tr>
				<td>
					<div id="div_password"></div>
				</td>
			</tr>
			<tr>
				<td height="40" align="left">password:</td>
				<td height="40" align="left"><input name="password" type="password"></td>
			</tr>
			<tr>
				<td height="40" align="left">confirm password:</td>
				<td height="40" align="left"><input name="repassword" type="password">please confirm your password</td>
			</tr>
			<tr id="tr_email">
				<td height="40" colspan="2" align="center"><div id="div_email"></div></td>
			</tr>
			<tr>
				<td height="40" align="right">E-mail: </td>
				<td height="40" align="left"><input name="email" type="text" size="35"></td>
			</tr>
			<tr>
				<td height="40" align="right">address: </td>
				<td height="40" align="left"><select name="province" id="province"></select></td>
			</tr>
			<tr>
				<td height="40" colspan="2" align="center">require to answer following two question if you want to reset password.</td>
			</tr>
			<tr id="tr_question">
				<td height="40" colspan="2" align="center"><div id="div_question"></div></td>
			</tr>
			<tr>
				<td height="40" align="right">question:</td>
				<td height="40" align="left"><input name="question" type="text" id="question" size="35"></td>
			</tr>
			<tr id="tr_answer">
				<td height="40" colspan="2" align="center"><div id="div_answer"></div></td>
			</tr>
			<tr> 
				<td height="40" align="right">answer:</td>
				<td height="40" align="left"><input name="answer" type="text" id="answer" size="35"></td>
			</tr>
			<tr>
				<td height="40">&nbsp;</td>
				<td height="40" align="center"><input name="button_submit" type="button" value="submit"></td>
			</tr>
		</table>
	</form>
</div>