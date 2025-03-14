 -- 1. SQL Operations on a School Database
create database School;
use School;
create table STUDENTS(Roll_No int , Name varchar(30), Marks int, Grade varchar(30));
select *from STUDENTS;
alter table STUDENTS add column Contacts varchar(15);
alter table STUDENTS drop  column Grade;
rename table STUDENTs to CLASSTEN;
truncate CLASSTEN; 

-- 2. SQL Operations on a Sales Database

create database Sales;
use Sales; 
create table Orders(Order_ID int primary key,Customer_Name varchar(15) not null,Product_Category varchar(15),Ordered_item varchar(20),Contact_No varchar(15) unique);
alter table Orders add column order_quantity varchar(15);
rename table Orders to Sales_Orders;
select *from Sales_Orders;
insert into Sales_Orders values 
(1001, 'Alice Johnson', 'Electronics', 'Smartphone', '1234567890' ,1),
(1002, 'Bob Smith', 'Books', 'Novel', '9876543210',2),
(1003, 'Carol Lee', 'Clothing', 'Shirt', '5551234567',3),
(1004, 'David Kim', 'Fitness', 'Yoga Mat', '1112223333',2),
(1005, 'Emily Davis', 'Home', 'Lamp', '4445556666',4),
(1006, 'Frank Taylor', 'Beauty', 'Shampoo', '7778889999',4),
(1007, 'Grace Wilson', 'Toys', 'Puzzle', '3334445555',5),
(1008, 'Henry Brown', 'Office', 'Pen Set', '6667778888',5),
(1009, 'Ivy Martinez', 'Food', 'Coffee', '9990001111',6),
(1010, 'Jack White', 'Music', 'Guitar', '2223334444',7);

select Customer_Name,Ordered_item  from  Sales_Orders;
select *from Sales_Orders;

update Sales_Orders set Product_Category ='Drugs' where Order_ID=1007;
drop  table Sales_Orders;


-- 3. SQL Operations on a Managers Table

create database Managers;
use Managers;
create table Employee(Manager_ID  int,First_name varchar(20),Last_Name varchar(20),DOB varchar(10),Age int,Last_update varchar (10),Gender varchar(10),Department varchar(15),Salary bigint not null);

INSERT INTO Employee values 
(101, 'John', 'Doe', '1985-06-15', 39, '2025-02-18', 'Male', 'IT', 75000),
(102, 'Emma', 'Smith', '1990-08-22', 34, '2025-02-18', 'Female', 'HR', 68000),
(103, 'Liam', 'Johnson', '1982-03-12', 43, '2025-02-18', 'Male', 'Finance', 82000),
(104, 'Olivia', 'Brown', '1995-11-30', 29, '2025-02-18', 'Female', 'Marketing', 72000),
(105, 'Noah', 'Williams', '1988-09-25', 36, '2025-02-18', 'Male', 'Sales', 71000),
(106, 'Sophia', 'Jones', '1993-07-14', 31, '2025-02-18', 'Female', 'IT', 78000),
(107, 'Mason', 'Garcia', '1987-04-18', 37, '2025-02-18', 'Male', 'Operations', 69000),
(108, 'Isabella', 'Martinez', '1991-01-05', 34, '2025-02-18', 'Female', 'Finance', 81000),
(109, 'James', 'Anderson', '1983-12-09', 41, '2025-02-18', 'Male', 'HR', 67000),
(110, 'Charlotte', 'Taylor', '1996-05-21', 28, '2025-02-18', 'Female', 'Marketing', 73000);
select *from Employee;
select  First_name, Last_Name, DOB from Employee  where Manager_ID = 105;
select   First_name , Salary from Employee;
SELECT * 
FROM Employee 
WHERE First_name <> 'Emma';
select * from Employee where Department='IT' and Salary>25000;
select * from Employee where Salary between 10000 and 75000;


-- 4. SQL Operations on Country and Persons Tables

create database Country;
use Country;
create table world(ID bigint,Country_name varchar(15),Population bigint,Area bigint);
create table Persons(ID int,Fname varchar(10),Lname varchar(10), Population bigint, Rating bigint,Country_Id bigint,Country_name varchar(15));


insert into  world values 
(1, 'USA', 331000000, 9833517),
(2, 'Canada', 38000000, 9984670),
(3, 'UK', 68000000, 243610),
(4, 'India', 1390000000, 3287263),
(5, 'Australia', 26000000, 7692024),
(6, 'Germany', 83000000, 357022),
(7, 'France', 67000000, 551695),
(8, 'Japan', 126000000, 377975),
(9, 'Brazil', 213000000, 8515767),
(10, 'Mexico', 128000000, 1964375);


insert into Persons values 
(1, 'John', 'Doe', 331000000, 4.5, 1, 'USA'),
(2, 'Emma', 'Smith', 38000000, 4.8, 2, 'Canada'),
(3, 'Liam', 'Johnson', 68000000, 3.9, 3, 'UK'),
(4, 'Olivia', 'Brown', 1390000000, 4.2, 4, 'India'),
(5, 'Noah', 'Williams', 26000000, 3.5, 5, 'Australia'),
(6, 'Sophia', 'Jones', 83000000, 4.6, 6, 'Germany'),
(7, 'Mason', 'Garcia', 67000000, 4.0, 7, 'France'),
(8, 'Isabella', 'Martinez', 126000000, 3.8, 8, 'Japan'),
(9, 'James', 'Anderson', 213000000, 4.9, 9, 'Brazil'),
(10, 'Charlotte', 'Taylor', 128000000, 4.7, 10, 'Mexico');

select distinct  Country_name from Persons;
select Fname as First_Name, Lname as Last_Name 
from Persons;

select * from Persons where Rating >4;
select *from Persons;

select * from Country_name where Population >26000000;
select *from Persons;
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4;
SELECT * FROM Persons WHERE Country_name IS NULL;

select * from Persons where  Country_name IN  ('USA', 'Canada', 'UK');
select *from Persons;

SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');

SELECT * FROM Persons WHERE Population BETWEEN 500000 AND 2000000;
SELECT * FROM Persons WHERE Country_name NOT LIKE 'C%';
















