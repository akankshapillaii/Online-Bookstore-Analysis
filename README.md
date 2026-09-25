# Online-Bookstore-Analysis

A **PostgreSQL-based SQL analysis project** exploring an online bookstore's books, customers, orders, revenue, sales performance, and inventory.

The project demonstrates how SQL can transform relational data into **business-focused insights** across product performance, customer behavior, sales trends, and inventory management.

---

## Executive Summary

This project analyzes an online bookstore database containing three interconnected datasets:

* **Books** — title, author, genre, publication year, price, and stock
* **Customers** — customer details and location
* **Orders** — order date, quantity, and total transaction value

The analysis progresses from **database setup and data exploration** to increasingly advanced SQL queries using filtering, aggregation, joins, `GROUP BY`, `HAVING`, sorting, and derived metrics.

Key business areas explored include:

* Revenue generated from orders
* Book sales by genre and author
* Customer purchasing behavior
* Most frequently ordered books
* High-value customers
* Pricing and expensive-book analysis
* Stock availability and remaining inventory
* Geographic distribution of customers

The project demonstrates the ability to translate business questions into structured SQL analysis.

🔗 **Check out the complete SQL code [here](Online-Bookstore.sql)**

---
## 📑 Table of Contents

* [Executive Summary](https://github.com/akankshapillaii/Online-Bookstore-Analysis#executive-summary)
* [Business Problem](https://github.com/akankshapillaii/Online-Bookstore-Analysis#business-problem)
* [Project Scope](https://github.com/akankshapillaii/Online-Bookstore-Analysis#project-scope)
* [Key Stakeholders](https://github.com/akankshapillaii/Online-Bookstore-Analysis#key-stakeholders)
* [Project Workflow](https://github.com/akankshapillaii/Online-Bookstore-Analysis#project-workflow)
* [Database Structure](https://github.com/akankshapillaii/Online-Bookstore-Analysis#database-structure)
* [Data Exploration](https://github.com/akankshapillaii/Online-Bookstore-Analysis#data-exploration)
* [SQL Analysis & Queries](https://github.com/akankshapillaii/Online-Bookstore-Analysis#sql-analysis--queries)
* [Business Insights Framework](https://github.com/akankshapillaii/Online-Bookstore-Analysis#business-insights-framework)
* [Business Recommendations](https://github.com/akankshapillaii/Online-Bookstore-Analysis#business-recommendations)
* [Key Takeaway](https://github.com/akankshapillaii/Online-Bookstore-Analysis#-key-takeaway)

-----
## Business Problem

An online bookstore needs to understand how its **products, customers, sales, and inventory** are performing.

Without structured analysis, it can be difficult to identify:

* Which genres and authors generate the highest sales volume?
* Which books are ordered most frequently?
* Which customers place multiple orders or spend the most?
* Which books have the highest prices?
* Which products have low remaining stock?
* How revenue is distributed across orders?
* Where customers are geographically located?

The objective is to use SQL to turn transactional bookstore data into **actionable business information** for sales, customer, and inventory decisions.

---

## Project Scope

The analysis focuses on four key areas:

- **Sales & Revenue:** Analyze order value, sales volume, and revenue performance.
- **Product Performance:** Evaluate genres, authors, pricing, and book demand.
- **Customer Behavior:** Identify repeat and high-value customers.
- **Inventory:** Assess stock levels and remaining inventory after orders.

---

## Key Stakeholders

| Stakeholder             | Business Use                                                 |
| ----------------------- | ------------------------------------------------------------ |
| **Sales Team**          | Monitor revenue, order volume, and product sales performance |
| **Category Managers**   | Understand genre-level and author-level book performance     |
| **Customer Management** | Identify repeat and high-value customers                     |
| **Inventory Team**      | Monitor stock levels and remaining inventory                 |
| **Business Management** | Evaluate overall revenue and commercial performance          |
| **Data / BI Teams**     | Maintain analytical queries and generate business insights   |

---

## Project Workflow

```text
Raw CSV Data
     ↓
Database & Table Creation
     ↓
Data Import
     ↓
Data Exploration
     ↓
Data Validation
     ↓
SQL Analysis
     ↓
Advanced Queries
     ↓
Business Insights
     ↓
Recommendations
```

---

# Database Structure

### Books

| Column Name | Description | Data Type |
|---|---|---|
| `Book_ID` | Unique identifier for each book | Integer |
| `Title` | Title of the book | Text |
| `Author` | Name of the book's author | Text |
| `Genre` | Genre or category of the book | Text |
| `Published_Year` | Year the book was published | Integer |
| `Price` | Selling price of the book | Numeric |
| `Stock` | Available quantity in inventory | Integer |

### Customers

| Column Name | Description | Data Type |
|---|---|---|
| `Customer_ID` | Unique identifier for each customer | Integer |
| `Name` | Customer's full name | Text |
| `Email` | Customer's email address | Text |
| `Phone` | Customer's contact number | Text |
| `City` | Customer's city of residence | Text |
| `Country` | Customer's country of residence | Text |

### Orders

| Column Name | Description | Data Type |
|---|---|---|
| `Order_ID` | Unique identifier for each order | Integer |
| `Customer_ID` | Identifier linking the order to a customer | Integer |
| `Book_ID` | Identifier linking the order to a book | Integer |
| `Order_Date` | Date on which the order was placed | Date |
| `Quantity` | Number of books ordered | Integer |
| `Total_Amount` | Total monetary value of the order | Numeric |

The database uses primary and foreign-key relationships to connect customers and books with their corresponding orders.

---

# Data Exploration

Before performing the analysis, the database was reviewed to understand the available tables and records.

### Initial exploration included:

* Reviewing the `Books` table
* Reviewing the `Customers` table
* Reviewing the `Orders` table
* Checking imported records
* Validating the relationship between customers, books, and orders
* Setting the required date style for order-date analysis

-----

# SQL Analysis & Queries

The project uses PostgreSQL to answer practical business questions across **product performance, sales, customer behavior, and inventory management**.
Few of the most insightful queries include:

---

## Product & Catalog Analysis

**Q1. Which are the 10 most expensive books?**
```sql
SELECT *
FROM Books
ORDER BY Price DESC
LIMIT 10;
```
**Q2. Which books have the lowest stock levels?**
```sql
SELECT *
FROM Books
ORDER BY Stock ASC
LIMIT 10;
```

**Q3. What genres are available in the bookstore catalog?**
```sql
SELECT DISTINCT Genre
FROM Books;
```

**Q4. What is the average price of books in the Fantasy genre?**
```sql
SELECT AVG(Price) AS Avg_Price
FROM Books
WHERE Genre = 'Fantasy';
```

## Sales & Revenue Analysis

**Q1. What is the total revenue generated from all orders?**
```sql
SELECT SUM(Total_Amount) AS Revenue
FROM Orders;
```

**Q2. Which genres have the highest number of books sold?**
```sql
SELECT 
    b.Genre,
    SUM(o.Quantity) AS Total_Books_Sold
FROM Orders o
JOIN Books b 
    ON o.Book_ID = b.Book_ID
GROUP BY b.Genre;
```

**Q3. Which book is ordered most frequently?**
```sql
SELECT 
    o.Book_ID,
    b.Title,
    COUNT(o.Order_ID) AS Order_Count
FROM Orders o
JOIN Books b 
    ON o.Book_ID = b.Book_ID
GROUP BY o.Book_ID, b.Title
ORDER BY Order_Count DESC
LIMIT 1;
```

**Q4. Which authors have the highest book sales?**
```sql
SELECT 
    b.Author,
    SUM(o.Quantity) AS Total_Quantity
FROM Orders o
JOIN Books b 
    ON o.Book_ID = b.Book_ID
GROUP BY b.Author
ORDER BY Total_Quantity DESC;
```

## Customer Behavior Analysis

**Q1. Which customers have placed at least two orders?**
```sql
SELECT 
    o.Customer_ID,
    c.Name,
    COUNT(o.Order_ID) AS Order_Count
FROM Orders o
JOIN Customers c 
    ON o.Customer_ID = c.Customer_ID
GROUP BY o.Customer_ID, c.Name
HAVING COUNT(o.Order_ID) >= 2;
```

**Q2. Which customer has spent the most?**
```sql
SELECT 
    c.Customer_ID,
    c.Name,
    SUM(o.Total_Amount) AS Total_Spent
FROM Orders o
JOIN Customers c 
    ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID, c.Name
ORDER BY Total_Spent DESC
LIMIT 1;
```

**Q3. Which customers ordered more than one quantity of books?**
```sql
SELECT *
FROM Orders
WHERE Quantity > 1
ORDER BY Quantity DESC;
```

**Q4. Where are customers who spent more than $30 located?**
```sql
SELECT DISTINCT 
    c.City,
    o.Total_Amount
FROM Orders o
JOIN Customers c 
    ON o.Customer_ID = c.Customer_ID
WHERE o.Total_Amount > 30;
```
## Inventory Analysis

**Q1. What is the total stock currently available?**
```sql
SELECT SUM(Stock) AS Total_Stock
FROM Books;
```

**Q2. Which books have the lowest stock levels?**
```sql
SELECT *
FROM Books
ORDER BY Stock ASC
LIMIT 10;
```

**Q3. How much stock remains after fulfilling recorded orders?**
```sql
SELECT 
    b.Book_ID,
    b.Title,
    b.Stock,
    COALESCE(SUM(o.Quantity), 0) AS Order_Quantity,
    b.Stock - COALESCE(SUM(o.Quantity), 0) AS Remaining_Quantity
FROM Books b
LEFT JOIN Orders o 
    ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID
ORDER BY b.Book_ID;
```

**Q4. Which orders have a total value above $20?**
```sql
SELECT *
FROM Orders
WHERE Total_Amount > 20
ORDER BY Total_Amount DESC;
```

# Business Insights Framework

The analysis creates a foundation for answering four major business areas:

| Area                    | Key Questions                                                    |
| ----------------------- | ---------------------------------------------------------------- |
| **Product Performance** | Which books, genres, and authors sell the most?                  |
| **Customer Behavior**   | Who are the repeat and high-value customers?                     |
| **Revenue**             | How much revenue is generated and which orders contribute to it? |
| **Inventory**           | Which products have low stock and how much inventory remains?    |

---

# Business Recommendations

### 1. Prioritize Low-Stock Books

Books with the lowest remaining inventory should be monitored regularly and evaluated for replenishment based on their sales activity.

**Goal:** Reduce potential stockouts of actively purchased products.

---

### 2. Monitor High-Performing Genres & Authors

Genre- and author-level sales analysis can be used to identify products generating higher sales volume.

**Goal:** Support assortment planning and inventory allocation.

---

### 3. Identify & Retain Repeat Customers

Customers placing multiple orders represent an important segment for customer-retention initiatives.

**Goal:** Encourage repeat purchases through personalized recommendations, loyalty initiatives, or targeted promotions.

---

### 4. Focus on High-Value Customers

Customer-level spending analysis can identify customers generating higher transaction value.

**Goal:** Understand high-value customer behavior and develop strategies to encourage continued engagement.

---

### 5. Use Order Patterns for Inventory Planning

Order quantities and book-level sales activity can be compared with current stock levels.

**Goal:** Align inventory availability with observed purchasing patterns.

---

### 6. Monitor Product Pricing

Analysis of expensive books and genre-level average pricing can help identify differences in product positioning.

**Goal:** Support pricing and assortment decisions using actual catalog and order data.

---

# Key Takeaway

This project demonstrates how SQL can be used to move from **raw transactional data to structured business analysis**.

By connecting books, customers, and orders, the analysis provides a multi-dimensional view of **product performance, customer purchasing behavior, revenue, and inventory**.

The project also demonstrates practical SQL skills required for entry-level Data Analyst roles, including **relational data modeling, joins, aggregation, filtering, date analysis, and business-oriented problem solving**.

**Tech Stack:** `PostgreSQL` · `SQL` · `Data Analysis` · `Business Intelligence`
