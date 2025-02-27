                                                              -- SQL Practice 6


create database SQL_Practice_6;
use SQL_Practice_6;
-- 1. Create a Table
create table books(book_id int primary key auto_increment,title varchar(40),year int,author varchar(20),genre varchar(30));
drop table books;
select *from books;

-- 2. Insert Data Using a Stored Procedure 

delimiter //
create procedure Insert_in_Books(pr_title varchar(30),pr_author varchar(30),pr_year int,pr_genre varchar(30))
begin
insert into books(title,author,year,genre) values(pr_title,pr_author,pr_year,pr_genre);
select *from books;
end 
//
delimiter ;

call Insert_in_Books('A','X',1995,'Fiction');
call Insert_in_Books('B','Y',2010,'Science');
call Insert_in_Books('C','Z',2005,'History');
call Insert_in_Books('D','A',2007,'Action');

-- 3. Retrieve All Books

DELIMITER //

CREATE PROCEDURE GetAllBooks()
BEGIN
    SELECT * FROM books;
END //

DELIMITER ;

CALL GetAllBooks();




-- 4. Retrieve Books by Genre


delimiter ##

create procedure Retrieve_Books(in By_genre varchar(30))
begin

select *from Books where genre=By_genre;

end
## 
delimiter ;
call Retrieve_Books('Science');
DROP PROCEDURE IF EXISTS Retrieve_Books;

-- 5. Count Books by an Author

DELIMITER //

CREATE PROCEDURE CountBooksByAuthor(IN book_author VARCHAR(255), OUT book_count INT)
BEGIN
    SELECT COUNT(*) INTO book_count FROM books WHERE author = book_author;
END //

DELIMITER ;

CALL CountBooksByAuthor('X', @total_books);
SELECT @total_books AS Total_Books;


-- 6. Find the Oldest Book

DELIMITER //

CREATE PROCEDURE GetOldestBook()
BEGIN
    SELECT title, year FROM books ORDER BY year ASC LIMIT 1;
END //

DELIMITER ;

CALL GetOldestBook();

-- 7. Find the Average Publication Year of Books by Genre


DELIMITER //

CREATE PROCEDURE GetAverageYearByGenre(IN book_genre VARCHAR(100), OUT avg_year int)
BEGIN
    SELECT AVG(year) INTO avg_year FROM books WHERE genre = book_genre;
END //

DELIMITER ;
set @average_year=0;
CALL GetAverageYearByGenre('Fiction', @average_year);
SELECT @average_year AS Average_Publication_Year;

drop  PROCEDURE GetAverageYearByGenre;


-- 8. Update the Genre of a Book

DELIMITER //

create procedure  UpdateBookGenre(IN book_ide INT, IN new_genre VARCHAR(100))
BEGIN
    UPDATE books SET genre = new_genre WHERE book_id = book_ide;
    select *from books;
END //

delimiter  ;

Call UpdateBookGenre(4, 'Drama');
select *from books;
drop procedure  UpdateBookGenre;
truncate table books;


-- 9. Delete a Book by ID

DELIMITER //

create procedure DeleteBookByID(IN book_ide INT)
BEGIN
    DELETE FROM books WHERE book_id = book_ide;
    select *from books;
END //

DELIMITER ;

CALL DeleteBookByID(2);

drop procedure DeleteBookByID;

select *from books;



-- 10. Categorize Books Based on Year


DELIMITER //

create procedure  CategorizeBook(IN book INT, OUT category VARCHAR(20))
begin
    declare  book_year int ;
    
    select year into book_year FROM books WHERE book_id = book;
    
    IF book_year < 2000 THEN
        SET category = 'Classic';
    ELSE
        set category = 'Modern';
    end  if;
end //

DELIMITER ;

CALL CategorizeBook(4, @book_category);
SELECT @book_category AS Book_Category;
drop procedure CategorizeBook;



-- 11. Find the Most Recent Book

DELIMITER //

create procedure  GetMostRecentBook()
begin 
    SELECT title FROM books order by year desc limit 1;
END //

DELIMITER ;

call  GetMostRecentBook();


