CREATE DATABASE StockTrader;
USE StockTrader;


CREATE TABLE Stock
(
	stockcode	  VARCHAR(20) ,
	PRIMARY KEY(stockcode) ,
	name	  VARCHAR(20)
);

CREATE TABLE StockUser
(
	username	  VARCHAR(20) ,
	PRIMARY KEY(username) ,
	password	  VARCHAR(20),
	balance 	FLOAT
);



CREATE TABLE Account
(
	accountid	BIGINT(20) AUTO_INCREMENT, 
	PRIMARY KEY(accountid) ,
	username	  VARCHAR(20) ,
	FOREIGN KEY (username) REFERENCES StockUser(username),
	stockcode	  VARCHAR(20),
	amount 	INT
);



CREATE TABLE TradeRecord
(
	tradeid	  BIGINT(20) AUTO_INCREMENT, 
	PRIMARY KEY(tradeid) ,
	username	  VARCHAR(20),
	FOREIGN KEY (username) REFERENCES StockUser(username),
	type		  INT,
	stockcode	  VARCHAR(20) ,
	FOREIGN KEY (stockcode) REFERENCES Stock(stockcode),
	amount 	INT,
	unitprice	FLOAT
);