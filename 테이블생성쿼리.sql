CREATE TABLE `User` (
  `user_id` varchar(50) NOT NULL,
  `user_pw` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` char(1) NOT NULL,
  `point` int(11) NOT NULL DEFAULT '0',
  `Auth` varchar(1) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `IND_U_NAME` (`user_name`)

  CREATE TABLE `Product` (
  `product_code` char(5) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `discription1` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`product_code`),
  KEY `IND_U_NAME` (`price`)
)

CREATE TABLE `Benefit` (
  `promo_type` char(1) NOT NULL,
  `benefit_code` char(2) NOT NULL,
  `goal_cnt` int(11) NOT NULL,
  `offer` int(11) NOT NULL,
  `unit` varchar(10) NOT NULL,
  PRIMARY KEY (`promo_type`,`benefit_code`,`goal_cnt`),
  KEY `IND_U_NAME` (`goal_cnt`)
) 

CREATE TABLE `Promotion` (
  `promo_id` char(10) NOT NULL,
  `create_date` datetime NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `due_date` datetime NOT NULL,
  `state` char(1) NOT NULL,
  `promo_type` char(1) NOT NULL,
  `benefit_code` char(2) NOT NULL,
  `product_code` char(5) NOT NULL,
  `event_url` varchar(100) DEFAULT NULL,
  `banner_path` varchar(100) DEFAULT NULL,
  `join_cnt` int(11) DEFAULT NULL,
  PRIMARY KEY (`promo_id`),
  KEY `fk_Promotion_User1_idx` (`user_id`),
  KEY `fk_Promotion_Benefit1_idx` (`promo_type`,`benefit_code`),
  KEY `fk_Promotion_Product1_idx` (`product_code`),
  CONSTRAINT `fk_Promotion_Benefit1` FOREIGN KEY (`promo_type`, `benefit_code`) REFERENCES `Benefit` (`promo_type`, `benefit_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Promotion_Product1` FOREIGN KEY (`product_code`) REFERENCES `Product` (`product_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Promotion_User1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)

CREATE TABLE `Purchase` (
  `purchase_id` char(10) NOT NULL,
  `purchase_date` datetime NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `product_code` char(5) NOT NULL,
  `state` char(1) NOT NULL,
  PRIMARY KEY (`purchase_id`),
  KEY `IND_U_NAME` (`purchase_date`),
  KEY `fk_Purchase_Product_idx` (`product_code`),
  KEY `fk_Purchase_User1_idx` (`user_id`),
  CONSTRAINT `fk_Purchase_Product` FOREIGN KEY (`product_code`) REFERENCES `Product` (`product_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Purchase_User1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) 



CREATE TABLE `Participate` (
  `promo_id` char(10) NOT NULL,
  `join_user_id` varchar(50) NOT NULL,
  `purchase_id` varchar(10) NOT NULL,
  `join_date` datetime NOT NULL,
  `join_from` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`promo_id`,`join_user_id`),
  KEY `fk_JoinList_Promotion1_idx` (`promo_id`),
  KEY `fk_JoinList_User1_idx` (`join_user_id`),
  KEY `fk_JoinList_Purchase1_idx` (`purchase_id`),
  CONSTRAINT `fk_JoinList_Promotion1` FOREIGN KEY (`promo_id`) REFERENCES `Promotion` (`promo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_JoinList_Purchase1` FOREIGN KEY (`purchase_id`) REFERENCES `Purchase` (`purchase_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_JoinList_User1` FOREIGN KEY (`join_user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
