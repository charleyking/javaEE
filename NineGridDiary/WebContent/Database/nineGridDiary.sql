CREATE DATABASE IF NOT EXISTS nineGridDiary;
USE nineGridDiary;

DROP TABLE IF EXISTS tb_diary;
CREATE TABLE tb_diary (
	id int(10) unsigned NOT NULL AUTO_INCREMENT,
	title varchar(60) NOT NULL,
	address varchar(50) NOT NULL,
	writeTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	userid int(10) unsigned NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=gbk;

INSERT INTO tb_diary (id,title,address,writeTime,userid) VALUES
(6,'good title','zhejiang','2016-11-22 09:20:23',1),
(7,'bad title','fujian','2016-11-23 09:21.23',1),
(8,'fun title','hangzhou','2016-11-23 08:21:22',1),
(9,'boring title','beijing','2016-11-24 08:22:23',2),
(10,'happy title','shanghai','2016-11-25 08:22:24',1),
(11,'sad title','guangzhou','2016-11-26 09:32:22',1);

DROP TABLE IF EXISTS tb_user;
CREATE TABLE tb_user (
	id int(10) unsigned NOT NULL AUTO_INCREMENT,
	username varchar(50) NOT NULL,
	password varchar(50) NOT NULL,
	email varchar(100) NOT NULL,
	question varchar(50) NOT NULL,
	answer varchar(50) NOT NULL,
	city varchar(30) NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

INSERT INTO tb_user VALUES
(1,'wang','wangpwd','wang@gmail.com','wangwho','wangis','taizhou'),
(2,'zhang','zhangpwd','zhang@gmail.com','zhangwho','zhangis','hangzhou'),
(3,'shen','shenpwd','shen@gmail.com','shenwho','shenis','wenzhou'),
(4,'pan','panpwd','pan@gmail.com','panwho','panis','jinhua'),
(5,'lai','laipwd','lai@gmail.com','laiwho','laiis','ningbo'),
(6,'yang','yangpwd','yang@gmail.com','yangwho','yangis','quzhou'),
(7,'li','lipwd','li@gmail.com','liwho','liis','henan');