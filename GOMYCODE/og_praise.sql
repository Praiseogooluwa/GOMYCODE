CREATE DATABASE Omo_Ologo

USE Omo_Ologo

--1.Convert the given entity-relationship diagram into a relational model.
+-------------------+          +-----------------+
|    Producer       |          |      Harvest    |
+-------------------+          +-----------------+
| NumP   (PK)       |          |    Quantity     |
| FirstName         |          +-----------------+ 
| LastName          |                 |
| Region            |                 |
+-------------------+                 |
        |                             |
        |                             |
        |                             |
        |1                            |* 
        |                             |
        |                             |
+-------------------+                 |
|       Wine        |                 |
+-------------------+                 |
| NumW  (PK)        |                 |
| Category          |                 |
| Years             |                 |
| Degree            |                 |
+-------------------+                 |

--2.Implement the relational model using SQL.
CREATE TABLE Producer(
    NumP INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
	Region  VARCHAR(255),
);
SELECT* FROM Producer

CREATE TABLE Wine(
    NumW INT PRIMARY KEY,
    Category VARCHAR(255),
    Years INT,
	Degree DECIMAL(5, 2),
);
SELECT* FROM Wine

CREATE TABLE Harvest (
    NumH INT PRIMARY KEY,
    Quantity INT,
    NumW INT,
    NumP INT,
    HarvestDate DATE,
    FOREIGN KEY (NumW) REFERENCES Wine(NumW),
    FOREIGN KEY (NumP) REFERENCES Producer(NumP)
);

SELECT* FROM Harvest
--3.Insert data into the database tables.
INSERT INTO Producer (NumP, FirstName, LastName, Region)
VALUES
    (1, 'John', 'Doe', 'California'),
    (2, 'Jane', 'Smith', 'Bordeaux'),
    (3, 'Alice', 'Johnson', 'Sousse'),
    (4, 'Bob', 'Williams', 'Burgundy'),
    (5, 'Emily', 'Jones', 'Napa Valley'),
    (6, 'Michael', 'Brown', 'Rioja'),
    (7, 'Sarah', 'Garcia', 'Provence'),
    (8, 'David', 'Martinez', 'Champagne'),
    (9, 'Laura', 'Lopez', 'Alsace'),
    (10, 'James', 'Perez', 'Sicily'),
    (11, 'Olivia', 'Rodriguez', 'Piedmont'),
    (12, 'Daniel', 'Hernandez', 'Mosel'),
    (13, 'Sophia', 'Gonzalez', 'Douro'),
    (14, 'Matthew', 'Wilson', 'Loire Valley'),
    (15, 'Isabella', 'Taylor', 'Hunter Valley'),
    (16, 'William', 'Lee', 'Mendoza'),
    (17, 'Emma', 'Thomas', 'Maipo Valley'),
    (18, 'Alexander', 'Harris', 'Margaret River'),
    (19, 'Charlotte', 'Clark', 'Colchagua Valley'),
    (20, 'Liam', 'Lewis', 'Barossa Valley'),
    (21, 'Ava', 'King', 'Valle de Guadalupe'),
    (22, 'Mia', 'Allen', 'Walla Walla Valley'),
    (23, 'Ethan', 'Young', 'Central Otago'),
    (24, 'Abigail', 'Scott', 'Stellenbosch'),
    (25, 'Oliver', 'Walker', 'Swartland'),
    (26, 'Amelia', 'Wright', 'Constantia'),
    (27, 'Benjamin', 'Evans', 'Frankland River'),
    (28, 'Chloe', 'Brown', 'Clare Valley'),
    (29, 'Jacob', 'Jones', 'Yarra Valley'),
    (30, 'Ella', 'Williams', 'Coonawarra');

SELECT* FROM Producer

INSERT INTO Wine (NumW, Category, Years, Degree)
VALUES
    (1, 'Red', 2018, 14.5),
    (2, 'White', 2020, 12.0),
    (3, 'Rose', 2019, 13.2),
    (4, 'Red', 2017, 15.0),
    (5, 'White', 2018, 11.5),
    (6, 'Rose', 2021, 12.8),
    (7, 'Red', 2019, 14.2),
    (8, 'White', 2016, 11.0),
    (9, 'Rose', 2020, 13.5),
    (10, 'Red', 2015, 14.8),
    (11, 'White', 2019, 12.5),
    (12, 'Rose', 2018, 13.0),
    (13, 'Red', 2022, 15.5),
    (14, 'White', 2017, 11.2),
    (15, 'Rose', 2016, 12.5),
    (16, 'Red', 2014, 16.0),
    (17, 'White', 2015, 10.8),
    (18, 'Rose', 2022, 13.8),
    (19, 'Red', 2016, 14.0),
    (20, 'White', 2021, 11.8),
    (21, 'Rose', 2017, 12.0),
    (22, 'Red', 2013, 17.5),
    (23, 'White', 2014, 10.5),
    (24, 'Rose', 2023, 14.5),
    (25, 'Red', 2011, 18.0),
    (26, 'White', 2012, 10.0),
    (27, 'Rose', 2015, 13.2),
    (28, 'Red', 2010, 17.0),
    (29, 'White', 2013, 9.8),
    (30, 'Rose', 2014, 12.2);

SELECT* FROM Wine

INSERT INTO Harvest (NumH, Quantity, NumW, NumP, HarvestDate)
VALUES
    (1, 400, 1, 10, '2022-03-01'),
    (2, 350, 2, 15, '2022-03-05'),
    (3, 500, 3, 20, '2022-03-10'),
    (4, 450, 4, 5, '2022-03-15'),
    (5, 300, 5, 25, '2022-03-20'),
    (6, 550, 6, 30, '2022-03-25'),
    (7, 400, 7, 12, '2022-04-01'),
    (8, 350, 8, 17, '2022-04-05'),
    (9, 500, 9, 22, '2022-04-10'),
    (10, 450, 10, 27, '2022-04-15'),
    (11, 300, 11, 2, '2022-04-20'),
    (12, 550, 12, 7, '2022-04-25'),
    (13, 400, 13, 15, '2022-05-01'),
    (14, 350, 14, 20, '2022-05-05'),
    (15, 500, 15, 25, '2022-05-10'),
    (16, 450, 16, 30, '2022-05-15'),
    (17, 300, 17, 5, '2022-05-20'),
    (18, 550, 18, 10, '2022-05-25'),
    (19, 400, 19, 15, '2022-06-01'),
    (20, 350, 20, 20, '2022-06-05'),
    (21, 500, 21, 25, '2022-06-10'),
    (22, 450, 22, 30, '2022-06-15'),
    (23, 300, 23, 5, '2022-06-20'),
    (24, 550, 24, 10, '2022-06-25'),
    (25, 400, 25, 15, '2022-07-01'),
    (26, 350, 26, 20, '2022-07-05'),
    (27, 500, 27, 25, '2022-07-10'),
    (28, 450, 28, 30, '2022-07-15'),
    (29, 300, 29, 5, '2022-07-20'),
    (30, 550, 30, 10, '2022-07-25');



SELECT* FROM Harvest
DROP TABLE Harvest
--4.Give the list the producers.
SELECT* FROM Producer

--5.Give the list of producers sorted by name.
SELECT* FROM Producer
SELECT LastName, FirstName FROM Producer WHERE NumP > 0

--6.Give the list the producers of Sousse.
SELECT * FROM Producer
WHERE Region = 'Sousse';

--7.Calculate the total quantity of wine produced having the number 12.
SELECT SUM(Quantity) AS TotalQuantity
FROM Harvest
WHERE NumW = 12;

--8.Calculate the quantity of wine produced by category.
SELECT w.Category, SUM(h.Quantity) AS TotalQuantity
FROM Harvest h
JOIN Wine w ON h.NumW = w.NumW
GROUP BY w.Category;

--9.Which producers in the Sousse region have harvested at least one wine in quantities greater than 300 liters? 
--We want the names and first names of the producers, sorted in alphabetical order.

select Pr.FirstName, Pr.LastName, Pr.Region, ha.Quantity from Harvest ha
join Producer Pr
on ha. NumP = Pr.NumP
join Wine W
on W.NumW = Pr.NumP
Where ha.Quantity > 300
order by Pr.LastName, Pr.FirstName Asc

select * from Wine
select * from Producer



SELECT FirstName, LastName
FROM Producer
WHERE NumP IN (
    SELECT h.NumP
    FROM Harvest h
    JOIN Wine w ON h.NumW = w.NumW
    WHERE h.Quantity > 300
    AND w.Category = 'Sousse'
)
ORDER BY LastName, FirstName;

--10.List the wine numbers that have a degree greater than 12 and 
--that have been produced by producer number 24.
SELECT DISTINCT(h.NumW)
FROM Harvest h
JOIN Wine w ON h.NumW = w.NumW
WHERE w.Degree > 12
AND h.NumP = 24;







