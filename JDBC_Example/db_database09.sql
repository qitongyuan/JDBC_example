/*
SQLyog Professional v12.09 (32 bit)
MySQL - 5.5.20 : Database - db_database09
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_database09` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_database09`;

/*Table structure for table `tb_book` */

DROP TABLE IF EXISTS `tb_book`;

CREATE TABLE `tb_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `bookCount` int(11) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `tb_book` */

insert  into `tb_book`(`id`,`name`,`price`,`bookCount`,`author`) values (1,'Java',34.4,7,'张三'),(2,'计算机引论',34.6,10,'张扬'),(3,'计算机英语',34.6,10,'张扬'),(6,'C#程序',3,4,'3'),(7,'GIS',45.9,5,'孔'),(8,'GIS软件开发教程',45.67,2,'李德仁'),(9,'计算机英语',45.6,5,'John'),(10,'计算机英语',45.6,5,'John'),(11,'离散数学',45.3,3,'Jack'),(21,'java',89,23,'王'),(23,'Intro to Java',34.5,12,'liang'),(24,'历史',3,3,'3'),(25,'等等',2,4,'2');

/*Table structure for table `tb_book_upload` */

DROP TABLE IF EXISTS `tb_book_upload`;

CREATE TABLE `tb_book_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `bookCount` int(11) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `tb_book_upload` */

insert  into `tb_book_upload`(`id`,`name`,`price`,`bookCount`,`author`,`picture`) values (1,'Java',34.4,7,'张三',NULL),(2,'计算机引论',34.6,10,'张扬',NULL),(3,'计算机英语',34.6,10,'张扬',NULL),(6,'C#程序',3,4,'3',NULL),(7,'GIS',45.9,5,'孔',NULL),(8,'GIS软件开发教程',45.67,2,'李德仁',NULL),(9,'计算机英语',45.6,5,'John',NULL),(10,'计算机英语',45.6,5,'John',NULL),(11,'离散数学',45.3,3,'Jack',NULL),(20,'r',5,5,'r',NULL),(21,'java',89,10,'王',NULL),(22,'1',1,1,'1','picture/1_err.png'),(23,'2',2,2,'2','picture/2_28271.jpg'),(24,'4',4,4,'4','picture/4_20151222141116740.jpg'),(25,'java程序设计教程',34,2,'车培强','picture/java程序设计教程_20151222141116740.jpg'),(26,'2',2222,2222,'2','picture/2_29291.jpg'),(27,'2',2222,2222,'2','picture/2_29291.jpg'),(28,'2',2222,2222,'2','picture/2_29291.jpg'),(29,'2',2222,2222,'2','picture/2_29291.jpg'),(30,'22',22222,22,'22','picture/22_28271.jpg'),(31,'22',22222,22,'22','picture/22_28271.jpg');

/*Table structure for table `tb_student` */

DROP TABLE IF EXISTS `tb_student`;

CREATE TABLE `tb_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `tb_student` */

insert  into `tb_student`(`id`,`name`,`sex`,`age`) values (1,'学生0',1,13),(2,'学生1',0,10),(3,'学生2',1,14),(4,'学生3',0,14),(5,'学生4',1,10),(6,'学生5',0,11),(7,'学生6',1,11),(8,'学生7',0,14),(9,'学生8',1,12),(10,'学生9',0,11);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userName` varchar(50) NOT NULL,
  `passWord` varchar(50) NOT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userName`,`passWord`) values ('admin','123');

/* Procedure structure for procedure `add` */

/*!50003 DROP PROCEDURE IF EXISTS  `add` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `add`(`name` varchar(50),`price` double,`bookCount` int,`author` varchar(45))
BEGIN
	#Routine body goes here...
insert into tb_book (name,price,bookCount,author) values(name,price,bookCount,author);
END */$$
DELIMITER ;

/* Procedure structure for procedure `findAllbook` */

/*!50003 DROP PROCEDURE IF EXISTS  `findAllbook` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `findAllbook`()
BEGIN
SELECT * from tb_book ORDER BY id DESC;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
