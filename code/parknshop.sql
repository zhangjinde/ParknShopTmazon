CREATE DATABASE parknshop character set  utf8 collate utf8_general_ci;

USE parknshop;

CREATE TABLE user (
	userId int AUTO_INCREMENT,
	name varchar(50) NOT NULL,
	password varchar(50) NOT NULL,
	role varchar(50) NOT NULL,
	status varchar(50) NOT NULL,
	PRIMARY KEY (userId),
	UNIQUE (name)
);

CREATE TABLE address(
	userId int NOT NULL,
	province varchar(50),
	city varchar(50),
	country varchar(50),
	street varchar(50),
	FOREIGN KEY (userId) REFERENCES user(userId)
);

CREATE TABLE userInfo(
	userId int NOT NULL,
	phone varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	realName varchar(50) NOT NULL,
	sex bit NOT NULL,
	birthday date NOT NULL,
	detail text,
	alipay varchar(50) NOT NULL,
	FOREIGN KEY (userId) REFERENCES user(userId)
);

CREATE TABLE shop(
	shopId int AUTO_INCREMENT,
	name varchar(50) NOT NULL,
	type varchar(50) NOT NULL,
	status varchar(50) NOT NULL,
	owner int NOT NULL,
	CONSTRAINT pk_shopId PRIMARY KEY (shopId),
	FOREIGN KEY (owner) REFERENCES user(userId)
);

CREATE TABLE category (
	category varchar(50),
	PRIMARY KEY (category)
);

CREATE TABLE product (
	productId int AUTO_INCREMENT,
	shopId int NOT NULL,
	name varchar(50) NOT NULL,
	price decimal(10,2) NOT NULL,
	discountPrice decimal(10,2) NOT NULL,
	category varchar(50) NOT NULL,
	stockNum int NOT NULL,
	soldNum int NOT NULL,
	description text NOT NULL,
	picture varchar(100),
	PRIMARY KEY (productId),
	FOREIGN KEY (shopId) REFERENCES shop(shopId),
	FOREIGN KEY (category) REFERENCES category(category)
);

CREATE TABLE productInfo (
	productId int,
	size varchar(50),
	color varchar(50),
	FOREIGN KEY (productId) REFERENCES product(productId)
);

CREATE TABLE delivery(
	deliveryId int AUTO_INCREMENT,
	company varchar(50) NOT NULL,
	price decimal(10,2) NOT NULL,
	type varchar(50) NOT NULL,
	PRIMARY KEY (deliveryId)
);

CREATE TABLE orders (
	orderId int AUTO_INCREMENT,
	payType varchar(50) NOT NULL,
	status varchar(50) NOT NULL,
	orderTime datetime NOT NULL,
	userId int NOT NULL,
	PRIMARY KEY (orderId),
	FOREIGN KEY (userId) REFERENCES user(userId)
);

CREATE TABLE orderInfo(
	orderId int NOT NULL,
	deliveryId int NOT NULL,
	quantity int NOT NULL,
	productId int NOT NULL,
	FOREIGN KEY (productId) REFERENCES product(productId),
	FOREIGN KEY (orderId) REFERENCES orders(orderId),
	FOREIGN KEY (deliveryId) REFERENCES delivery(deliveryId)
);

CREATE TABLE cart (
	userId int NOT NULL,
	productId int NOT NULL,
	quantity int NOT NULL,
	PRIMARY KEY (userId, productId),
	FOREIGN KEY (userId) REFERENCES user(userId),
	FOREIGN KEY (productId) REFERENCES product(productId)
);

CREATE TABLE friend (
	userId int NOT NULL,
	friendId int NOT NULL,
	PRIMARY KEY (userId, friendId),
	FOREIGN KEY (userId) REFERENCES user(userId),
	FOREIGN KEY (friendId) REFERENCES user(userId)
);

CREATE TABLE message(
	messageId int AUTO_INCREMENT,
	userId int NOT NULL,
	friendId int NOT NULL,
	content text NOT NULL,
	isUnread bit NOT NULL,
	messageTime datetime NOT NULL,
	PRIMARY KEY (messageId),
	FOREIGN KEY (userId) REFERENCES user(userId),
	FOREIGN KEY (friendId) REFERENCES user(userId)
);

CREATE TABLE comment(
	commentId int AUTO_INCREMENT,
	userId int NOT NULL,
	productId int NOT NULL,
	content text NOT NULL,
	commentTime datetime NOT NULL,
	replyId int,
	CONSTRAINT pk_commentId PRIMARY KEY (commentId),
	FOREIGN KEY (userId) REFERENCES user(userId),
	FOREIGN KEY (productId) REFERENCES product(productId),
	FOREIGN KEY (replyId) REFERENCES comment(commentId)
);

create table advertisement(
	adId int(11) auto_increment primary key,
	productID int(11),
	cost int(10),
	foreign key(productID) references product(productId)
);