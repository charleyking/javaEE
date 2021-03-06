if exists (select * from dbo.sysobjects where id = object_id(N'[bbs].[bbs1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bbs].[bbs1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[bbs].[bbslink]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bbs].[bbslink]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[bbs].[bbsnews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bbs].[bbsnews]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[bbs].[board]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bbs].[board]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[bbs].[bookmark]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bbs].[bookmark]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[bbs].[class]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bbs].[class]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[bbs].[config]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bbs].[config]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[bbs].[friend]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bbs].[friend]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[bbs].[log]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bbs].[log]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[bbs].[message]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bbs].[message]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[bbs].[myuser]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bbs].[myuser]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[bbs].[online]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bbs].[online]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[bbs].[vote]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bbs].[vote]
GO

CREATE TABLE [bbs].[bbs1] (
	[AnnounceID] [numeric](11, 0) IDENTITY (1, 1) NOT NULL ,
	[ParentID] [numeric](11, 0) NOT NULL ,
	[Child] [numeric](11, 0) NOT NULL ,
	[BoardID] [numeric](11, 0) NOT NULL ,
	[UserName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[UserEmail] [varchar] (255) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Topic] [varchar] (255) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Body] [varchar] (2000) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[DateAndTime] [datetime] NOT NULL ,
	[hits] [numeric](11, 0) NOT NULL ,
	[length] [numeric](11, 0) NOT NULL ,
	[RootID] [numeric](11, 0) NOT NULL ,
	[layer] [numeric](11, 0) NOT NULL ,
	[orders] [numeric](11, 0) NOT NULL ,
	[isbest] [numeric](11, 0) NOT NULL ,
	[ip] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Expression] [varchar] (255) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[times] [numeric](11, 0) NOT NULL ,
	[locktopic] [numeric](11, 0) NOT NULL ,
	[signflag] [numeric](11, 0) NOT NULL ,
	[emailflag] [numeric](11, 0) NOT NULL ,
	[istop] [numeric](11, 0) NOT NULL ,
	[isvote] [numeric](11, 0) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [bbs].[bbslink] (
	[id] [numeric](11, 0) IDENTITY (1, 1) NOT NULL ,
	[boardname] [char] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[readme] [char] (255) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[url] [char] (150) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [bbs].[bbsnews] (
	[id] [numeric](11, 0) IDENTITY (1, 1) NOT NULL ,
	[boardid] [numeric](11, 0) NOT NULL ,
	[title] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[content] [varchar] (2000) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[username] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[addtime] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [bbs].[board] (
	[boardid] [numeric](11, 0) IDENTITY (1, 1) NOT NULL ,
	[BoardType] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[class] [numeric](11, 0) NOT NULL ,
	[readme] [varchar] (255) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[BoardMaster] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[lockboard] [numeric](11, 0) NOT NULL ,
	[boardskin] [numeric](11, 0) NOT NULL ,
	[Tableback] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Tabletitle] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Tablebody] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[aTablebody] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[TableFont] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[TableContent] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[AlertFont] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[lastpostuser] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[lastposttime] [datetime] NOT NULL ,
	[lastbbsnum] [numeric](11, 0) NOT NULL ,
	[lasttopicnum] [numeric](11, 0) NOT NULL ,
	[strAllowForumCode] [numeric](11, 0) NOT NULL ,
	[strAllowHTML] [numeric](11, 0) NOT NULL ,
	[strIMGInPosts] [numeric](11, 0) NOT NULL ,
	[strIcons] [numeric](11, 0) NOT NULL ,
	[strflash] [numeric](11, 0) NOT NULL ,
	[Forumlogo] [varchar] (255) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[indexIMG] [varchar] (255) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[lastrootid] [numeric](11, 0) NOT NULL ,
	[lasttopic] [varchar] (255) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[todayNum] [numeric](11, 0) NOT NULL ,
	[boarduser] [varchar] (2000) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [bbs].[bookmark] (
	[id] [numeric](11, 0) IDENTITY (1, 1) NOT NULL ,
	[username] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[url] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[topic] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[addtime] [varchar] (19) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [bbs].[class] (
	[id] [numeric](11, 0) IDENTITY (1, 1) NOT NULL ,
	[class] [char] (50) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [bbs].[config] (
	[ForumName] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ForumURL] [varchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[CompanyName] [varchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[HostUrl] [varchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[SMTPServer] [varchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[SystemEmail] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[TimeAdjust] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ScriptTimeOut] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Logo] [varchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Picurl] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Faceurl] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[EmailFlag] [numeric](11, 0) NOT NULL ,
	[Uploadpic] [numeric](11, 0) NOT NULL ,
	[IpFlag] [numeric](11, 0) NOT NULL ,
	[FromFlag] [numeric](11, 0) NOT NULL ,
	[guestuser] [numeric](11, 0) NOT NULL ,
	[guestlogin] [numeric](11, 0) NOT NULL ,
	[openmsg] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[badwords] [varchar] (255) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[AnnounceMaxBytes] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[MaxAnnouncePerPage] [varchar] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Maxtitlelist] [varchar] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Tablebackcolor] [varchar] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[aTablebackcolor] [varchar] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Tabletitlecolor] [varchar] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[aTabletitlecolor] [varchar] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Tablebodycolor] [varchar] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[aTablebodycolor] [varchar] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[TableFontcolor] [varchar] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[TableContentcolor] [varchar] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[AlertFontColor] [varchar] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ContentTitle] [varchar] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ads1] [nvarchar] (2000) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ads2] [nvarchar] (2000) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Copyright] [varchar] (255) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Version] [varchar] (255) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[TitleFlag] [numeric](3, 0) NOT NULL ,
	[uploadFlag] [numeric](3, 0) NOT NULL ,
	[wealthReg] [numeric](11, 0) NOT NULL ,
	[wealthAnnounce] [numeric](11, 0) NOT NULL ,
	[wealthReannounce] [numeric](11, 0) NOT NULL ,
	[wealthDel] [numeric](11, 0) NOT NULL ,
	[wealthLogin] [numeric](11, 0) NOT NULL ,
	[epReg] [numeric](11, 0) NOT NULL ,
	[epAnnounce] [numeric](11, 0) NOT NULL ,
	[epReannounce] [numeric](11, 0) NOT NULL ,
	[epDel] [numeric](11, 0) NOT NULL ,
	[epLogin] [numeric](11, 0) NOT NULL ,
	[cpReg] [numeric](11, 0) NOT NULL ,
	[cpAnnounce] [numeric](11, 0) NOT NULL ,
	[cpReannounce] [numeric](11, 0) NOT NULL ,
	[cpDel] [numeric](11, 0) NOT NULL ,
	[cpLogin] [numeric](11, 0) NOT NULL ,
	[TopicNum] [numeric](11, 0) NOT NULL ,
	[BbsNum] [numeric](11, 0) NOT NULL ,
	[TodayNum] [numeric](11, 0) NOT NULL ,
	[UserNum] [numeric](11, 0) NOT NULL ,
	[lastUser] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[cookiepath] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Maxonline] [numeric](11, 0) NOT NULL ,
	[MaxonlineDate] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [bbs].[friend] (
	[F_id] [numeric](11, 0) IDENTITY (1, 1) NOT NULL ,
	[F_username] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[F_friend] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[F_addtime] [varchar] (19) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [bbs].[log] (
	[l_id] [numeric](11, 0) IDENTITY (1, 1) NOT NULL ,
	[l_username] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[l_content] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[l_url] [varchar] (255) COLLATE Chinese_PRC_CI_AS NULL ,
	[l_addtime] [varchar] (19) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [bbs].[message] (
	[id] [numeric](11, 0) IDENTITY (1, 1) NOT NULL ,
	[sender] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[incept] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[title] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[content] [varchar] (2000) COLLATE Chinese_PRC_CI_AS NULL ,
	[flag] [numeric](11, 0) NULL ,
	[sendtime] [varchar] (19) COLLATE Chinese_PRC_CI_AS NULL ,
	[delR] [numeric](11, 0) NULL ,
	[delS] [numeric](11, 0) NULL ,
	[isSend] [numeric](11, 0) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [bbs].[myuser] (
	[UserID] [numeric](11, 0) IDENTITY (1, 1) NOT NULL ,
	[UserName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[UserEmail] [varchar] (255) COLLATE Chinese_PRC_CI_AS NULL ,
	[Article] [numeric](11, 0) NULL ,
	[UserPassword] [varchar] (11) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[sign] [varchar] (2000) COLLATE Chinese_PRC_CI_AS NULL ,
	[Sex] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[homepage] [varchar] (255) COLLATE Chinese_PRC_CI_AS NULL ,
	[addDate] [datetime] NULL ,
	[logins] [numeric](11, 0) NULL ,
	[face] [varchar] (255) COLLATE Chinese_PRC_CI_AS NULL ,
	[width] [numeric](11, 0) NULL ,
	[height] [numeric](11, 0) NULL ,
	[Oicq] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[lastlogin] [datetime] NULL ,
	[bbstype] [numeric](11, 0) NULL ,
	[lockuser] [numeric](11, 0) NULL ,
	[userclass] [numeric](11, 0) NULL ,
	[UserGroup] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[userWealth] [numeric](11, 0) NULL ,
	[userEP] [numeric](11, 0) NULL ,
	[userCP] [numeric](11, 0) NULL ,
	[title] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[showre] [numeric](3, 0) NULL ,
	[reann] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [bbs].[online] (
	[id] [numeric](11, 0) NOT NULL ,
	[username] [char] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[userclass] [char] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[stats] [char] (250) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ip] [char] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[startime] [datetime] NOT NULL ,
	[lastimebk] [datetime] NOT NULL ,
	[lastime] [char] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[browser] [char] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[actforip] [char] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[ComeFrom] [char] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[actCome] [char] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [bbs].[vote] (
	[voteid] [numeric](11, 0) IDENTITY (1, 1) NOT NULL ,
	[announceid] [numeric](11, 0) NOT NULL ,
	[vote] [varchar] (2000) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[votenum] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[voteuser] [varchar] (2000) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[votetype] [numeric](11, 0) NOT NULL 
) ON [PRIMARY]
GO

