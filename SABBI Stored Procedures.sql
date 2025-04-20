USE [SABBI Ent.];
GO
-- ===============================================
-- 1. INSERT PROCEDURES
-- ===============================================

-- Insert into Suppliers
CREATE PROCEDURE InsertSupplier
    @SupplierName NVARCHAR(255),
    @ContactName NVARCHAR(255),
    @DeliveryDate DATE,
    @Address NVARCHAR(255),
    @Phone NVARCHAR(20),
    @Email NVARCHAR(100),
    @Status NVARCHAR(50)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Suppliers WHERE SupplierName = @SupplierName AND Email = @Email)
    BEGIN
        INSERT INTO Suppliers (SupplierName, ContactName, DeliveryDate, Address, Phone, Email, Status)
        VALUES (@SupplierName, @ContactName, @DeliveryDate, @Address, @Phone, @Email, @Status);
    END
    ELSE
        PRINT 'Supplier already exists.';
END;
GO

--Stored Procedure: Insert into Products
CREATE PROCEDURE InsertProduct
    @ProductName NVARCHAR(100),
    @Category NVARCHAR(50),
    @SubCategory NVARCHAR(50),
    @StandardCost DECIMAL(10,2),
    @Price DECIMAL(10,2),
    @SupplierID INT,
    @Availability BIT
AS
BEGIN
    IF @Price > 0 AND EXISTS (SELECT 1 FROM Suppliers WHERE SupplierID = @SupplierID)
    BEGIN
        INSERT INTO Products (ProductName, Category, SubCategory, StandardCost, Price, SupplierID, Availability)
        VALUES (@ProductName, @Category, @SubCategory, @StandardCost, @Price, @SupplierID, @Availability);
    END
    ELSE
        PRINT 'Invalid price or SupplierID.';
END;
GO

EXEC InsertProduct
    @ProductName = 'Lenovo ThinkPad',
    @Category = 'Electronics',
    @SubCategory = 'Laptops',
    @StandardCost = 45000.00,
    @Price = 55000.00,
    @SupplierID = 5,   -- Make sure this ID exists
    @Availability = 1;

SELECT * FROM Products;
GO

-- Insert into Region

CREATE PROCEDURE  InsertRegion
    @Continent NVARCHAR(50),
    @Country NVARCHAR(50),
    @State NVARCHAR(50)
AS
BEGIN
    INSERT INTO Region (Continent, Country, State)
    VALUES (@Continent, @Country, @State);
END;
GO

EXEC InsertRegion
    @Continent = 'South America',
    @Country = 'Brazil',
    @State = 'Brasilia';

SELECT * FROM Region;
GO

-- Insert into EmployeeRegion
CREATE PROCEDURE InsertEmployeeRegion
    @RegionID INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Region WHERE RegionID = @RegionID)
    BEGIN
        INSERT INTO EmployeeRegion (RegionID)
        VALUES (@RegionID);
    END
    ELSE
        PRINT 'Region not found.';
END;
GO

EXEC InsertEmployeeRegion
    @RegionID = 5;  -- Make sure RegionID exists

SELECT * FROM EmployeeRegion;
GO

-- Insert into Employees
CREATE PROCEDURE InsertEmployee
    @EmployeeKey INT,
    @FullName NVARCHAR(100),
    @JobRole NVARCHAR(100),
    @Department NVARCHAR(50),
    @Status NVARCHAR(20),
    @Email NVARCHAR(255),
    @IsActive BIT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM EmployeeRegion WHERE EmployeeKey = @EmployeeKey)
    BEGIN
        INSERT INTO Employees (EmployeeKey, FullName, JobRole, Department, Status, Email, IsActive)
        VALUES (@EmployeeKey, @FullName, @JobRole, @Department, @Status, @Email, @IsActive);
    END
    ELSE
        PRINT 'EmployeeKey does not exist.';
END;
GO

EXEC InsertEmployee
    @EmployeeKey = 211,
    @FullName = 'Joy Reindeer',
    @JobRole = 'Product Manager',
    @Department = 'Admin',
    @Status = 'Active',
    @Email = 'joyy_rein@sabbi.com',
    @IsActive = 1;


SELECT * FROM Employees;
GO

-- Insert into Reseller
CREATE PROCEDURE InsertReseller
    @ResellerName NVARCHAR(100),
    @ContactEmail NVARCHAR(100),
    @BusinessType NVARCHAR(100),
    @Country NVARCHAR(50),
    @City NVARCHAR(50),
    @State NVARCHAR(50)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Reseller WHERE ContactEmail = @ContactEmail)
    BEGIN
        INSERT INTO Reseller (ResellerName, ContactEmail, BusinessType, Country, City, State)
        VALUES (@ResellerName, @ContactEmail, @BusinessType, @Country, @City, @State);
    END
    ELSE
        PRINT 'Reseller with this email already exists.';
END;
GO

EXEC InsertReseller
    @ResellerName = 'Super Retail Empire',
    @ContactEmail = 'distributor@superretail.com',
    @BusinessType = 'Distributor',
    @Country = 'Nigeria',
    @City = 'Owerri',
    @State = 'Imo';

SELECT * FROM Reseller;
GO

UPDATE Reseller SET Country = 'Peru' WHERE ResellerID = 7;
UPDATE Reseller SET City = 'Lima' WHERE ResellerID = 7;
UPDATE Reseller SET [State] = 'Ayabaca' WHERE ResellerID =7;
GO

-- Insert into Sales
CREATE PROCEDURE InsertSales
    @OrderDate DATE,
    @Quantity INT,
    @UnitPrice DECIMAL(10,2),
    @StandardCost DECIMAL(10,2),
    @PaymentMethod NVARCHAR(50),
    @ProductID INT,
    @ResellerID INT,
    @EmployeeID INT,
    @RegionID INT
AS
BEGIN
    IF @Quantity > 0 AND EXISTS (SELECT 1 FROM Products WHERE ProductID = @ProductID)
    BEGIN
        INSERT INTO Sales (
            OrderDate, Quantity, UnitPrice, StandardCost,
            PaymentMethod, ProductID, ResellerID, EmployeeID, RegionID)
        VALUES (
            @OrderDate, @Quantity, @UnitPrice, @StandardCost,
            @PaymentMethod, @ProductID, @ResellerID, @EmployeeID, @RegionID);
    END
    ELSE
        PRINT 'Invalid input or Product not found.';
END;
GO

EXEC InsertSales
    @OrderDate = '2025-04-19',
    @Quantity = 3,
    @UnitPrice = 5000.00,
    @StandardCost = 4210.00,
    @PaymentMethod = 'POS',
    @ProductID = 7,
    @ResellerID = 7,
    @EmployeeID = 9,
    @RegionID = 5;

SELECT * FROM Sales;
GO

-- Insert into Target
CREATE PROCEDURE InsertTarget
    @RegionID INT,
    @EmployeeID INT,
    @TargetMonth INT,
    @TargetYear INT,
    @TargetAmount DECIMAL(10,2)
AS
BEGIN
    IF @TargetMonth BETWEEN 1 AND 12 AND @TargetAmount >= 0
    BEGIN
        INSERT INTO Target (RegionID, EmployeeID, TargetMonth, TargetYear, TargetAmount)
        VALUES (@RegionID, @EmployeeID, @TargetMonth, @TargetYear, @TargetAmount);
    END
    ELSE
        PRINT 'Invalid month or target amount.';
END;
GO

EXEC InsertTarget
    @RegionID = 5, @EmployeeID = 16, @TargetMonth = 5,  @TargetYear = 2025, @TargetAmount = 33000.00;


SELECT * FROM Target;
GO
-- ===============================================
-- 1. UPDATE PROCEDURES
-- ===============================================

CREATE PROCEDURE UpdateSupplier
    @SupplierID INT,
    @Phone NVARCHAR(20),
    @Email NVARCHAR(100),
    @Status NVARCHAR(50)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Suppliers WHERE SupplierID = @SupplierID)
    BEGIN
        UPDATE Suppliers
        SET Phone = @Phone, Email = @Email, Status = @Status
        WHERE SupplierID = @SupplierID;
    END
    ELSE
        PRINT 'Supplier not found.';
END;
GO

SELECT * FROM Suppliers;

--Example Use case: EXEC UpdateSupplier @SupplierID = 1,  @Phone = '08034567890',  @Email = 'newemail@supplier.com', @Status = 'Active';
GO

CREATE PROCEDURE UpdateProductPrice
    @ProductID INT,
    @NewPrice DECIMAL(10,2)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Products WHERE ProductID = @ProductID)
    BEGIN
        UPDATE Products
        SET Price = @NewPrice
        WHERE ProductID = @ProductID;
    END
    ELSE
        PRINT 'Product not found.';
END;

SELECT * FROM Products;
GO
--Example Use Case: EXEC UpdateProductPrice  @ProductID = 2,  @NewPrice = 29000.00;

CREATE PROCEDURE UpdateTarget
    @EmployeeID INT,
    @RegionID INT,
    @TargetAmount DECIMAL(10,2)
AS
BEGIN
   IF EXISTS (SELECT 1 FROM Target WHERE EmployeeID = @EmployeeID AND RegionID = @RegionID)
    BEGIN
        UPDATE Target
        SET TargetAmount = @TargetAmount
        WHERE EmployeeID = @EmployeeID AND @RegionID = @RegionID ;
    END
    ELSE
        PRINT 'Employee not found.';
END;

SELECT * FROM Target;
GO
--Example Use Case: EXEC UpdateTarget @EmployeeID = 16, @RegionID = 5,  @TargetAmount = 31000.00;


-- =============================================
-- DELETE PROCEDURES
-- =============================================

CREATE PROCEDURE DeleteReseller
    @ResellerID INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Reseller WHERE ResellerID = @ResellerID)
    BEGIN
        DELETE FROM Reseller WHERE ResellerID = @ResellerID;
    END
    ELSE
        PRINT 'Reseller not found.';
END;
GO

CREATE PROCEDURE DeleteTarget
    @RegionID INT,
    @EmployeeID INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Target WHERE RegionID = @RegionID AND EmployeeID = @EmployeeID)
    BEGIN
        DELETE FROM Target WHERE RegionID = @RegionID AND EmployeeID = @EmployeeID;
    END
    ELSE
        PRINT 'Target not found for given Region and Employee.';
END;

-- Example Use Case EXEC DeleteTarget @RegionID = 1,  @EmployeeID = 2;

GO