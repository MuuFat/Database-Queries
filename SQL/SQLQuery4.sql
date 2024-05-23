SELECT DISTINCT p.Name
FROM Production.Product p
JOIN Production.ProductProductPhoto ppp ON p.ProductID = ppp.ProductID
JOIN Production.ProductPhoto pp ON ppp.ProductPhotoID = pp.ProductPhotoID
JOIN Production.ProductProductPhoto ppp2 ON p.ProductID = ppp2.ProductID
JOIN Production.ProductPhoto pp2 ON ppp2.ProductPhotoID = pp2.ProductPhotoID
WHERE (pp.LargePhotoFileName LIKE '%color%' OR pp2.LargePhotoFileName LIKE '%color%')
OR (pp.LargePhotoFileName LIKE '%weight%' OR pp2.LargePhotoFileName LIKE '%weight%')
OR (pp.LargePhotoFileName LIKE '%size%' OR pp2.LargePhotoFileName LIKE '%size%');

SELECT TOP 1 p.Name, p.Weight
FROM Production.Product p
WHERE p.Name LIKE '%Road%'
ORDER BY p.Weight ASC;
SELECT TOP 1 p.Name, p.Weight
FROM Production.Product p
WHERE p.Name LIKE '%Road%'
ORDER BY p.Weight DESC;

SELECT p.Name, p.ListPrice
FROM Production.Product p
WHERE p.ListPrice > (SELECT AVG(ListPrice) FROM Production.Product);

SELECT pc.Name AS Category, psc.Name AS Subcategory, AVG(p.ListPrice) AS AveragePrice
FROM Production.Product p
JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name, psc.Name;

SELECT pp.FirstName, pp.LastName, SUM(soh.SubTotal) AS TotalPurchases
FROM Sales.Customer c
JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
JOIN Person.Person pp ON c.PersonID = pp.BusinessEntityID
GROUP BY pp.FirstName, pp.LastName
ORDER BY TotalPurchases DESC;

SELECT pp.FirstName, pp.LastName, SUM(soh.SubTotal) AS TotalSales
FROM Sales.SalesPerson sp
JOIN HumanResources.Employee e ON sp.BusinessEntityID = e.BusinessEntityID
JOIN Person.Person pp ON e.BusinessEntityID = pp.BusinessEntityID
JOIN Sales.SalesOrderHeader soh ON sp.BusinessEntityID = soh.SalesPersonID
GROUP BY pp.FirstName, pp.LastName
ORDER BY TotalSales DESC;


SELECT pc.Name AS Category, psc.Name AS Subcategory, pp.FirstName, pp.LastName, AVG(sod.UnitPriceDiscount) AS AverageDiscount
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN Sales.SalesPerson sp ON soh.SalesPersonID = sp.BusinessEntityID
JOIN HumanResources.Employee e ON sp.BusinessEntityID = e.BusinessEntityID
JOIN Person.Person pp ON e.BusinessEntityID = pp.BusinessEntityID
JOIN Production.Product p ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name, psc.Name, pp.FirstName, pp.LastName
HAVING AVG(sod.UnitPriceDiscount) > 0;
