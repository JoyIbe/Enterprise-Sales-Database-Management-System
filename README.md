# SABBI Enterprise Sales Database Design 

## Optimizing Internal Sales Operations with a Scalable Data Solution

### Project Background

Sabbi Enterprise is a fast-growing retail and B2B company dealing in consumer electronics, fashion items, and household products. The company operates through a network of physical stores, online platforms, and strategic resellers across multiple regions. As Sabbi expands, it faces operational bottlenecks stemming from outdated spreadsheets and siloed systems, making it hard to coordinate employees, track sales targets, and measure regional performance.

The need for a centralized database has become evident to support internal operations, monitor key performance indicators (KPIs), and ensure data consistency across departments and regions.

### Operational Challenges

- **Sales Data Fragmentation** – Sales records are dispersed across spreadsheets, making it difficult to consolidate performance reports.

- **Employee Monitoring Gaps** – No centralized system exists for assigning employees to specific regions or tracking their targets.

- **Supplier Management** - Store supplier details, contact info, track last delivery dates and status of suppliers.

- **Reseller Oversight Issues** – Lack of an integrated approach to monitor reseller performance and transactions.

- **Performance Target Tracking** – Regional targets are set but rarely tracked in real-time due to disconnected reporting systems.

- **Inadequate Reporting** – The leadership lacks actionable insights on sales distribution, product trends, and employee contributions.

### Proposed Solution

To streamline operations, Sabbi Enterprise will implement a centralized Microsoft SQL Server-based relational database system. This system will integrate critical internal data sources and provide a reliable platform for real-time reporting, regional sales tracking, and employee performance monitoring.

### Project Overview

This project involves designing a robust, normalized relational database that captures company-centric activities across sales, resellers, employees, regions, and targets.

### Database Scope & Tables

The core tables of the database are:

**Product** – Details of items sold by the company.

**Sales** – Records of all sales transactions including date, value, and associated reseller.

**Employee** – Information about the company’s workforce.

**Region** – Geographic regions the company operates in.

**Suppliers** - Stores records of suppliers information.

**Reseller** – Information about external resellers working with the company.

**EmployeeRegion** – A mapping table indicating which employees are responsible for which regions.

**Target** – Sales targets set for specific regions or employees.

### Requirement Breakdown

#### 1. Functional Requirements

**Product Management:**
Store product details, track availability status and supplier links.

**Sales Tracking:**
Log each transaction with date, unitprice, quantity, sales amount, payment method and link each sale to a reseller and to the employee managing the sale.

**Employee Management:**
Track employees, departments (role), and status. Support updates to job roles and region assignments.

**Region Management:**
Maintain a master list of operational regions. Assign multiple employees to one or more regions.

**Reseller Management:**
Store reseller company name, contact details, and linked region. Track reseller activity and contributions to sales volume.

**Target Management:**
Record monthly or yearly targets per region or employee. Compare actual sales against targets for performance assessment.

### 2. Project Phases

**Phase 1: Database Design**

- Identify entities and relationships. Normalize the schema to 3NF.

- Establish primary and foreign key relationships.

**Phase 2: Implementation in SQL Server**

- Create tables for the database. 

**Phase 3: Data Population & Constraints**

- Populate each table with sample records.

**Apply integrity rules:**

- Sale date must not be in the future.

- Target values must be non-negative.

**Phase 4: Business Logic Implementation**

i) Stored procedures:

- Fetch products by name sorted by most recent sale.

- Update employee’s role or region assignment.

- Retrieve total sales by employee and compare with their targets.

- Archive old sales data beyond a retention threshold.

ii) User-defined functions:

- Calculate region-wise performance percentage.

- Identify top-performing resellers within a given period.

**Phase 5: Reporting & Insights**

i) Queries:

 - List employees managing regions with total sales above a threshold.

- Identify underperforming regions versus targets.

ii) Create a view showing:

- Sales date, product name, region, reseller name, employee, target vs actual.

**Phase 6: Testing & Optimization**
- Test for data consistency and validation.

- Optimize stored procedures and indexes.

### System Architecture Overview

Layer |	Description
|---|---|
Data Layer | SQL Server database with all structured tables and relationships.
Logic Layer |	Stored procedures and functions for automation and business rules.
Interface Layer |	Can integrate with internal dashboards or admin portals for sales tracking.
Analytics Layer |	Power BI or SQL views for performance visualization and reporting.

### Detailed Use Cases & Business Rules
**Employee-Region Mapping:** Each employee can be linked to multiple regions via the EmployeeRegion table to facilitate flexible assignments.

**Sales & Target Alignment:** Every sale will be analyzed against the relevant target set in the Target table for that region and timeframe.

**Reseller Performance:** The Reseller table enables tracking external partnerships and their contribution to company revenue.

**Dynamic Reporting View:** A consolidated view will display sales transactions along with region, product, and employee metadata for strategic review.

