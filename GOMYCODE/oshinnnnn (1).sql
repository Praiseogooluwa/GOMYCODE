CREATE DATABASE Sql_Dml

USE Sql_Dml

--Creating Products table
CREATE TABLE Products(
		Product_ID INT PRIMARY KEY,
		ProductName VARCHAR(50),
		Price DECIMAL (10, 2),
	    CHECK (Price>0)
		);

-- Insert data into Product Table
INSERT INTO Products (Product_ID, ProductName, Price)
VALUES (1, 'Cookies', 10.00),
	   (2, 'Candy', 5.2);
	   
SELECT* FROM Products

--Creating customers table
CREATE TABLE Customers(
		Customer_ID INT PRIMARY KEY,
		FirstName VARCHAR(50),
		Addresses VARCHAR(100),
		);

-- Insert data into Employee's table
INSERT INTO Customers (Customer_ID, FirstName, Addresses)
VALUES (1, 'Ahmed', 'TUnisia'),
	   (2, 'Coulibaly', 'Senegal'),
	   (3, 'Hasan', 'Egypt');
SELECT* FROM Customers

--Creating Orders table
CREATE TABLE Orders(
		Customer_ID INT PRIMARY KEY,
		Product_ID INT,
		Quantity INT,
		Order_Date DATE);

INSERT INTO Orders (Customer_ID, Product_ID, Quantity, Order_Date)
VALUES (1, '2', '3', '2023-01-22'),
	   (2, '1', '10', '2023-04-14');
	   
--Update the quantity of the second order, the new value should be 6
UPDATE Orders
SET Quantity = 6
WHERE Customer_ID = 2;
SELECT* FROM Orders

--Delete the third customer from the customers table
DELETE FROM Customers
WHERE Customer_ID = 3;
SELECT* FROM Customers

--Delete the orders table content then drop the table.
TRUNCATE TABLE Orders
SELECT* FROM Orders

DROP TABLE Orders
SELECT* FROM Orders