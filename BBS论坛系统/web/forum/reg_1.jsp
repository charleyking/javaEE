<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="INC/const.jsp"%>
<%
	stats="用户注册";
%>
<%@ include file="INC/theme.jsp"%>
<%
	out.println(headLine(forumID,forumName,forumLogo,"",1,stats));
%>
<FORM name=theForm action=regpost.jsp method=post>
<table cellpadding=0 cellspacing=0 border=0 width=500 bgcolor=<%=aTableBackColor%> align=center>
        <tr>
            <td>
                
<table cellpadding=3 cellspacing=1 border=0 width=100%>
<TBODY> 
<TR align=middle bgcolor=<%=aTableTitleColor%>> 
<TD colSpan=2 height=24><b>新用户注册</b></TD>
</TR>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150>注 册 名**</TD>
<TD> 
<INPUT maxLength=8 size=12 name=userName>
(可以使用中英文匿名)</TD>
</TR>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150>性 别</TD>
<TD> 
<INPUT type=radio CHECKED value="1" name=sex>
<IMG 
      height=27 src="pic/Male.gif" width=25 align=absMiddle>男孩 &nbsp;&nbsp;&nbsp;&nbsp; 
<INPUT type=radio value="0" name=sex>
<IMG 
      height=27 src="pic/Female.gif" width=27 align=absMiddle>女孩</TD>
</TR>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150>密&nbsp;&nbsp;&nbsp;&nbsp;码**</TD>
<TD> 
<INPUT type=password maxLength=16 size=13 name=psw>
</TD>
</TR>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150>密码确认 **</TD>
<TD> 
<INPUT type=password maxLength=16 size=13 name=pswc>
</TD>
</TR>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150 height=32>Email地址 **</TD>
<TD height=32> 
<INPUT maxLength=50 size=27 name=userEmail>
(如：abc@SuperSpace.net) </TD>
</TR>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150 height=32>形象 <img id=face src="<%=picURL%>Image1.gif" alt=个人形象代表>**</TD>
<TD height=15> 
<select name=face size=1 onChange="document.images['face'].src=options[selectedIndex].value;" style="BACKGROUND-COLOR: #99CCFF; BORDER-BOTTOM: 1px double; BORDER-LEFT: 1px double; BORDER-RIGHT: 1px double; BORDER-TOP: 1px double; COLOR: #000000">
<%for(i=1;i<61;i++){%>
<option value='<%=picURL%>Image<%=i%>.gif'>Image<%=i%></option>
<%}%>
</select>
</TR>
<tr bgcolor=<%=tableBodyColor%>> 
<td width=150 height=32>发帖有回复时是否提示</td>
<td height=16>
<input type="radio" name="showRe" value="1" checked>
提示我
<input type="radio" name="showRe" value="0">
不提示
</tr>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150 valign=top>自定义头像<br>
如果图像位置中有连接图片将以自定义的为主</TD>
<TD> 
<% if ("1".equals(uploadFlag)){ %>
<iframe name="ad" frameborder=0 width=300 height=40 scrolling=no src=reg_upload.jsp></iframe> 
<br>
<% } %>
图像位置： 
<input type="TEXT" name="myface" size=20 maxlength=100>
完整Url地址<br>
宽&nbsp;&nbsp;&nbsp;&nbsp;度： 
<input type="TEXT" name="width" size=2 maxlength=2>
20---80的整数<br>
高&nbsp;&nbsp;&nbsp;&nbsp;度： 
<input type="TEXT" name="height" size=2 maxlength=2>
20---80的整数<br>
</TD>
</TR>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150>OICQ号码</TD>
<TD> 
<INPUT maxLength=20 size=44 name=oicq>
</TD>
</TR>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150>签 名<BR>
<BR>
文字将出现在您发表的文章的结尾处。体现您的个性。 </TD>
<TD> 
<TEXTAREA name=sign rows=5 wrap=PHYSICAL cols=42></TEXTAREA>
</TD>
</TR>
<TR align=middle bgcolor=<%=aTableTitleColor%>> 
<TD colSpan=2> 
<DIV align=center> 
<INPUT value="注 册" name=Submit type=submit>
<INPUT type=reset value="重 写" name=Submit2>
</DIV>
</TD>
</TR>
</TBODY> 
</TABLE>
</td></tr></table>
</FORM>

<%@ include file="foot.jsp"%>
