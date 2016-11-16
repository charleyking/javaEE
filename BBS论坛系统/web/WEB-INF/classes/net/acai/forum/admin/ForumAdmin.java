package net.acai.forum.admin;
/**
 * Title:        清清网络
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      www.SuperSpace.com
 * @author:       SuperSpace
 * @version 1.0
 */
import net.acai.forum.*;
import net.acai.database.*;
import javax.servlet.http.*;
import java.sql.*;
import net.acai.util.*;
public class ForumAdmin{
	public ForumAdmin(){}

	//////////////////////////////////save mod/////////////
	public void saveMod(HttpServletRequest request) throws Exception{
		int forumID;
		try{
			forumID=ParamUtil.getInt(request,"forumID");
		}
		catch(Exception e){
			throw new Exception("对不起，请您选定您想要修改的论坛ID");
		}
		int forumSkin;
		try{
			forumSkin=ParamUtil.getInt(request,"forumSkin");
		}
		catch(Exception e){
			throw new Exception("对不起，请您选定论坛的类别！");
		}
		Forum theForum=ForumFactory.getForum(forumID);
		if(theForum==null)
			throw new  Exception("错误的论坛");
		if(theForum.getForumSkin()==forumSkin)
			return;

		String forumUser_1="";
		if(forumSkin==5){
			String vipuser=ParamUtil.getString(request,"vipuser");
			if(vipuser!=null&&!"".equals(vipuser.trim())){
				String [] forumUser=vipuser.split("\\n|\\r");

				for(int i=0;i<forumUser.length;i++){
					if(!"".equals(forumUser_1)){
						if(i!=forumUser.length-1)
							forumUser_1+=forumUser[i]+",";
						else
							forumUser_1+=forumUser[i];
					}
				}
			}
		}
		DBConnect dbc=new DBConnect("update bbs.board set boardUser=?,boardskin=? where boardID=?");
		dbc.setBytes(1,(new String(forumUser_1.getBytes("ISO-8859-1"),"GBK")).getBytes());
		dbc.setInt(2,forumSkin);
		dbc.setInt(3,forumID);
		dbc.executeUpdate();
		dbc.close();
	}

	public static void saveNew(HttpServletRequest request) throws  Exception{
		String forumType=ParamUtil.getString(request,"boardtype");
		if(forumType==null||"".equals(forumType.trim()))
			throw new Exception("请输入论坛名称。");
		int classID;
		try{
			classID=ParamUtil.getInt(request,"class");
		}
		catch(Exception e){
			throw new Exception("请选择论坛分类。");
		}
		String forumMaster=ParamUtil.getString(request,"boardmaster","");
		/*if(forumMaster==null||"".equals(forumMaster.trim()))
			throw new Exception("请输入版主姓名。");
		*/
		String readme=ParamUtil.getString(request,"readme");
		if(readme==null||"".equals(readme.trim()))
			throw new Exception("请输入论坛说明。");
		int lockForum;
		try{
			lockForum=ParamUtil.getInt(request,"lockboard");
		}
		catch(Exception e){
			throw new Exception("请选择论坛开放状态。");
		}
		DBConnect dbc=new DBConnect();
		String sql="insert into bbs.board(boardtype,class,boardmaster,readme,lockboard,tableback,tabletitle,\ntablebody,atablebody,tablefont,tablecontent,alertfont,forumlogo,indeximg,\nstrallowforumcode,strallowhtml,strimginposts,stricons,strflash,lastpostuser,\nlastposttime,lastbbsnum,lasttopicnum)\n values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,getdate(),?,?)";
		dbc.prepareStatement(sql);
		dbc.setBytes(1,(new String(forumType.getBytes("ISO-8859-1"),"GBK")).getBytes());
		dbc.setInt(2,classID);
		dbc.setBytes(3,(new String(forumMaster.getBytes("ISO-8859-1"),"GBK")).getBytes());
		dbc.setBytes(4,(new String(readme.getBytes("ISO-8859-1"),"GBK")).getBytes());
		dbc.setInt(5,lockForum);
		dbc.setString(6,ParamUtil.getString(request,"Tableback",""));
		dbc.setString(7,ParamUtil.getString(request,"Tabletitle",""));
		dbc.setString(8,ParamUtil.getString(request,"Tablebody",""));
		dbc.setString(9,ParamUtil.getString(request,"aTablebody",""));
		dbc.setString(10,ParamUtil.getString(request,"TableFont",""));
		dbc.setString(11,ParamUtil.getString(request,"TableContent",""));
		dbc.setString(12,ParamUtil.getString(request,"AlertFont",""));
		dbc.setString(13,ParamUtil.getString(request,"Logo",""));
		dbc.setString(14,ParamUtil.getString(request,"indeIMG",""));
		dbc.setString(15,ParamUtil.getString(request,"strAllowForumCode",""));
		dbc.setString(16,ParamUtil.getString(request,"strAllowHTML",""));
		dbc.setString(17,ParamUtil.getString(request,"strIMGInPosts",""));
		dbc.setString(18,ParamUtil.getString(request,"strIcons",""));
		dbc.setString(19,ParamUtil.getString(request,"strflash",""));
		dbc.setBytes(20,(new String(("未知").getBytes("ISO-8859-1"),"GBK")).getBytes());
		dbc.setInt(21,0);
		dbc.setInt(22,0);
		dbc.executeUpdate();
		if(forumMaster!=null&&!("".equals(forumMaster.trim())))
			addMaster(forumMaster,dbc);

		dbc.close();
	}
	public static void saveEdit(HttpServletRequest request) throws Exception{
		//System.out.println("asdf");
		int editID;
		try{
			editID=ParamUtil.getInt(request,"editid");
		}
		catch(Exception e){
			throw new Exception("请选择编辑论坛的ID。");
		}
		int newforumID;
		try{
			newforumID=ParamUtil.getInt(request,"newforumID");
		}
		catch(Exception e){
			throw new Exception("请填写新论坛的ID。");
		}
		if (newforumID!=editID) {
			Forum tempForum=ForumFactory.getForum(newforumID);
			if(tempForum!=null)
				throw new Exception("您不能指定和别的论坛一样的序号。");
		}
		String forumType=ParamUtil.getString(request,"boardtype");
		if(forumType==null||"".equals(forumType.trim()))
			throw new Exception("请输入论坛名称。");
		int classID;
		try{
			classID=ParamUtil.getInt(request,"class");
		}
		catch(Exception e){
			throw new Exception("请选择论坛分类。");
		}
		String forumMaster=ParamUtil.getString(request,"boardmaster","");
		/*if(forumMaster==null||"".equals(forumMaster.trim()))
			throw new Exception("请输入版主姓名。");*/

		String readme=ParamUtil.getString(request,"readme");
		if(readme==null||"".equals(readme.trim()))
			throw new Exception("请输入论坛说明。");
		int lockForum;
		try{
			lockForum=ParamUtil.getInt(request,"lockboard");
		}
		catch(Exception e){
			throw new Exception("请选择论坛开放状态。");
		}
		String sql="update bbs.board set boardtype=?,class=?,boardmaster=?,readme=?,lockboard=?,tableback=?,\n tabletitle=?,tablebody=?,atablebody=?,tableFont=?,tablecontent=?,alertfont=?,\n forumlogo=?,indexIMG=?,strAllowForumCode=?,strAllowHTML=?,strIMGInPosts=?,\n strIcons=?,strflash=? \n where bbs.board.boardid=?";
		DBConnect dbc=new DBConnect();
		dbc.prepareStatement(sql);

		dbc.setBytes(1,(new String(forumType.getBytes("ISO-8859-1"),"GBK")).getBytes());
		dbc.setInt(2,classID);
		dbc.setBytes(3,(new String(forumMaster.getBytes("ISO-8859-1"),"GBK")).getBytes());
		dbc.setBytes(4,(new String(readme.getBytes("ISO-8859-1"),"GBK")).getBytes());
		dbc.setInt(5,lockForum);
		dbc.setString(6,ParamUtil.getString(request,"Tableback",""));
		dbc.setString(7,ParamUtil.getString(request,"Tabletitle",""));
		dbc.setString(8,ParamUtil.getString(request,"Tablebody",""));
		dbc.setString(9,ParamUtil.getString(request,"aTablebody",""));
		dbc.setString(10,ParamUtil.getString(request,"TableFont",""));
		dbc.setString(11,ParamUtil.getString(request,"TableContent",""));
		dbc.setString(12,ParamUtil.getString(request,"AlertFont",""));
		dbc.setString(13,ParamUtil.getString(request,"Logo",""));
		dbc.setString(14,ParamUtil.getString(request,"indeIMG",""));
		dbc.setString(15,ParamUtil.getString(request,"strAllowForumCode",""));
		dbc.setString(16,ParamUtil.getString(request,"strAllowHTML",""));
		dbc.setString(17,ParamUtil.getString(request,"strIMGInPosts",""));
		dbc.setString(18,ParamUtil.getString(request,"strIcons",""));
		dbc.setString(19,ParamUtil.getString(request,"strflash",""));
		dbc.setInt(20,editID);
		dbc.executeUpdate();
		sql="update bbs.bbs1 set boardid="+newforumID+" where boardid="+editID;
		dbc.executeUpdate(sql);
		if(forumMaster!=null&&!("".equals(forumMaster.trim())))
			addMaster(forumMaster,dbc);
		dbc.close();
	}
	public static void del(HttpServletRequest request) throws Exception{
			int forumID;
		try{
			forumID=ParamUtil.getInt(request,"boardid");
		}
		catch(Exception e){
			throw new Exception("请您选择您要修改的论坛ID");
		}
		String sql="delete from bbs.board where boardid="+forumID;
		DBConnect dbc=new DBConnect(sql);
		dbc.executeUpdate();
		sql="delete from bbs.bbs1 where boardid="+forumID;
		dbc.executeUpdate(sql);
		dbc.close();
	}
	public static void dell(HttpServletRequest request) throws Exception{
		int ID;
		try{
			ID=ParamUtil.getInt(request,"id");
		}
		catch(Exception e){
			throw new Exception("请您选择您要删除的分类的ID");
		}
		DBConnect dbc=new DBConnect();
		String sql = "delete from bbs.class where id="+ID;
		dbc.executeUpdate(sql);
		sql = "delete from bbs.board where class="+ID;
		dbc.executeUpdate(sql);
		sql="select boardid from bbs.board where class="+ID;
		ResultSet rs=dbc.executeQuery(sql);
		while(rs.next()){
			sql="delete from bbs.bbs1 where boardid="+rs.getInt(1);
			dbc.executeUpdate(sql);
		}
		dbc.close();
	}
	public static void updateOrders(HttpServletRequest request) throws Exception{
		int newID;
		try{
			newID=ParamUtil.getInt(request,"newid");

		}
		catch(Exception e){
			throw new Exception("请您选择您想要更新的类别!");
		}
		int ID;
		try{
			ID=ParamUtil.getInt(request,"id");

		}
		catch(Exception e){
			throw new Exception("请您选择您想要更新的类别!");
		}

		if(newID==ID)
			return;
		DBConnect dbc=new DBConnect();
		String sql="select * from bbs.class where id="+newID;
		ResultSet rs=dbc.executeQuery(sql);
		if(rs.next())
			throw new Exception("您输入的序号和其他分类序号相同，请重新输入。");
		sql="update bbs.class set id="+newID+",class=? where id="+ID;
		dbc.prepareStatement(sql);
		dbc.setBytes(1,(new String(ParamUtil.getString(request,"classname","").getBytes("ISO-8859-1"),"GBK")).getBytes());
		dbc.executeUpdate();
		sql="update bbs.board set class="+newID+" where class="+ID;
		dbc.executeUpdate(sql);
		sql="update bbs.board set class="+newID+" where class="+ID;
		dbc.executeUpdate(sql);
		dbc.close();
	}
	public static void saveClass(HttpServletRequest request) throws Exception{
		String classname=ParamUtil.getString(request,"classname");
		if(classname==null)
			throw new Exception("请您输入您想添加分类的名字！");
		String sql="insert into bbs.class(class) values(?)";
		DBConnect dbc=new DBConnect(sql);
		dbc.setBytes(1,(new String(classname.getBytes("ISO-8859-1"),"GBK")).getBytes());
		dbc.executeUpdate();
		dbc.close();
	}
	public String update() throws Exception{
		String sql="select boardid,boardtype from bbs.board";
		DBConnect dbc1=new DBConnect(sql);
		ResultSet rs=dbc1.executeQuery();
		StringBuffer sb=new StringBuffer();
		if(!rs.next()){
			dbc1.close();
			throw new Exception("论坛还没有版面，请先添加版面。");
		}
		// temprs;
		DBConnect dbc=new DBConnect();
		String newuser=newuser(dbc);
		do{

			sql="Select count(announceid) from bbs.bbs1 where boardid="+rs.getInt(1);
			ResultSet temprs=dbc.executeQuery(sql);

			temprs.next();
			String tempString=temprs.getString(1);
			int allArticle=(tempString==null)?0:temprs.getInt(1);

			temprs=dbc.executeQuery("Select count(announceid) from bbs.bbs1 where boardid="+rs.getInt(1) +" and parentID=0");
			temprs.next();
			tempString=temprs.getString(1);
			int allTopic=(tempString==null)?0:temprs.getInt(1);

			ResultSet ers=dbc.executeQuery("select Max(announceid) from bbs.bbs1 where boardid="+rs.getInt(1));
			ers.next();
			tempString=ers.getString(1);

			//int maxID=(tempString==null)?"无":ers.getInt(1);
			String userName,dateandtime;


			if(tempString==null){
				userName="无";
				dateandtime=Format.getDateTime();
			}
			else {
				int maxID=ers.getInt(1);
				ers=dbc.executeQuery("select username,dateandtime from bbs.bbs1 where announceid="+maxID);
				ers.next();
				userName=ers.getString(1);
				dateandtime=ers.getString(2);
			}

			sql="update bbs.board set lastpostuser=?,lastposttime='"+dateandtime+"',lastbbsnum="+allArticle+",lasttopicnum="+allTopic+",TodayNum="+todays(rs.getInt(1),dbc)+" where boardid="+rs.getInt(1);
			dbc.prepareStatement(sql);
			dbc.setBytes(1,(new String(userName.getBytes("ISO-8859-1"),"GBK")).getBytes());
			dbc.executeUpdate();
			sb.append("更新论坛数据成功，"+rs.getString(2)+"共有"+allArticle+"篇贴子，"+allTopic+"篇主题，今日有"+todays(rs.getInt(1),dbc)+"篇帖子。<br>");
		}
		while(rs.next());
		sql="update bbs.config set TopicNum="+titlenum(dbc)+",BbsNum="+gettipnum(dbc)+",TodayNum="+alltodays(dbc)+",UserNum="+allusers(dbc)+",lastUser=?";
		dbc.prepareStatement(sql);
		dbc.setBytes(1,(new String(newuser.getBytes("ISO-8859-1"),"GBK")).getBytes());
		dbc.executeUpdate();
		dbc.close();
		dbc1.close();
		ForumPropertiesManager.resetManager();
		return sb.toString();

	}

	public int  todays(int boardid,DBConnect dbc) throws Exception{
		ResultSet tmprs=dbc.executeQuery("Select count(announceid) from bbs.bbs1 Where  day(dateandtime)=day(getdate()) and boardid="+boardid);
		tmprs.next();
		String tempString=tmprs.getString(1);
		int temp=(tempString==null)?0:tmprs.getInt(1);
		return temp;
	}
	public int alltodays(DBConnect dbc) throws Exception{
    	ResultSet tmprs=dbc.executeQuery("Select count(announceid) from bbs.bbs1 Where  day(dateandtime)=day(getdate())");
		tmprs.next();
		String tempString=tmprs.getString(1);
		int temp=(tempString==null)?0:tmprs.getInt(1);
		return temp;

	}
	public int  allusers(DBConnect dbc) throws Exception{
    	ResultSet tmprs=dbc.executeQuery("Select count(userid) from bbs.myuser");
    	tmprs.next();
		String tempString=tmprs.getString(1);
		int temp=(tempString==null)?0:tmprs.getInt(1);
		return temp;
	}
	public  String newuser(DBConnect dbc) throws Exception{
		ResultSet tmprs=dbc.executeQuery("Select  username from bbs.myuser order by userid desc");
		String newuser;
		if(!tmprs.next()){
			newuser="没有会员";
		}
		else{
			//tmprs.next();
			newuser=tmprs.getString(1);
		}
		return newuser;
	}
	public int  gettipnum(DBConnect dbc) throws Exception{
    	ResultSet tmprs=dbc.executeQuery("Select Count(announceID) from bbs.bbs1");
    	tmprs.next();
		String tempString=tmprs.getString(1);
		int temp=(tempString==null)?0:tmprs.getInt(1);
		return temp;
	}
	public int titlenum(DBConnect dbc) throws Exception{
		ResultSet tmprs=dbc.executeQuery("Select Count(announceID) from bbs.bbs1 where parentID=0");
    	tmprs.next();
		String tempString=tmprs.getString(1);
		int temp=(tempString==null)?0:tmprs.getInt(1);
		return temp;
	}


	//////////////////////////////////////
	public static void addMaster(String masters,DBConnect dbc) throws Exception{

		String [] arr=masters.split("\\|");
		//DBConnect dbc=
		ResultSet rs;
		String sql;
		for(int i=0;i<arr.length;i++){
			sql="select userID from bbs.myuser where userName=?";
			dbc.prepareStatement(sql);
			dbc.setBytes(1,(new String(arr[i].getBytes("ISO-8859-1"),"GBK")).getBytes());
			rs=dbc.executeQuery();
			if(!rs.next()){
				dbc.close();
				throw new Exception("没有发现此用户"+arr[i]);
			}
			sql="update bbs.myuser set userclass=19 where username=?";
			dbc.prepareStatement(sql);
			dbc.setBytes(1,(new String(arr[i].getBytes("ISO-8859-1"),"GBK")).getBytes());
			dbc.executeUpdate();
		}
	}



}
