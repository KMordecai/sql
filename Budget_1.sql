-- Budget Database Createion
CREATE Database Budget;
USE Budget;

-- Users Table Creation
CREATE TABLE IF NOT EXISTS Users (
	UserID VARCHAR(20) PRIMARY KEY,
	AccountID VARCHAR(20) NOT NULL,
	UserName VARCHAR(20) UNIQUE,
	Password VARCHAR(20) NOT NULL
)engine = innodb ;

-- Accounts Table Creation
CREATE TABLE IF NOT EXISTS Accounts (
	AccountID VARCHAR(20) PRIMARY KEY,
	UserID VARCHAR(20) NOT NULL,
	TransactionID VARCHAR(20) NOT NULL,
	Balance DECIMAL(10,2) NOT NULL,
	UserName VARCHAR(20) UNIQUE
)engine = innodb ;

-- Transactions Table Creation
CREATE TABLE IF NOT EXISTS Transactions (
	TransactionID VARCHAR(20) PRIMARY KEY,
	UserID VARCHAR(20) NOT NULL,
	AccountID VARCHAR(20) NOT NULL,
	Category VARCHAR(10) NOT NULL,
	Amount DECIMAL(10,2) NOT NULL
)engine = innodb ;

-- Add Foreign Keys to Tables
ALTER TABLE Users ADD FOREIGN KEY (AccountID)
	REFERENCES Accounts(AccountID);

ALTER TABLE Accounts ADD FOREIGN KEY (UserID)
	REFERENCES Users(UserID);

ALTER TABLE Accounts ADD FOREIGN KEY (TransactionID) 
	REFERENCES Transactions(TransactionID);
	
ALTER TABLE Accounts ADD FOREIGN KEY (UserName)
	REFERENCES Users(UserName);
	
ALTER TABLE Transactions ADD FOREIGN KEY (AccountID) 
	REFERENCES Accounts(AccountID);
	
ALTER TABLE Transactions ADD FOREIGN KEY (UserID)
	REFERENCES Users(UserID);
	

