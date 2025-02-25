
-- Task 2: 

use Liibrary;



-- Log in as library_admin and try to update or delete a record in the Books table. Observe the result


update booked set CopiesAvailable = 10 where BookID = 201;  -- This should fail
delete from Booked where BookID = 202;  -- This should also fail

insert into booked values();


-- 5. Log in again as library_admin and try inserting a record. Observe the result.

INSERT INTO booked(BookID, Title, Author, Genre, PublishedYear, CopiesAvailable)
VALUES (204, 'New Book', 'Unknown Author', 'Fiction', 2021, 3);  -- This should fail


