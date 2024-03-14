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
		Order_ID INT PRIMARY KEY,
		Customer_ID INT,
		Product_ID INT,
		Quantity INT,
		Order_Date DATE);
		
DROP TABLE Orders
--Insert data into your tables ( DML part )
INSERT INTO Customers (Customer_ID, FirstName, Addresses)
VALUES (1, 'Alice', '123 Main St'),
	   (2, 'Coulibaly', '456 Market st'),
	   (3, 'Charlie', '789 Elm St');
SELECT* FROM Customers

INSERT INTO Products (Product_ID, ProductName, Price)
VALUES (1, 'widget', 10.00),
	   (2, 'Gadget', 20.00),
	   (3, 'Doohickey', 15.00);
	    
SELECT* FROM Products

INSERT INTO Orders (Order_ID, Customer_ID, Product_ID, Quantity, Order_Date)
VALUES (1,'1', '1', '10', '2021-01-01'),
	   (2, '1', '2', '5', '2021-01-02'),
	   (3, '2', '1', '3', '2021-01-03'),
	   (4, '2', '2', '7', '2021-01-04'),
	   (5, '3', '1', '2', '2021-01-05'),
	   (6, '3', '2', '3', '2021-01-06');
SELECT* FROM Orders
