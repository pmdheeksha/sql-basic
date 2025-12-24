/*CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);*/

INSERT INTO Customers VALUES
(1, 'Dheeksha', 'Chennai', '2024-01-10'),
(2, 'Riya', 'Bangalore', '2024-02-15'),
(3, 'Arun', 'Hyderabad', '2024-03-20'),
(4, 'Kavin', 'Chennai', '2024-04-05');
SELECT *
FROM Customers

/*CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);*/
INSERT INTO Orders VALUES
(101, 1, '2025-01-01', 500),
(102, 1, '2025-01-10', 1200),
(103, 2, '2025-02-11', 700),
(104, 3, '2025-02-15', 1500),
(105, 4, '2025-03-01', 900),
(106, 1, '2025-03-05', 2500),
(107, 2, '2025-03-10', 1300),
(108, 2, '2025-03-12', 400),
(109, 3, '2025-03-15', 1800),
(110, 3, '2025-04-01', 2200),
(111, 4, '2025-04-05', 600),
(112, 4, '2025-04-20', 750),
(113, 1, '2025-05-01', 900),
(114, 1, '2025-05-15', 1600),
(115, 2, '2025-05-20', 3000);
SELECT* FROM Orders


/*CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price INT
);*/

INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 50000),
(2, 'Phone', 'Electronics', 20000),
(3, 'Headphone', 'Accessories', 2000),
(4, 'Keyboard', 'Accessories', 1500),
(5, 'Mouse', 'Accessories', 800),
(6, 'Smartwatch', 'Electronics', 7000),
(7, 'Tablet', 'Electronics', 30000),
(8, 'Charger', 'Accessories', 1200),
(9, 'Monitor', 'Electronics', 15000),
(10, 'USB Cable', 'Accessories', 300),
(11, 'Speakers', 'Electronics', 4500),
(12, 'Webcam', 'Electronics', 2200),
(13, 'Power Bank', 'Accessories', 1800),
(14, 'Printer', 'Electronics', 9000),
(15, 'Mouse', 'Accessories',600);
SELECT*
FROM Products

/*CREATE TABLE OrderItems (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);*/


INSERT INTO OrderItems VALUES
(16, 101, 3, 1),
(17, 101, 4, 1),
(18, 102, 1, 1),
(19, 102, 3, 2),
(20, 103, 2, 1),
(21, 103, 3, 1),
(22, 104, 1, 1),
(23, 104, 2, 1),
(24, 104, 4, 1),
(25, 105, 4, 1),
(26, 105, 3, 2),
(27, 101, 2, 1),
(28, 102, 4, 1),
(29, 103, 1, 1),
(30, 105, 1, 1);
SELECT*
FROM OrderItems