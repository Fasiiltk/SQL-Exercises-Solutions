-- Create Orders table
create database Normalization;
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(255) NOT NULL
);

-- Create Order_Details table
CREATE TABLE Order_Details (
    Order_ID INT,
    Product_Name VARCHAR(255) NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (Order_ID, Product_Name),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE
);

-- Insert data into Orders table
INSERT INTO Orders (Order_ID, Customer_Name) VALUES
(101, 'Alice'),
(102, 'Bob'),
(103, 'Alice');

-- Insert data into Order_Details table
INSERT INTO Order_Details (Order_ID, Product_Name, Quantity) VALUES
(101, 'Laptop', 1),
(101, 'Mouse', 2),
(102, 'Keyboard', 1),
(103, 'Monitor', 1),
(103, 'Mouse', 1);

-- Verify data insertion
SELECT * FROM Orders;
SELECT * FROM Order_Details;

-- Fetch complete order details using JOIN
SELECT 
    o.Order_ID, 
    o.Customer_Name, 
    od.Product_Name, 
    od.Quantity
FROM Orders o
JOIN Order_Details od ON o.Order_ID = od.Order_ID
ORDER BY o.Order_ID;
