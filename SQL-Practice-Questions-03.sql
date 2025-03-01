										-- SQL Practice 3


-- Task 1: Create a Database and Table

create database Liibrary;
use Liibrary;
create table booked(BookID bigint primary key ,Title varchar(30) not null ,Author  varchar(30) not null,Genre varchar(30),PublishedYear int,CopiesAvailable int CHECK (CopiesAvailable > 0) );
insert into Booked values(201, 'The Silent Patient', 'Alex Michaelides', 'Thriller', 2019, 4),
(202, 'Atomic Habits', 'James Clear', 'Self-help', 2018, 7),
(203, 'Educated', 'Tara Westover', 'Memoir', 2018, 5);
select *from booked;



                                                                 -- Members Table

create table Members(MemberID int primary key ,Name varchar(10) not null ,Email varchar(20) unique ,Age int check (age between 10 and 40),MembershipDate varchar(40) unique ,TotalBooksBorrowed int check (TotalBooksBorrowed >0) );
insert into Members(MemberID,Name,Email,Age,MembershipDate,TotalBooksBorrowed)  values
(401, 'Emma', 'emma@email.com', 25, '2022-06-15', 6),
(402, 'Noah', 'noah@email.com', 30, '2023-01-20', 3),
(403, 'Olivia', 'olivia@email.com', 22, '2021-09-10', 8);
select *from Members;
drop table booked ;                                        -- BorrowRecords Table
drop table Members;                                
                                                 
create table BorrowRecords(RecordID int unique ,MemberID int not null ,BookID int   ,BorrowDate date not null ,DueDate date not null  ,ReturnDate date ,Fine int check (Fine>=0));
drop table BorrowRecords;
                                    
insert into BorrowRecords values (7001, 401, 201, '2023-07-01', '2023-07-21', '2023-07-20',0),
(7002, 402, 203, '2023-08-05', '2023-08-25', '2023-08-30', 5),
(7003, 401, 203, '2023-09-10', '2023-09-30', NULL, 0);  
    
                       
-- Task 2:               
          
          
-- 1. Create a new user named liba_admin with the password Lib@1234.

CREATE USER 'liba_admin'@'localhost' identified by 'Lib@1234';


-- Grant the liba_admin user SELECT and INSERT permissions on the booked table.


grant  select , insert  on Liibrary.booked to  'liba_admin'@'localhost';
flush  privileges;

-- Revoke the INSERT permission from library_admin.



revoke insert  on  Liibrary.Booked from  'liba_admin'@'localhost';
flush privileges;


-- Task 3: 

-- 1. Start a transaction.

start transaction;


-- 2. Insert a new record into the BorrowRecords table for a member borrowing a book.


insert into  BorrowRecords (RecordID, MemberID, BookID, BorrowDate, DueDate, ReturnDate, Fine) 
values (7004, 402, 201, '2024-02-25', '2024-03-10', NULL, 0);
	
UPDATE Booked SET CopiesAvailable = CopiesAvailable - 1 WHERE BookID = 201;
select  CopiesAvailable from booked;


SAVEPOINT AfterUpdateCopies;

ROLLBACK TO AfterUpdateCopies;

COMMIT;


        
												
