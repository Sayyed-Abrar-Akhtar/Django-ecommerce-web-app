/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 10.4.10-MariaDB : Database - ontrendclothing
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ontrendclothing` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ontrendclothing`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add type',7,'add_type'),
(26,'Can change type',7,'change_type'),
(27,'Can delete type',7,'delete_type'),
(28,'Can view type',7,'view_type'),
(29,'Can add user',8,'add_user'),
(30,'Can change user',8,'change_user'),
(31,'Can delete user',8,'delete_user'),
(32,'Can view user',8,'view_user'),
(33,'Can add vendor',9,'add_vendor'),
(34,'Can change vendor',9,'change_vendor'),
(35,'Can delete vendor',9,'delete_vendor'),
(36,'Can view vendor',9,'view_vendor'),
(37,'Can add product',10,'add_product'),
(38,'Can change product',10,'change_product'),
(39,'Can delete product',10,'delete_product'),
(40,'Can view product',10,'view_product'),
(41,'Can add customer',11,'add_customer'),
(42,'Can change customer',11,'change_customer'),
(43,'Can delete customer',11,'delete_customer'),
(44,'Can view customer',11,'view_customer'),
(45,'Can add customize',12,'add_customize'),
(46,'Can change customize',12,'change_customize'),
(47,'Can delete customize',12,'delete_customize'),
(48,'Can view customize',12,'view_customize'),
(49,'Can add review',13,'add_review'),
(50,'Can change review',13,'change_review'),
(51,'Can delete review',13,'delete_review'),
(52,'Can view review',13,'view_review');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `key` varchar(50) NOT NULL,
  `img` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `customer` */

insert  into `customer`(`id`,`user`,`first_name`,`last_name`,`email`,`key`,`img`) values 
(5,'test','Hary','test1','test@gmail.com','test','images/shl_zzHcWoQ.png'),
(6,'cust','customer','cust','cust@email.com','cust','images/hnf_o3bGAsm.jpeg');

/*Table structure for table `customize` */

DROP TABLE IF EXISTS `customize`;

CREATE TABLE `customize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mainbanner` varchar(100) NOT NULL,
  `menbanner` varchar(100) NOT NULL,
  `womenbanner` varchar(100) NOT NULL,
  `featureprodtitle` varchar(50) NOT NULL,
  `herosubtitle` varchar(50) NOT NULL,
  `herotitle` varchar(50) NOT NULL,
  `reviewsectiontitle` varchar(50) NOT NULL,
  `ghostbtntitle` varchar(50) NOT NULL,
  `herobtntitle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `customize` */

insert  into `customize`(`id`,`mainbanner`,`menbanner`,`womenbanner`,`featureprodtitle`,`herosubtitle`,`herotitle`,`reviewsectiontitle`,`ghostbtntitle`,`herobtntitle`) values 
(1,'images/12_05_2019.jpg','images/66254445_10157643080379905_9019679652314087424_n.jpg','hero.jpg','Ontrend this summer','Shop online','Stay home and','Our customers get all Apparel from us.','Reviews','All Products'),
(2,'images/12_05_2019.jpg','images/56604939_10156742564560399_6013573359705522176_n.jpg','hero.jpg','Ontrend this summer','Shop online','Stay home and','Our customers get all Apparel from us.','Reviews','All Products'),
(3,'images/70550984_10157373051965535_3336865258831609856_n.jpg','images/64514024_2171307086325281_2513036548014866432_n.jpg','images/66695107_2171307216325268_6767799174848053248_n.jpg','Ontrend this summer','Shop online','Stay home and','Our customers get all Apparel from us.','Reviews','All Products'),
(4,'images/70550984_10157373051965535_3336865258831609856_n.jpg','images/64514024_2171307086325281_2513036548014866432_n.jpg','images/66695107_2171307216325268_6767799174848053248_n.jpg','Summer sale','Shop online','Stay home','Our customers get all Apparel from us.','Reviews','Shop Sale'),
(5,'70550984_10157373051965535_3336865258831609856_n.jpg','64514024_2171307086325281_2513036548014866432_n.jpg','66695107_2171307216325268_6767799174848053248_n.jpg','Ontrend this summer','Shop online','Stay home and','Our customers get all Apparel from us.','Reviews','All Products'),
(6,'images/70550984_10157373051965535_3336865258831609856_n.jpg','images/64514024_2171307086325281_2513036548014866432_n.jpg','images/66695107_2171307216325268_6767799174848053248_n.jpg','Ontrend this summer','Shop online','Stay home and','Our customers get all Apparel from us.','Reviews','All Products'),
(7,'images/70550984_10157373051965535_3336865258831609856_n.jpg','images/64514024_2171307086325281_2513036548014866432_n.jpg','images/66695107_2171307216325268_6767799174848053248_n.jpg','Ontrend this summer','Shop online','Stay home','Our customers get all Apparel from us.','Reviews','All Products'),
(8,'images/70550984_10157373051965535_3336865258831609856_n.jpg','images/siksilk-s-s-inset-cuff-fade-panel-tech-tee-navy-neon-fade-p4702-43931_medium.jpg','images/siksilk-luxury-cropped-hoodie-white-p4335-39537_image.jpg','Ontrend this summer','Shop online','Stay home and','Our customers get all Apparel from us.','Reviews','All Products'),
(9,'images/1.png','images/12158773_Black_706471_003_ProductLarge.jpg','images/10220773_Pristine_722580_003_ProductLarge.jpg','Trending this summer','Shop online','Stay home','Valued review from our customer','Reviews..','Shop sale');

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(11,'product','customer'),
(12,'product','customize'),
(10,'product','product'),
(13,'product','review'),
(7,'product','type'),
(8,'product','user'),
(9,'product','vendor'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2020-02-12 10:09:39.294199'),
(2,'auth','0001_initial','2020-02-12 10:09:41.486277'),
(3,'admin','0001_initial','2020-02-12 10:09:51.441856'),
(4,'admin','0002_logentry_remove_auto_add','2020-02-12 10:09:54.709170'),
(5,'admin','0003_logentry_add_action_flag_choices','2020-02-12 10:09:54.892034'),
(6,'contenttypes','0002_remove_content_type_name','2020-02-12 10:09:56.339889'),
(7,'auth','0002_alter_permission_name_max_length','2020-02-12 10:09:57.559133'),
(8,'auth','0003_alter_user_email_max_length','2020-02-12 10:09:57.776157'),
(9,'auth','0004_alter_user_username_opts','2020-02-12 10:09:57.834153'),
(10,'auth','0005_alter_user_last_login_null','2020-02-12 10:09:59.282807'),
(11,'auth','0006_require_contenttypes_0002','2020-02-12 10:09:59.338186'),
(12,'auth','0007_alter_validators_add_error_messages','2020-02-12 10:09:59.400162'),
(13,'auth','0008_alter_user_username_max_length','2020-02-12 10:09:59.607698'),
(14,'auth','0009_alter_user_last_name_max_length','2020-02-12 10:09:59.786964'),
(15,'auth','0010_alter_group_name_max_length','2020-02-12 10:09:59.963850'),
(16,'auth','0011_update_proxy_permissions','2020-02-12 10:10:00.023033'),
(17,'product','0001_initial','2020-02-12 10:10:01.498041'),
(18,'product','0002_auto_20200123_1604','2020-02-12 10:10:04.201254'),
(19,'product','0003_user_img','2020-02-12 10:10:04.621561'),
(20,'product','0004_auto_20200209_2105','2020-02-12 10:10:05.107366'),
(21,'product','0005_auto_20200210_1119','2020-02-12 10:10:05.873987'),
(22,'product','0006_auto_20200210_1236','2020-02-12 10:10:06.050506'),
(23,'product','0007_remove_customer_displayimg','2020-02-12 10:10:06.308838'),
(24,'product','0008_remove_customer_prodreview','2020-02-12 10:10:06.639446'),
(25,'product','0009_auto_20200210_1307','2020-02-12 10:10:07.279202'),
(26,'product','0010_auto_20200210_1755','2020-02-12 10:10:08.511966'),
(27,'product','0011_customize_reviewbanner','2020-02-12 10:10:09.120250'),
(28,'sessions','0001_initial','2020-02-12 10:10:09.803778'),
(29,'product','0012_auto_20200212_1736','2020-02-12 11:51:46.305116'),
(30,'product','0013_auto_20200212_2034','2020-02-12 14:49:53.414587'),
(31,'product','0014_customize_reviewsectiontitle','2020-02-12 14:54:22.880753'),
(32,'product','0015_auto_20200212_2051','2020-02-12 15:06:32.950226'),
(33,'product','0016_auto_20200212_2059','2020-02-12 15:14:18.199405'),
(34,'product','0017_auto_20200212_2102','2020-02-12 15:17:12.741217'),
(35,'product','0018_auto_20200212_2105','2020-02-12 15:20:12.789005');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('6aji3nzj6ytkt6bmzscsa67fsbbu3w6s','NmFhMDA4NmNkNTg5ZjYwNjI1YzE3NzEwYzg0NGNjMWQ1YzBkYzYxZjp7ImlkIjo0LCJpc0FkbWluIjp0cnVlLCJjdXN0aWQiOjYsInVzZXJuYW1lIjoiYWRtaW4iLCJwYXNzd29yZCI6ImFkbWluIn0=','2020-03-01 14:14:26.086005');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `SKU` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `price` int(10) unsigned NOT NULL CHECK (`price` >= 0),
  `featureImg` varchar(100) NOT NULL,
  `displayImg` varchar(100) NOT NULL,
  `displayImgFirst` varchar(100) NOT NULL,
  `displayImgSecond` varchar(100) NOT NULL,
  `displayImgThird` varchar(100) NOT NULL,
  `xs` int(10) unsigned NOT NULL CHECK (`xs` >= 0),
  `sm` int(10) unsigned NOT NULL CHECK (`sm` >= 0),
  `md` int(10) unsigned NOT NULL CHECK (`md` >= 0),
  `lg` int(10) unsigned NOT NULL CHECK (`lg` >= 0),
  `xl` int(10) unsigned NOT NULL CHECK (`xl` >= 0),
  `xxl` int(10) unsigned NOT NULL CHECK (`xxl` >= 0),
  `xxxl` int(10) unsigned NOT NULL CHECK (`xxxl` >= 0),
  `type_id` varchar(50) NOT NULL,
  `vendor_id` varchar(50) NOT NULL,
  PRIMARY KEY (`SKU`),
  KEY `product_type_id_f5092b03_fk_type_type` (`type_id`),
  KEY `product_vendor_id_30810528_fk_vendor_vendor` (`vendor_id`),
  CONSTRAINT `product_type_id_f5092b03_fk_type_type` FOREIGN KEY (`type_id`) REFERENCES `type` (`type`),
  CONSTRAINT `product_vendor_id_30810528_fk_vendor_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

/*Data for the table `product` */

insert  into `product`(`SKU`,`title`,`description`,`price`,`featureImg`,`displayImg`,`displayImgFirst`,`displayImgSecond`,`displayImgThird`,`xs`,`sm`,`md`,`lg`,`xl`,`xxl`,`xxxl`,`type_id`,`vendor_id`) values 
(1,'TUTAN II TEE','Superdry men\'s Pro racer rescue jacket. This ski jacket is designed to keep you looking amazing on the slopes. The jacket features six zip fastened outer pockets including one shoulder pocket and a pocket on the arm for your ski pass. The jacket also has an inner mesh pocket to keep your valuables safe. The Pro racer rescue jacket features a drawstring adjustable hood with detachable faux fur trim, zip and popper fastening with a hook and loop collar for extra security, a bungee cord adjustable hem, and a powder skirt to keep the snow out.',500,'images/12167185_Black_768005_003_ProductLarge.jpg','images/12167185_Black_768005_004_ProductLarge.jpg','images/12167185_Black_768005_005_ProductLarge.jpg','images/12167185_Black_768005_001_ProductLarge.jpg','images/12167185_Black_768005_002_ProductLarge.jpg',0,0,0,0,0,0,0,'TSHIRT','JACK JONE'),
(3,'TAPE DRESS','Superdry men\'s Pro racer rescue jacket. This ski jacket is designed to keep you looking amazing on the slopes. The jacket features six zip fastened outer pockets including one shoulder pocket and a pocket on the arm for your ski pass. The jacket also has an inner mesh pocket to keep your valuables safe. The Pro racer rescue jacket features a drawstring adjustable hood with detachable faux fur trim, zip and popper fastening with a hook and loop collar for extra security, a bungee cord adjustable hem, and a powder skirt to keep the snow out.',0,'images/siksilk-tape-collar-t-shirt-dress-white-p4338-39575_medium.jpg','images/siksilk-tape-collar-t-shirt-dress-white-p4338-39579_medium.jpg','images/siksilk-tape-collar-t-shirt-dress-white-p4338-39576_medium.jpg','images/siksilk-tape-collar-t-shirt-dress-white-p4338-39577_medium.jpg','images/siksilk-tape-collar-t-shirt-dress-white-p4338-39578_medium.jpg',0,0,0,0,0,0,0,'DRESS','SIKSIKL'),
(4,'SIAN O NECK KNIT','Superdry men\'s Pro racer rescue jacket. This ski jacket is designed to keep you looking amazing on the slopes. The jacket features six zip fastened outer pockets including one shoulder pocket and a pocket on the arm for your ski pass. The jacket also has an inner mesh pocket to keep your valuables safe. The Pro racer rescue jacket features a drawstring adjustable hood with detachable faux fur trim, zip and popper fastening with a hook and loop collar for extra security, a bungee cord adjustable hem, and a powder skirt to keep the snow out.',0,'images/27006317_BrightWhite_003_ProductLarge.jpg','images/27006317_BrightWhite_004_ProductLarge.jpg','images/27006317_BrightWhite_005_ProductLarge.jpg','images/27006317_BrightWhite_008_ProductLarge.jpg','images/27006317_BrightWhite_001_ProductLarge.jpg',0,0,0,0,0,0,0,'DRESS','JACK JONE'),
(5,'KAYLA  BLAZER','Superdry men\'s Pro racer rescue jacket. This ski jacket is designed to keep you looking amazing on the slopes. The jacket features six zip fastened outer pockets including one shoulder pocket and a pocket on the arm for your ski pass. The jacket also has an inner mesh pocket to keep your valuables safe. The Pro racer rescue jacket features a drawstring adjustable hood with detachable faux fur trim, zip and popper fastening with a hook and loop collar for extra security, a bungee cord adjustable hem, and a powder skirt to keep the snow out.',0,'images/15198947_Black_003_ProductLarge.jpg','images/15198947_Black_004_ProductLarge.jpg','images/15198947_Black_005_ProductLarge.jpg','images/15198947_Black_001_ProductLarge.jpg','images/15198947_Black_002_ProductLarge.jpg',0,0,0,0,0,0,0,'BLAZER','JACK JONE'),
(6,'RAIN SKINNY JEANS','Superdry men\'s Pro racer rescue jacket. This ski jacket is designed to keep you looking amazing on the slopes. The jacket features six zip fastened outer pockets including one shoulder pocket and a pocket on the arm for your ski pass. The jacket also has an inner mesh pocket to keep your valuables safe. The Pro racer rescue jacket features a drawstring adjustable hood with detachable faux fur trim, zip and popper fastening with a hook and loop collar for extra security, a bungee cord adjustable hem, and a powder skirt to keep the snow out.',0,'images/15195834_DarkBlueDenim_003_ProductLarge_9fhqUGZ.jpg','images/15195834_DarkBlueDenim_004_ProductLarge_S0Fz1z7.jpg','images/15195834_DarkBlueDenim_005_ProductLarge_3wbTAZU.jpg','images/15195834_DarkBlueDenim_001_ProductLarge_H1YbmnH.jpg','images/15195834_DarkBlueDenim_002_ProductLarge_6IQTSyk.jpg',0,0,0,0,0,0,0,'BLAZER','ONLYY'),
(7,'MAYE CARDIGAN','Superdry men\'s Pro racer rescue jacket. This ski jacket is designed to keep you looking amazing on the slopes. The jacket features six zip fastened outer pockets including one shoulder pocket and a pocket on the arm for your ski pass. The jacket also has an inner mesh pocket to keep your valuables safe. The Pro racer rescue jacket features a drawstring adjustable hood with detachable faux fur trim, zip and popper fastening with a hook and loop collar for extra security, a bungee cord adjustable hem, and a powder skirt to keep the snow out.',0,'images/10220801_Black_003_ProductLarge.jpg','images/10220801_Black_004_ProductLarge.jpg','images/10220801_Black_005_ProductLarge.jpg','images/10220801_Black_006_ProductLarge.jpg','images/10220801_Black_001_ProductLarge.jpg',0,0,0,0,0,0,0,'BLAZER','IN GIRL MIND'),
(8,'CRISTABEL FUR','Superdry men\'s Pro racer rescue jacket. This ski jacket is designed to keep you looking amazing on the slopes. The jacket features six zip fastened outer pockets including one shoulder pocket and a pocket on the arm for your ski pass. The jacket also has an inner mesh pocket to keep your valuables safe. The Pro racer rescue jacket features a drawstring adjustable hood with detachable faux fur trim, zip and popper fastening with a hook and loop collar for extra security, a bungee cord adjustable hem, and a powder skirt to keep the snow out.',0,'images/10220801_MistyRose_003_ProductLarge.jpg','images/10220801_MistyRose_004_ProductLarge.jpg','images/10220801_MistyRose_006_ProductLarge.jpg','images/10220801_MistyRose_001_ProductLarge.jpg','images/10_01_2019.jpg',0,0,0,0,0,0,0,'BLAZER','IN GIRL MIND'),
(10,'DANIELLE MIDI DRESS','Superdry men\'s Pro racer rescue jacket. This ski jacket is designed to keep you looking amazing on the slopes. The jacket features six zip fastened outer pockets including one shoulder pocket and a pocket on the arm for your ski pass. The jacket also has an inner mesh pocket to keep your valuables safe. The Pro racer rescue jacket features a drawstring adjustable hood with detachable faux fur trim, zip and popper fastening with a hook and loop collar for extra security, a bungee cord adjustable hem, and a powder skirt to keep the snow out.',0,'images/si5097_3_.jpg','images/si5097_1_.jpg','images/si5097_3__1.jpg','images/si5097_2_.jpg','images/si5097_2__2.jpg',0,0,0,0,0,0,0,'BLAZER','IN GIRL MIND'),
(11,'SNAKE PANTS','Superdry men\'s Pro racer rescue jacket. This ski jacket is designed to keep you looking amazing on the slopes. The jacket features six zip fastened outer pockets including one shoulder pocket and a pocket on the arm for your ski pass. The jacket also has an inner mesh pocket to keep your valuables safe. The Pro racer rescue jacket features a drawstring adjustable hood with detachable faux fur trim, zip and popper fastening with a hook and loop collar for extra security, a bungee cord adjustable hem, and a powder skirt to keep the snow out.',0,'images/sixth-june-pantalon-3903-gris-2.jpg','images/sixth-june-pantalon-3903-gris-1.jpg','images/sixth-june-pantalon-3903-gris-4.jpg','images/w3903kpa-grey-s-2.jpg','images/w3903kpa-grey-s-3.jpg',0,0,0,0,0,0,0,'JEANS','SIXTH MAY'),
(12,'Glenn Jeans','Superdry men\'s Pro racer rescue jacket. This ski jacket is designed to keep you looking amazing on the slopes. The jacket features six zip fastened outer pockets including one shoulder pocket and a pocket on the arm for your ski pass. The jacket also has an inner mesh pocket to keep your valuables safe. The Pro racer rescue jacket features a drawstring adjustable hood with detachable faux fur trim, zip and popper fastening with a hook and loop collar for extra security, a bungee cord adjustable hem, and a powder skirt to keep the snow out.',0,'images/3019362_Front_1.jpg','images/3019362_Back.jpg','images/3019362_Creative.jpg','images/3019362_Front-Full.jpg','images/3019362_Front.jpg',0,0,0,0,0,0,0,'JEANS','JACK JONE'),
(13,'Denim Tee','Superdry men\'s Pro racer rescue jacket. This ski jacket is designed to keep you looking amazing on the slopes. The jacket features six zip fastened outer pockets including one shoulder pocket and a pocket on the arm for your ski pass. The jacket also has an inner mesh pocket to keep your valuables safe. The Pro racer rescue jacket features a drawstring adjustable hood with detachable faux fur trim, zip and popper fastening with a hook and loop collar for extra security, a bungee cord adjustable hem, and a powder skirt to keep the snow out.',0,'images/12147765_Black_665130_003_ProductLarge.jpg','images/12147765_Black_665130_004_ProductLarge.jpg','images/12147765_Black_665130_005_ProductLarge.jpg','images/12147765_Black_665130_001_ProductLarge.jpg','images/12147765_Black_665130_002_ProductLarge.jpg',0,0,26,0,0,0,0,'BLAZER','IN GIRL MIND'),
(14,'Oranza Dress','Superdry men\'s Pro racer rescue jacket. This ski jacket is designed to keep you looking amazing on the slopes. The jacket features six zip fastened outer pockets including one shoulder pocket and a pocket on the arm for your ski pass. The jacket also has an inner mesh pocket to keep your valuables safe. The Pro racer rescue jacket features a drawstring adjustable hood with detachable faux fur trim, zip and popper fastening with a hook and loop collar for extra security, a bungee cord adjustable hem, and a powder skirt to keep the snow out.',0,'images/15214830_Black_003_ProductLarge.jpg','images/15214830_Black_004_ProductLarge.jpg','images/15214830_Black_005_ProductLarge.jpg','images/15214830_Black_001_ProductLarge.jpg','images/15214830_Black_002_ProductLarge.jpg',0,0,0,0,0,0,0,'DRESS','MAY NOISY'),
(15,'Joana Jeans','Superdry men\'s Pro racer rescue jacket. This ski jacket is designed to keep you looking amazing on the slopes. The jacket features six zip fastened outer pockets including one shoulder pocket and a pocket on the arm for your ski pass. The jacket also has an inner mesh pocket to keep your valuables safe. The Pro racer rescue jacket features a drawstring adjustable hood with detachable faux fur trim, zip and popper fastening with a hook and loop collar for extra security, a bungee cord adjustable hem, and a powder skirt to keep the snow out.',0,'images/10226057_LightBlueDenim_003_ProductLarge.jpg','images/10226057_LightBlueDenim_004_ProductLarge.jpg','images/10226057_LightBlueDenim_005_ProductLarge.jpg','images/10226057_LightBlueDenim_001_ProductLarge.jpg','images/10226057_LightBlueDenim_006_ProductLarge.jpg',0,0,0,0,0,0,0,'JEANS','ONLYY'),
(16,'Puff Sweat','Superdry men\'s Pro racer rescue jacket. This ski jacket is designed to keep you looking amazing on the slopes. The jacket features six zip fastened outer pockets including one shoulder pocket and a pocket on the arm for your ski pass. The jacket also has an inner mesh pocket to keep your valuables safe. The Pro racer rescue jacket features a drawstring adjustable hood with detachable faux fur trim, zip and popper fastening with a hook and loop collar for extra security, a bungee cord adjustable hem, and a powder skirt to keep the snow out.',0,'images/15208600_Kalamata_003_ProductLarge.jpg','images/15208600_Kalamata_004_ProductLarge.jpg','images/15208600_Kalamata_005_ProductLarge.jpg','images/15208600_Kalamata_001_ProductLarge.jpg','images/15208600_Kalamata_002_ProductLarge.jpg',0,0,0,0,0,0,0,'TOP','MAY NOISY'),
(17,'Story Teller','Superdry men\'s Pro racer rescue jacket. This ski jacket is designed to keep you looking amazing on the slopes. The jacket features six zip fastened outer pockets including one shoulder pocket and a pocket on the arm for your ski pass. The jacket also has an inner mesh pocket to keep your valuables safe. The Pro racer rescue jacket features a drawstring adjustable hood with detachable faux fur trim, zip and popper fastening with a hook and loop collar for extra security, a bungee cord adjustable hem, and a powder skirt to keep the snow out.',0,'images/15199807_BrightWhite_754235_003_ProductLarge.jpg','images/15199807_BrightWhite_754235_004_ProductLarge.jpg','images/15199807_BrightWhite_754235_005_ProductLarge.jpg','images/15199807_BrightWhite_754235_001_ProductLarge.jpg','images/15199807_BrightWhite_754235_002_ProductLarge.jpg',0,0,0,0,0,0,0,'TOP','ONLYY'),
(20,'A new top','100% cotton',50,'images/15199742_MistedYellow_754294_001_ProductLarge.jpg','images/15199742_MistedYellow_754294_002_ProductLarge.jpg','images/15199742_MistedYellow_754294_003_ProductLarge.jpg','images/15199742_MistedYellow_754294_005_ProductLarge.jpg','images/15199742_MistedYellow_754294_006_ProductLarge.jpg',0,4,0,2,0,0,0,'TOP','ONLYY');

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `review` longtext NOT NULL,
  `img` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `review` */

insert  into `review`(`id`,`name`,`review`,`img`) values 
(1,'Sayyed','Nice product! 100% cotton genuine. Machine washable. Comfort to wear','images/syd_jMA9IB5.png'),
(2,'Sohail','The product is very good. It feels comfortable.','images/shl_SzBB8W1.png');

/*Table structure for table `type` */

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `type` */

insert  into `type`(`type`) values 
('BLAZER'),
('CARDIGAN'),
('DRESS'),
('JEANS'),
('TOP'),
('TSHIRT');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `useremail` varchar(254) NOT NULL,
  `password` varchar(50) NOT NULL,
  `img` varchar(100) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`first_name`,`last_name`,`useremail`,`password`,`img`,`isAdmin`) values 
(8,'admin','admin','admin','admin@gmail.com','admin','',1);

/*Table structure for table `vendor` */

DROP TABLE IF EXISTS `vendor`;

CREATE TABLE `vendor` (
  `vendor` varchar(50) NOT NULL,
  PRIMARY KEY (`vendor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `vendor` */

insert  into `vendor`(`vendor`) values 
('IN GIRL MIND'),
('JACK JONE'),
('MAY NOISY'),
('ONLYY'),
('SIKSIKL'),
('SIXTH MAY');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
