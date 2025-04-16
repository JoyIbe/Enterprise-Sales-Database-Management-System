USE [SABBI Ent.];

INSERT INTO Suppliers (SupplierName, ContactName, DeliveryDate, Address, Phone, Email, Status)
VALUES 
('TechSource Ltd.', 'Michael Ade', '2025-04-10', '12 Gizmo Lane, Lagos', '08012345678', 'michael@techsource.com', 'Active'),
('GigaTrade Inc.', 'Sarah Bello', '2025-04-08', '88 Micro Circuit, Ethopia', '08123456789', 'sarah@gigatrade.com', 'Active'),
('SmartGears Co.', 'Ike Okoro', '2025-04-12', '45 Circuit Road, Port Harcourt', '07098765432', 'ike@smartgears.com', 'Inactive'),
('Saphiraa Co.', 'Ama Sapphire', '2024-12-12', 'Allwell Street, China', '07098765432', 'sappjama@saphiraa.com', 'Active'),
('JerryWond Mechs Inc.', 'Jerry Ant', '2025-05-17', 'Orlando River Road, Phillipines', '07098765432', 'jerryant12@jerrywond.com', 'Inactive'),
('Classsom Spring Ltd.', 'George Rue', '2025-01-25', 'New Space Avenue,Birhmingham', '07098765432', 'rossyruegeo@classom.com', 'Inactive'),
('MTN Telecom SA', 'Ndali Wakanda', '2025-09-10', 'Seashells Ngolo Views, SA', '07098765432', 'mtn@saoffice.com', 'Active');

SELECT * FROM Suppliers;

INSERT INTO Products (ProductName, Category, SubCategory, StandardCost, Price, SupplierID, Availability)
VALUES 
('Bluetooth Speaker', 'Electronics', 'Audio', 1200.00, 1500.00, 1, 1),
('Air Fryer', 'Appliances', 'Kitchen', 2500.00, 28000.00, 2, 1),
('Smartwatch', 'Electronics', 'Wearables', 10000.00, 12500.00, 3, 0),
('Boss Down Dress', 'Fashion', 'Ladies', 10000.00, 12500.00, 4, 0),
('Cozy Bedframe', 'Furniture', 'Household', 65000.00, 167000.00, 5, 1),
('MTN Router', 'Electronics', 'Gadgets', 10000.00, 17500.00, 6, 0);

SELECT * FROM Products;

INSERT INTO Region (Continent, Country, State)
VALUES 
('Africa', 'SA', 'Mpumalanga'),
('Europe', 'Greece', ' Athens'),
('Africa', 'Nigeria', 'Abuja'),
('North America', 'Canada', 'Ottawa')
;

SELECT * FROM Region;

INSERT INTO EmployeeRegion (RegionID)
VALUES (1), (2), (3), (4);

SELECT * FROM EmployeeRegion;


INSERT INTO Employees (EmployeeKey, FullName, JobRole, Department, Status, Email)
VALUES 
(207, 'Adaobi Nwosu', 'Sales Executive', 'Sales', 'Active', 'adaobi@sabbi.com'),
(208, 'Anabel Still', 'Sales Person', 'Sales', 'Active', 'still@sabbi.com'),
(209, 'Uche Eze', 'Warehouse Manager', 'Logistics', 'Active', 'uche@sabbi.com'),
(210, 'Deborah White', 'Sales Person', 'Sales', 'Active', 'debby@sabbi.com'),
(208, 'Astig Hassan', 'Sales Person', 'Sales', 'Active', 'astig@sabbi.com'),
(207, 'Phil Zamunda', 'Warehouse Manager', 'Logistics', 'Inactive', 'phil@sabbi.com'),
(210, 'Covra Istil', 'Cashier', 'Sales', 'Active', 'covra@sabbi.com'),
(209, 'Bola Hassan', 'Customer Service Rep', 'Support', 'Inactive', 'bola@sabbi.com');

SELECT * FROM Employees;

INSERT INTO Reseller (ResellerName, ContactEmail, BusinessType, Country, City, State)
VALUES 
('BuyMore Ltd.', 'sales@buymore.com', 'Retailer', 'SA', 'Johannesburg', 'Dutela'),
('QuickMart', 'hello@quickmart.com', 'Wholesaler', 'Nigeria', 'Owerri', 'Imo'),
('SuperResell', 'info@superresell.com', 'Retailer', 'Nigeria', 'Abuja', 'FCT'),
('JijiButer', 'dis@jijibuter.com', 'Retailer', 'Canada', 'Ontario', 'Oldie'),
('RunnerPlug', 'info@runnerplug.com', 'Distributor', 'Nigeria', 'Awka', 'Anambara'),
('Temutela', 'sales@temutela.com', 'Whosaler', 'India', 'Dehli', 'Kapoor');

SELECT * FROM Reseller;

INSERT INTO Sales (OrderDate, Quantity, UnitPrice, StandardCost, PaymentMethod, ProductID, ResellerID, EmployeeID, RegionID)
VALUES 
('2025-04-13', 2, 15000.00, 1200.00, 'Credit Card', 1, 1, 9, 1),
('2025-04-12', 1, 28000.00, 2500.00, 'PayPal', 2, 2, 10, 2),
('2025-04-14', 3, 12500.00, 10000.00, 'Cash', 3, 3, 11, 3),
('2025-04-15', 3, 12500.00, 10000.00, 'Bank Transfer', 4, 4, 12, 4),
('2025-04-12', 3, 167000.00, 65000.00, 'Cash', 5, 5, 13, 4),
('2025-04-11', 3, 17500.00, 10000.00, 'Credit Card', 6, 6, 14, 2),
('2025-04-10', 3, 25400.00, 12550.00, 'Gift Card', 4, 5, 15, 1),
('2025-04-14', 3, 1950.00, 23000.00, 'Cash', 2, 1, 16, 3),
('2025-04-14', 3, 12500.00, 10000.00, 'Cash', 3, 4, 12, 3);

SELECT * FROM Sales;

INSERT INTO Target (RegionID, EmployeeID, TargetMonth, TargetYear, TargetAmount)
VALUES 
(1, 11, 4, 2025, 200000.00),
(4, 12, 4, 2025, 150000.00),
(3, 13, 4, 2025, 100000.00),
(4, 10, 3, 2025, 900000.00),
(2, 9, 2, 2025, 10000.00),
(1, 14, 4, 2025, 100000.00)
;
SELECT * FROM [Target];