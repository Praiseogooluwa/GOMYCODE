CREATE DATABASE OG_Graphix
USE OG_Graphix

CREATE TABLE Customers(
		CustomerID INT PRIMARY KEY, 
		CustomerName VARCHAR (50),
		Addresses VARCHAR (100),
		);

--inserting values into the customers table
INSERT INTO Customers(CustomerID, CustomerName, Addresses)
VALUES (1, 'Alice', '123 Main St'),
	   (2, 'Bob', '456 Market st'),
	   (3, 'Hassan', '789 Elm St');

	   DROP TABLE Customers
--Creating product table
CREATE TABLE Products (
		ProductID INT PRIMARY KEY, 
		ProductName VARCHAR (50),
		Price DECIMAL (10,2),
		CHECK (Price>0),
		);
--inserting values into products
INSERT INTO Products (ProductID, ProductName, Price)
VALUES(1, 'widget', 10.00),
	  (2, 'Gadget',20.00),
	  (3, 'Doohickey', 15.00);

--creating order table
CREATE TABLE Orders(
		OrderID INT PRIMARY KEY,
		Customer_ID INT,
		Product_ID INT,
		Quantity INT,
		Order_Date DATE);
--OTHER COLUNM

DROP TABLE Orders
INSERT INTO Orders(OrderID, Customer_ID, Product_ID, Quantity, Order_Date)
VALUES (1,'1', '1', '10', '2021-01-01'),
	   (2, '1', '2', '5', '2021-01-02'),
	   (3, '2', '1', '3', '2021-01-03'),
	   (4, '2', '2', '7', '2021-01-04'),
	   (5, '3', '1', '2', '2021-01-05'),
	   (6, '3', '2', '3', '2021-01-06');

-- .Write a SQL query to retrieve the names of the customers who have placed an order for at least one widget and at least one gadget,
-- along with the total cost of the widgets and gadgets ordered by each customer. 
-- The cost of each item should be calculated by multiplying the quantity by the price of the product.
SELECT CustomerName,SUM(CASE WHEN ProductName = 'Widget'
THEN Quantity * Price ELSE 0 END) AS total_Widget_cost,
SUM(CASE WHEN ProductName = 'Gadget' THEN Quantity * Price ELSE 0 END) AS total_gadget_cost
FROM Customers
JOIN Orders o on CustomerID = CustomerID
JOIN Products P ON Product_ID = ProductID
WHERE ProductName IN ('Widget', 'Gadget')
GROUP BY CustomerName
HAVING SUM(CASE WHEN ProductName = 'Widget' THEN 1 ELSE 0 END) >=1
AND SUM(CASE WHEN ProductName = 'Gadget'THEN 1 ELSE 0 END) >1;


--Write a query to retrieve the names of the customers who have placed an order for at least one widget, 
--along with the total cost of the widgets ordered by each customer.
SELECT CustomerName, SUM(Quantity * Price)AS Total_widget_cost
FROM Customers
JOIN Orders on CustomerID = CustomerID
JOIN Products ON ProductID = ProductID
WHERE ProductName = 'Widget'
GROUP BY CustomerName;

--Write a query to retrieve the names of the customers who have placed an order for at least one gadget, 
--along with the total cost of the gadgets ordered by each customer.
SELECT CustomerName, SUM(Quantity * Price)AS Total_gadget_cost
FROM Customers
JOIN Orders on CustomerID = CustomerID
JOIN Products ON ProductID = ProductID
WHERE ProductName = 'Gadget'
GROUP BY CustomerName;

--Write a query to retrieve the names of the customers who have placed an order for at least one doohickey, 
--along with the total cost of the doohickeys ordered by each customer.
SELECT
    CustomerName,
	SUM(Quantity * Price) AS TotalDoohickeyCost
FROM
    Customers c
JOIN
    Orders ON CustomerID = CustomerID
JOIN
    Products ON ProductID = ProductID
WHERE
    ProductName = 'Doohickey'
GROUP BY
    CustomerID, CustomerName;
	
--Write a query to retrieve the total number of widgets and gadgets ordered by each customer, 
--along with the total cost of the orders.
SELECT
    CustomerName,
    SUM(CASE WHEN ProductName = 'Widget' THEN Quantity ELSE 0 END) AS TotalWidgetsOrdered,
    SUM(CASE WHEN ProductName = 'Gadget' THEN Quantity ELSE 0 END) AS TotalGadgetsOrdered,
    SUM(Quantity* Price) AS TotalOrderCost
FROM
    Customers c
JOIN
    Orders ON CustomerID = CustomerID
JOIN
    Products ON ProductID = ProductID
GROUP BY
    CustomerID, CustomerName;

--Write a query to retrieve the names of the products that have been ordered by at least one customer, 
--along with the total quantity of each product ordered.
SELECT
    ProductName,
    COALESCE(SUM(Quantity), 0) AS TotalQuantityOrdered
FROM
    Products 
LEFT JOIN
    Orders ON ProductID = ProductID
GROUP BY
    ProductID, ProductName
HAVING
    COALESCE(SUM(Quantity), 0) > 0;


--Write a query to retrieve the names of the customers who have placed the most orders, 
--along with the total number of orders placed by each customer.
SELECT
    CustomerName,
    COUNT(OrderID) AS TotalOrdersPlaced
FROM
    Customers 
JOIN
    Orders ON CustomerID = CustomerID
GROUP BY
    CustomerID, CustomerName
ORDER BY
    TotalOrdersPlaced DESC;

--Write a query to retrieve the names of the products that have been ordered the most, 
--along with the total quantity of each product ordered.
SELECT
    ProductName,
    COALESCE(SUM(Quantity), 0) AS TotalQuantityOrdered
FROM
    Products p
LEFT JOIN
    Orders od ON ProductID = ProductID
GROUP BY
    ProductID, ProductName
ORDER BY
    TotalQuantityOrdered DESC;

--Write a query to retrieve the names of the customers who have placed an order on every day of the week, 
--along with the total number of orders placed by each customer.
SELECT
    CustomerName,
    COUNT(OrderID) AS TotalOrdersPlaced
FROM
    Customers 
JOIN
    Orders o on CustomerID = CustomerID
--WHERE
    --Order_Date >=INTERVAL 6 
GROUP BY
    CustomerID, CustomerName
HAVING
    COUNT(DISTINCT (Order_Date)) = 7;


	



