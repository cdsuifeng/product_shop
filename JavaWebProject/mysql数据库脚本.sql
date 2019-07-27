-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_userInfo` (
  `user_name` varchar(30)  NOT NULL COMMENT 'user_name',
  `password` varchar(30)  NOT NULL COMMENT '��¼����',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `gender` varchar(4)  NOT NULL COMMENT '�Ա�',
  `birthDate` varchar(20)  NULL COMMENT '��������',
  `userPhoto` varchar(60)  NOT NULL COMMENT '�û���Ƭ',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  `email` varchar(50)  NOT NULL COMMENT '����',
  `address` varchar(80)  NULL COMMENT '��ͥ��ַ',
  `regTime` varchar(20)  NULL COMMENT 'ע��ʱ��',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_productClass` (
  `classId` int(11) NOT NULL AUTO_INCREMENT COMMENT '���id',
  `className` varchar(20)  NOT NULL COMMENT '�������',
  `classDesc` varchar(500)  NOT NULL COMMENT '�������',
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��Ʒ���',
  `productClassObj` int(11) NOT NULL COMMENT '��Ʒ���',
  `productName` varchar(50)  NOT NULL COMMENT '��Ʒ����',
  `mainPhoto` varchar(60)  NOT NULL COMMENT '��Ʒ��ͼ',
  `price` float NOT NULL COMMENT '��Ʒ�۸�',
  `productDesc` varchar(5000)  NOT NULL COMMENT '��Ʒ����',
  `userObj` varchar(30)  NOT NULL COMMENT '�����û�',
  `addTime` varchar(20)  NULL COMMENT '����ʱ��',
  `sksp` varchar(60)  NOT NULL COMMENT '�Կ���Ƶ',
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_shopCart` (
  `cartId` int(11) NOT NULL AUTO_INCREMENT COMMENT '���ﳵid',
  `productObj` int(11) NOT NULL COMMENT '��Ʒ',
  `userObj` varchar(30)  NOT NULL COMMENT '�û�',
  `price` float NOT NULL COMMENT '����',
  `buyNum` int(11) NOT NULL COMMENT '��������',
  PRIMARY KEY (`cartId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_orderInfo` (
  `orderNo` varchar(30)  NOT NULL COMMENT 'orderNo',
  `userObj` varchar(30)  NOT NULL COMMENT '�µ��û�',
  `totalMoney` float NOT NULL COMMENT '�����ܽ��',
  `payWay` varchar(20)  NOT NULL COMMENT '֧����ʽ',
  `orderStateObj` varchar(20)  NOT NULL COMMENT '����״̬',
  `orderTime` varchar(20)  NULL COMMENT '�µ�ʱ��',
  `receiveName` varchar(20)  NOT NULL COMMENT '�ջ���',
  `telephone` varchar(20)  NOT NULL COMMENT '�ջ��˵绰',
  `address` varchar(80)  NOT NULL COMMENT '�ջ���ַ',
  `orderMemo` varchar(500)  NULL COMMENT '������ע',
  `sellObj` varchar(30)  NOT NULL COMMENT '�̼�',
  PRIMARY KEY (`orderNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_orderItem` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��Ŀid',
  `orderObj` varchar(30)  NOT NULL COMMENT '��������',
  `productObj` int(11) NOT NULL COMMENT '������Ʒ',
  `price` float NOT NULL COMMENT '��Ʒ����',
  `orderNumer` int(11) NOT NULL COMMENT '��������',
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_notice` (
  `noticeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `title` varchar(80)  NOT NULL COMMENT '����',
  `content` varchar(5000)  NOT NULL COMMENT '��������',
  `publishDate` varchar(20)  NULL COMMENT '����ʱ��',
  PRIMARY KEY (`noticeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `productObj` int(11) NOT NULL COMMENT '������Ʒ',
  `content` varchar(1000)  NOT NULL COMMENT '��������',
  `userObj` varchar(30)  NOT NULL COMMENT '�����û�',
  `commentTime` varchar(20)  NULL COMMENT '����ʱ��',
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE t_product ADD CONSTRAINT FOREIGN KEY (productClassObj) REFERENCES t_productClass(classId);
ALTER TABLE t_product ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_shopCart ADD CONSTRAINT FOREIGN KEY (productObj) REFERENCES t_product(productId);
ALTER TABLE t_shopCart ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_orderInfo ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_orderInfo ADD CONSTRAINT FOREIGN KEY (sellObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_orderItem ADD CONSTRAINT FOREIGN KEY (orderObj) REFERENCES t_orderInfo(orderNo);
ALTER TABLE t_orderItem ADD CONSTRAINT FOREIGN KEY (productObj) REFERENCES t_product(productId);
ALTER TABLE t_comment ADD CONSTRAINT FOREIGN KEY (productObj) REFERENCES t_product(productId);
ALTER TABLE t_comment ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);


