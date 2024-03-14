CREATE DATABASE CHECKPOINT_4

USE CHECKPOINT_4
--Creating customers table
CREATE TABLE Customers(
		Customer_ID INT PRIMARY KEY,
		FirstName VARCHAR(50),
		Addresses VARCHAR(100),
		);
SELECT* FROM Customers

--Creating Products table
CREATE TABLE Products(
		Product_ID INT PRIMARY KEY,
		ProductName VARCHAR(50),
		Price DECIMAL (10, 2),
	    CHECK (Price>0)
		);
DROP TABLE Products

--Creating Orders table
CREATE TABLE Orders(
		Order_ID INT PRIMARY KEY NOT NULL,
		Customer_ID INT NOT NULL,
		Product_ID INT NOT NULL,
		Quantity INT NOT NULL,
		Order_Date DATE NOT NULL,
-- OTHER COLUMN
	   FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
		FOREIGN KEY (Product_ID) REFERENCES  Products(Product_ID)
		);
		DROP TABLE Orders
SP_HELP Orders

