SELECT AVG(UnitPrice) FROM Products
SELECT SUM(Quantity) FROM [Order Details]
SELECT COUNT(*) FROM Products WHERE UnitPrice < 10 OR UnitPrice > 20
SELECT MAX(UnitPrice) FROM Products WHERE UnitPrice < 20
SELECT MAX(UnitPrice), MIN(UnitPrice), AVG(UnitPrice) FROM Products WHERE QuantityPerUnit LIKE '%bottle%'
SELECT * FROM Products WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
SELECT SUM(UnitPrice * Quantity) FROM [Order Details] WHERE OrderID = 10250
SELECT ProductID, SUM(Quantity) FROM [Order Details] GROUP BY ProductID
SELECT OrderID, MAX(UnitPrice) FROM [Order Details] GROUP BY OrderID
SELECT OrderID, MAX(UnitPrice) FROM [Order Details] GROUP BY OrderID ORDER BY MAX(UnitPrice) DESC
SELECT OrderID, MAX(UnitPrice), MIN(UnitPrice) FROM [Order Details] GROUP BY OrderID
SELECT Shippers.ShipperID, Shippers.CompanyName, COUNT(*) FROM Orders INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID GROUP BY Shippers.ShipperID, Shippers.CompanyName
SELECT TOP 1 Shippers.ShipperID, Shippers.CompanyName, COUNT(*) AS TotalOrders FROM Orders INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID WHERE YEAR(ShippedDate) = 1997 GROUP BY Shippers.ShipperID, Shippers.CompanyName ORDER BY TotalOrders DESC
SELECT OrderID FROM [Order Details] GROUP BY OrderID HAVING COUNT(*) > 5
SELECT Customers.CustomerID, COUNT(*) AS TotalOrders, SUM(Orders.Freight) AS TotalFreight FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID WHERE YEAR(Orders.OrderDate) = 1998 GROUP BY Customers.CustomerID HAVING COUNT(*) > 8 ORDER BY TotalFreight DESC