                                                                      -- SQL Prctice -01


-- Create a database called library and create the Books, Members, and BorrowRecords tables in the database with appropriate data types and constraints. ?



-- Books Table 

create Database library;
use library;
create table Books(BookID int primary key,Title varchar(100) not null,Author varchar(100) not null, Genre varchar(100),PublishedYear int not null, CopiesAvailable int check(CopiesAvailable > 0)); 
insert into Books values(200,'The Silent patient','Alex Michaelides','Thriller',2019,4),(202,'Atomic Habits','James Clear','Self-help',2018,7);
select * from Books;


-- Members Table

create table Members(MembersID int primary key,Name varchar(100) not null, Email varchar(100) unique, Age int check(Age between 10 and 40),MembershipDate date not null,TotalBooksBorrowed int check(TotalBooksBorrowed >= 0));
insert into Members values(401, 'Emma', 'emma@gmail.com', 25, '2022-06-15', 6),(402,'Noah', 'noah@email.com', 30, '2023-01-20',3);
select * from Members;

-- BorrowRecords Table

create table BorrowRecords(RecordID int unique,MemberID int not null, BookID int not null, BorrowDate date not null, DueDate date not null,ReturnDate date, Fine int check(Fine >= 0),foreign key (MemberID) references Members(MembersID),foreign key (BookID) references Books(BookID));
insert into BorrowRecords values(7001,401,200,'2023-07-21','2023-07-21','2023-07-20',0),(7002,402,202,'2023-08-05','2023-08-25','2023-08-30',5);
select * from BorrowRecords;
