-- ========================
-- DATABASE:SABBI Enterprise Sales System
-- ========================
USE [SABBI Ent.];

-- ========================
-- TABLE : SUPPLIERS TABLE
-- ========================

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName NVARCHAR(255) UNIQUE NOT NULL,
    ContactName NVARCHAR(255) NOT NULL,
    DeliveryDate DATE,
    Address NVARCHAR(255),
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    Status NVARCHAR(50)
);    
SELECT * FROM Suppliers;

-- ========================
-- TABLE : PRODUCT TABLE
-- ========================

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR (100) NOT NULL,
    Category NVARCHAR(50) NOT NULL,
    SubCategory NVARCHAR(50) NOT NULL,
    StandardCost DECIMAL(10,2) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    SupplierID INT NOT NULL REFERENCES Suppliers(SupplierID),
    Availability BIT
);
SELECT * FROM Products;

-- ========================
-- TABLE : REGION TABLE
-- ========================

CREATE TABLE Region (
    RegionID INT PRIMARY KEY IDENTITY(1,1),
    Continent NVARCHAR(50) NOT NULL,
    Country NVARCHAR(50) NOT NULL,
    State NVARCHAR(50) NOT NULL
);
SELECT * FROM Region;

-- ========================
-- TABLE: Employee
-- ========================

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeKey INT NOT NULL FOREIGN KEY REFERENCES EmployeeRegion(EmployeeKey),
    FullName NVARCHAR(100) NOT NULL,
    JobRole NVARCHAR(100) NOT NULL,
    Department NVARCHAR(50) NOT NULL,
    Status NVARCHAR(20) NOT NULL,
    Email NVARCHAR(255) UNIQUE NOT NULL,
    IsActive BIT DEFAULT 1
);
SELECT * FROM Employees;

-- ========================
-- TABLE: Employee Region
-- ========================

CREATE TABLE EmployeeRegion(
    EmployeeKey INT PRIMARY KEY IDENTITY (207,1),
    RegionID INT NOT NULL FOREIGN KEY REFERENCES Region(RegionID)
);
SELECT * FROM EmployeeRegion;

-- ========================
-- TABLE: Reseller
-- ========================

CREATE TABLE Reseller (
    ResellerID INT PRIMARY KEY IDENTITY(1,1),
    ResellerName NVARCHAR(100) NOT NULL,
    ContactEmail NVARCHAR(100) UNIQUE NOT NULL,
    BusinessType NVARCHAR(100) NOT NULL,
    Country NVARCHAR(50) NOT NULL,
    City  NVARCHAR(50) NOT NULL,
    State NVARCHAR(50) NOT NULL
);
SELECT * FROM Reseller;


-- ========================
-- TABLE: Sales
-- ========================
CREATE TABLE Sales (
    OrderID INT PRIMARY KEY IDENTITY(1001,1),
    OrderDate DATE CHECK (OrderDate <= GETDATE()),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL ,
    StandardCost DECIMAL(10,2) NOT NULL , 
    SalesAmount AS (Quantity * UnitPrice) PERSISTED,
    PaymentMethod NVARCHAR(50) NOT NULL,
    ProductID INT NOT NULL FOREIGN KEY REFERENCES Products(ProductID),
    ResellerID INT NOT NULL FOREIGN KEY REFERENCES Reseller(ResellerID),
    EmployeeID INT NOT NULL FOREIGN KEY REFERENCES Employees(EmployeeID),
    RegionID INT NOT NULL FOREIGN KEY REFERENCES Region(RegionID) 
);
SELECT * FROM Sales;

-- ========================
-- TABLE: Target
-- ========================
CREATE TABLE Target (
    RegionID INT NOT NULL FOREIGN KEY REFERENCES Region(RegionID),
    EmployeeID INT NOT NULL FOREIGN KEY REFERENCES Employees(EmployeeID),
    TargetMonth INT CHECK (TargetMonth BETWEEN 1 AND 12),
    TargetYear INT,
    TargetAmount DECIMAL(10,2) CHECK (TargetAmount >= 0)
);
SELECT * FROM dbo.Target;
