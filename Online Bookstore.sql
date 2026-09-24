-- Database: Online Bookstore

-- DROP DATABASE IF EXISTS "Online Bookstore";

CREATE DATABASE "Online Bookstore"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
Book_id SERIAL PRIMARY KEY,
Title VARCHAR (100),
Author VARCHAR (100),
Genre VARCHAR (50),
Published_year INT,
Price NUMERIC(10,2),
Stock INT
);

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
Customer_ID SERIAL PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100), 
Phone VARCHAR(15),
City VARCHAR(50),
Country VARCHAR(100)
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
Order_ID SERIAL PRIMARY KEY,
Customer_ID INT REFERENCES Customers(customer_id),
Book_ID	 INT REFERENCES Books(Book_id),
Order_Date DATE,
Quantity INT, 
Total_Amount NUMERIC(10,2)
);

SELECT * FROM orders;
SELECT * FROM Books;
SELECT * FROM Customers;

-- Import data into Books table
COPY books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM 'D:\Projects Material Files\Online Bookstore Postgresql UTF8\Books.csv'
CSV HEADER;

COPY Customers(Customer_ID,Name,Email,Phone,City,Country)
FROM 'D:\Projects Material Files\Online Bookstore Postgresql UTF8\customers.csv'
CSV HEADER;

COPY orders(Order_ID,Customer_ID,Book_ID,Order_Date,Quantity,Total_Amount)
FROM 'D:\Projects Material Files\Online Bookstore Postgresql UTF8\orders.csv'
CSV HEADER;

--changing the date style
SET datestyle = 'ISO, DMY';

--1.retrieving all books in the "Fiction" genre
SELECT * FROM books 
where genre = 'Fiction';

-- 2.Find books published after the year 1950.
SELECT distinct title, published_year 
FROM books
where published_year > 1950;

--3.List all customers from canada.
SELECT * FROM customers
WHERE country = 'Canada';

--4.Show orders placed in NOV 2023.
SELECT * FROM orders
WHERE order_date BETWEEN '2023-11-1' AND '2023-11-30';

--5.Retrieve total stock of books available
SELECT SUM(stock) as total_stock
FROM books;

--6.Find the details of the most expensive books
SELECT * FROM books
ORDER BY price DESC 
LIMIT 10;

--7.All customers who ordered more than 1 quantity of books.
SELECT * FROM Orders
WHERE quantity > 1
ORDER BY quantity DESC; 

--8.All orders where total amount exceeds $20.
SELECT * FROM orders
WHERE total_amount > 20
ORDER BY total_amount DESC;

--9.All genres available in the books table.
SELECT DISTINCT Genre from Books;

--10.Book with the lowest stock.
SELECT * FROM Books
ORDER BY stock ASC
LIMIT 10;
--11.Total revenue generated from all orders.
SELECT SUM(total_amount) as revenue
FROM orders;

--Advanced Questions:

--1.Total no of books sold for each genre.
SELECT b.genre, SUM(o.quantity) AS total_books_sold 
FROM orders o 
JOIN books b ON o.book_id = b.book_id
GROUP BY b.genre;

--2.find the avg price of books in the fantasy genre.
SELECT AVG(Price) AS avg_price
FROM Books
WHERE genre = 'Fantasy';

--3.Customers who have placed atleast 2 orders.
SELECT o.Customer_id, c.name, COUNT(o.order_id) AS order_count
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT (order_id) >=2;

--4.Find the most Frequently ordered book.
SELECT o.book_id, b.title, COUNT(o.order_id) AS order_count
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY o.book_id, b.title
ORDER BY order_count DESC LIMIT 1;

--5.Show the top 3 most expensive books of the fantasy category
SELECT * FROM books 
WHERE genre = 'Fantasy' 
ORDER BY price DESC LIMIT 3;

--6.Retrieve total quantity of books sold by each auther.
SELECT b.author, SUM(o.quantity) AS total_quantity
FROM orders o 
JOIN books b ON o.book_id = b.book_id
GROUP BY b.author 
ORDER BY total_quantity DESC;

--7.List the cities where customers who spent over $30 are located.
SELECT DISTINCT c.city, total_amount 
FROM orders o 
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.total_amount > 30;

--8.Find the customer who spent the most on orders.
SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC LIMIT = ;

--9.Calculate the stock remaining after fullfilling the orders.
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS order_quantity,
	b.stock -  COALESCE(SUM(o.quantity),0) AS remaining_quantity
FROM books b
LEFT JOIN orders o ON b.book_id = o.book_id
GROUP BY b.book_id ORDER BY b.book_id;	 	


