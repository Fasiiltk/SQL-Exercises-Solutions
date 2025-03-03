-- 1. Creating the Table
use weekly;
create table cars(Car_ID  int unique,Brand_Name varchar(20)not null ,Model_Name varchar(30) not null ,Mfd_Year  int not null ,price int not null );
drop table cars;

-- 2. Stored Procedure to Insert Cars


delimiter \\
create procedure Addcar( in P_brand varchar(30),in P_model varchar(30),in p_year int,P_price Decimal(20,3))
BEGIN
    INSERT INTO cars (brand, model, manufacturing_year, price)
    VALUES (brand_name, model_name, year, car_price);
END //
DELIMITER ;


-- Insert 3 sample cars

CALL AddCar('Toyota', 'Corolla', 2022, 25000);
CALL AddCar('BMW', 'X5', 2021, 60000);
CALL AddCar('Ford', 'Focus', 2019, 18000);

-- 3(a) Procedure to Retrieve All Cars

DELIMITER //
CREATE PROCEDURE GetAllCars()
BEGIN
    SELECT * FROM cars;
END //
DELIMITER ;

-- 3(b) Procedure to Retrieve Cars by Brand

DELIMITER //
CREATE PROCEDURE GetCarsByBrand(IN brand_name VARCHAR(50))
BEGIN
    SELECT * FROM cars WHERE brand = brand_name;
END //
DELIMITER ;

-- 3(c) Procedure to Count Total Cars

DELIMITER //
CREATE PROCEDURE GetTotalCars()
BEGIN
    SELECT COUNT(*) AS total_cars FROM cars;
END //
DELIMITER ;

-- 4(a) Procedure to Update Car Price

DELIMITER //
CREATE PROCEDURE UpdateCarPrice(IN car_id INT, IN new_price DECIMAL(10,2))
BEGIN
    UPDATE cars SET price = new_price WHERE id = car_id;
END //
DELIMITER ;

-- 4(b) Procedure to Remove a Car

DELIMITER //
CREATE PROCEDURE RemoveCar(IN car_id INT)
BEGIN
    DELETE FROM cars WHERE id = car_id;
END //
DELIMITER ;

-- 5(a) Procedure to Classify Cars as New or Used

DELIMITER //
CREATE PROCEDURE ClassifyCarByYear()
BEGIN
    SELECT id, brand, model, manufacturing_year,
        CASE 
            WHEN manufacturing_year >= YEAR(CURDATE()) - 3 THEN 'New'
            ELSE 'Used'
        END AS car_condition
    FROM cars;
END //
DELIMITER ;

-- 5(b) Procedure to Classify Cars Based on Price

DELIMITER //
CREATE PROCEDURE ClassifyCarByPrice()
BEGIN
    SELECT id, brand, model, price,
        CASE 
            WHEN price > 50000 THEN 'Luxury'
            WHEN price BETWEEN 20000 AND 50000 THEN 'Mid-Range'
            ELSE 'Budget'
        END AS price_category
    FROM cars;
END //
DELIMITER ;

-- 6(a) Procedure to Print Years from 2000 to 2025

DELIMITER //
CREATE PROCEDURE PrintYears()
BEGIN
    DECLARE year INT DEFAULT 2000;
    WHILE year <= 2025 DO
        SELECT year;
        SET year = year + 1;
    END WHILE;
END //
DELIMITER ;

-- 6(b) Procedure to Print Even Numbers from 2 to 20

DELIMITER //
CREATE PROCEDURE PrintEvenNumbers()
BEGIN
    DECLARE num INT DEFAULT 2;
    WHILE num <= 20 DO
        SELECT num;
        SET num = num + 2;
    END WHILE;
END //
DELIMITER ;
