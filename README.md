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

---

## Business Problem

An online bookstore needs to understand how its **products, customers, sales, and inventory** are performing.

Without structured analysis, it can be difficult to identify:

* Which genres and authors generate the highest sales volume
* Which books are ordered most frequently
* Which customers place multiple orders or spend the most
* Which books have the highest prices
* Which products have low remaining stock
* How revenue is distributed across orders
* Where customers are geographically located

The objective is to use SQL to turn transactional bookstore data into **actionable business information** for sales, customer, and inventory decisions.

---

## Project Objectives

The analysis was designed to answer the following business questions:

1. Which books belong to the Fiction genre?
2. Which books were published after 1950?
3. Which customers are from Canada?
4. What orders were placed during November 2023?
5. What is the total stock available?
6. Which are the most expensive books?
7. Which customers ordered more than one quantity?
8. Which orders generated more than $20?
9. What genres are available in the catalog?
10. Which books have the lowest stock?
11. What is the total revenue generated?
12. How many books were sold by genre?
13. What is the average price of Fantasy books?
14. Which customers have placed at least two orders?
15. Which book is ordered most frequently?
16. What are the three most expensive Fantasy books?
17. Which authors have sold the highest number of books?
18. Where are customers who spent more than $30 located?
19. Which customer has spent the most?
20. How much stock remains after fulfilling recorded orders?

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

## Tools & Technologies

| Tool                           | Usage                                                       |
| ------------------------------ | ----------------------------------------------------------- |
| **PostgreSQL**                 | Database creation and SQL analysis                          |
| **SQL**                        | Data exploration, transformation, aggregation, and analysis |
| **Relational Database Design** | Connecting Books, Customers, and Orders                     |
| **Joins & Aggregations**       | Combining datasets and generating business metrics          |

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

The project uses three relational tables.

### Books

| Column           | Description            |
| ---------------- | ---------------------- |
| `Book_ID`        | Unique book identifier |
| `Title`          | Book title             |
| `Author`         | Book author            |
| `Genre`          | Book category          |
| `Published_Year` | Year of publication    |
| `Price`          | Book price             |
| `Stock`          | Available stock        |

### Customers

| Column        | Description                |
| ------------- | -------------------------- |
| `Customer_ID` | Unique customer identifier |
| `Name`        | Customer name              |
| `Email`       | Customer email             |
| `Phone`       | Customer phone number      |
| `City`        | Customer city              |
| `Country`     | Customer country           |

### Orders

| Column         | Description             |
| -------------- | ----------------------- |
| `Order_ID`     | Unique order identifier |
| `Customer_ID`  | Linked customer         |
| `Book_ID`      | Linked book             |
| `Order_Date`   | Date of order           |
| `Quantity`     | Number of books ordered |
| `Total_Amount` | Total order value       |

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

## The SQL script also includes the PostgreSQL database and table creation logic, followed by CSV data imports.

# 📊 Analysis & Business Questions

## 1. Product & Catalog Analysis

The first set of queries focuses on understanding the bookstore's product catalog.

### Key Analysis

* Fiction books
* Books published after 1950
* Available genres
* Most expensive books
* Lowest-stock books
* Fantasy book pricing

### Business Value

This analysis helps category and inventory teams understand the **composition, pricing, and availability of the bookstore's catalog**.

---

## 2. Sales & Revenue Analysis

The project calculates overall revenue and examines order-level sales activity.

### Key Metrics

* Total revenue
* Orders above $20
* Orders with quantities greater than one
* Books sold by genre
* Books sold by author
* Most frequently ordered book

### Business Value

These metrics help identify **high-performing products, genres, and authors** and provide a foundation for sales-performance monitoring.

The revenue calculation is based on the `Total_Amount` recorded for orders.

---

## 3. Customer Analysis

Customer-level analysis focuses on purchasing frequency, spending, and geography.

### Key Analysis

* Customers from Canada
* Customers placing at least two orders
* Customers purchasing multiple quantities
* Customers associated with orders above $30
* Highest-spending customer

### Business Value

This analysis helps identify **repeat purchasing behavior and high-value customers**, while also providing a geographic view of the customer base.

The repeat-customer analysis uses `GROUP BY` and `HAVING` to identify customers with at least two orders.

---

## 4. Inventory Analysis

Inventory analysis connects recorded stock with order quantities.

### Key Analysis

* Total available stock
* Books with the lowest stock
* Stock remaining after recorded orders

The remaining inventory calculation compares current book stock against the quantity ordered and uses `COALESCE` to account for books with no matching orders.

### Business Value

This provides a foundation for identifying **potential low-stock products and inventory replenishment priorities**.

---

# Advanced SQL Analysis

The project goes beyond basic filtering and sorting by applying:

* `INNER JOIN`
* `LEFT JOIN`
* `GROUP BY`
* `HAVING`
* Aggregate functions
* `COUNT()`
* `SUM()`
* `AVG()`
* `DISTINCT`
* `ORDER BY`
* `LIMIT`
* `COALESCE()`
* Date filtering
* Derived calculations

These techniques are used to connect transactional data with product and customer information and answer business-level questions.

---

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

# 📈 Project Highlights

| Area                   | Analysis                                       |
| ---------------------- | ---------------------------------------------- |
| **Database Design**    | Relational Books, Customers & Orders structure |
| **Data Exploration**   | Table and record-level exploration             |
| **Product Analysis**   | Genre, author, price, publication year         |
| **Sales Analysis**     | Order quantity, revenue, sales volume          |
| **Customer Analysis**  | Repeat orders, spending, geography             |
| **Inventory Analysis** | Stock levels and remaining inventory           |
| **Advanced SQL**       | Joins, aggregations, `HAVING`, `COALESCE`      |
| **Business Analysis**  | Product, customer, sales & inventory insights  |

---

# 🚀 Key Takeaway

This project demonstrates how SQL can be used to move from **raw transactional data to structured business analysis**.

By connecting books, customers, and orders, the analysis provides a multi-dimensional view of **product performance, customer purchasing behavior, revenue, and inventory**.

The project also demonstrates practical SQL skills required for entry-level Data Analyst roles, including **relational data modeling, joins, aggregation, filtering, date analysis, and business-oriented problem solving**.

---

## 📁 Repository Structure

```text
Online-Bookstore/
│
├── Online Bookstore.sql
└── README.md
```

---

## 🔗 SQL File

The complete PostgreSQL script containing the database setup, table creation, data import, and analytical queries is available in this repository.

**Tech Stack:** `PostgreSQL` · `SQL` · `Data Analysis` · `Business Intelligence`
