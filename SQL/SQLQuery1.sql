SELECT ContactName, Address FROM Customers
SELECT FirstName, LastName, HomePhone FROM Employees
SELECT ProductName, UnitPrice FROM Products
SELECT CategoryName, Description FROM Categories
SELECT CompanyName, HomePage FROM Suppliers
SELECT ContactName, Address FROM Customers WHERE City = 'London'
SELECT ContactName, Address FROM Customers WHERE Country IN ('France', 'Spain')
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice BETWEEN 20.00 AND 30.00
SELECT ProductName, UnitPrice FROM Products WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Seafood')
SELECT Products.ProductName, Products.UnitsInStock FROM Products INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID WHERE Suppliers.CompanyName = 'Tokyo Traders'
SELECT ProductName FROM Products WHERE UnitsInStock = 0
SELECT ProductName FROM Products WHERE QuantityPerUnit LIKE '%bottle%'
SELECT Title FROM Employees WHERE LastName BETWEEN 'B' AND 'L'
SELECT Title FROM Employees WHERE LastName LIKE 'B%' OR LastName LIKE 'L%'
SELECT CategoryName FROM Categories WHERE Description LIKE '%,%'
SELECT CompanyName FROM Customers WHERE CompanyName LIKE '%.Store%'
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice < 10 OR UnitPrice > 20
SELECT OrderID, OrderDate, CustomerID FROM Orders WHERE ShipCountry = 'Argentina' AND ShippedDate IS NULL
SELECT ContactName, Country FROM Customers ORDER BY Country, ContactName
SELECT Products.ProductName, Categories.CategoryName, Products.UnitPrice FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID ORDER BY Categories.CategoryName, Products.UnitPrice DESC
SELECT ContactName, Country FROM Customers WHERE Country IN ('Japan', 'Italy') ORDER BY Country, ContactName