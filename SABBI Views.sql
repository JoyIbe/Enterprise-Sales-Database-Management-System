-- View for all sales with employee and product names
CREATE VIEW vw_SalesSummary AS
SELECT 
    S.OrderID,
    S.OrderDate,
    P.ProductName,
    E.FullName AS EmployeeName,
    R.ResellerName,
    S.Quantity,
    S.UnitPrice,
    S.SalesAmount,
    S.PaymentMethod
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
JOIN Employees E ON S.EmployeeID = E.EmployeeID
JOIN Reseller R ON S.ResellerID = R.ResellerID;
GO

SELECT * FROM vw_SalesSummary;
GO

CREATE VIEW vw_SalesSummary2 AS
SELECT 
    S.OrderID,
    S.OrderDate,
    P.ProductName,
    E.FullName AS EmployeeName,
    R.ResellerName,
    S.Quantity,
    S.UnitPrice,
    S.SalesAmount,
    S.PaymentMethod,
    T.TargetAmount
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
JOIN Employees E ON S.EmployeeID = E.EmployeeID
JOIN Reseller R ON S.ResellerID = R.ResellerID
JOIN [Target] T ON E.EmployeeID = T.EmployeeID;
GO

SELECT * FROM vw_SalesSummary2;
GO


CREATE VIEW vw_SalesSummary3 AS
SELECT 
    S.OrderID,
    S.OrderDate,
    P.ProductName,
    E.FullName AS EmployeeName,
    R.ResellerName,
    S.Quantity,
    S.UnitPrice,
    S.SalesAmount,
    S.PaymentMethod,
    T.TargetAmount
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
JOIN Employees E ON S.EmployeeID = E.EmployeeID
JOIN Reseller R ON S.ResellerID = R.ResellerID
LEFT JOIN [Target] T ON E.EmployeeID = T.EmployeeID;
GO

SELECT * FROM vw_SalesSummary3;
GO

