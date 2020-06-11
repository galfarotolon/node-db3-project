-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT "ProductName", "CategoryName"
FROM Product AS p
JOIN Category as c 
ON p.CategoryId = c.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.


SELECT Id, CompanyName
FROM "ORDER" as o
JOIN SHIPPER as s
ON o.ShipVia = s.Id
WHERE OrderDate < "2012-08-09"

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT ProductName, Quantity
FROM "Product" as p
JOIN "OrderDetail" as o
ON p.Id = o.ProductId
WHERE o.OrderId = 10251


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT Id OrderId, CompanyName Customer_Company_Name, LastName Employee_Last_Name
FROM "ORDER" as o
JOIN CUSTOMER as c ON o.CustomerId = c.Id
JOIN EMPLOYEE as e ON o.EmployeeId = e.Id






--------------------------- Stretch
-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.

--to add a new column

ALTER TABLE Categories
ADD "Count" integer


-- Display Category Name and Add how many products are in each category description


SELECT CategoryName, LENGTH(Description) - LENGTH(replace(Description, ',', '')) +1 Count
FROM Categories




-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.


SELECT OrderID, SUM(QUANTITY) AS ItemCount
FROM OrderDetails
GROUP BY OrderID

