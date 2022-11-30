create database E_Commerce;
use E_Commerce;

-- 1 --
CREATE TABLE IF NOT EXISTS supplier (
    supp_id INT PRIMARY KEY,
    supp_name VARCHAR(50) NOT NULL,
    supp_city VARCHAR(50) NOT NULL,
    supp_phone VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS customer (
    cus_id INT PRIMARY KEY,
    cus_name VARCHAR(20) NOT NULL,
    cus_phone VARCHAR(10) NOT NULL,
    cus_city VARCHAR(30) NOT NULL,
    cus_gender CHAR
);
CREATE TABLE IF NOT EXISTS category (
    cat_id INT PRIMARY KEY,
    cat_name VARCHAR(20) NOT NULL
);
CREATE TABLE IF NOT EXISTS product (
    pro_id INT PRIMARY KEY,
    pro_name VARCHAR(20) NOT NULL DEFAULT 'dummy',
    pro_desc VARCHAR(60),
    cat_id INT,
    FOREIGN KEY (cat_id)
        REFERENCES category (cat_id)
);
CREATE TABLE IF NOT EXISTS supplier_pricing (
    pricing_id INT PRIMARY KEY,
    pro_id INT,
    FOREIGN KEY (pro_id)
        REFERENCES product (pro_id),
    supp_id INT,
    FOREIGN KEY (supp_id)
        REFERENCES supplier (supp_id),
    supp_price INT DEFAULT 0
);
CREATE TABLE IF NOT EXISTS ordertable (
    ord_id INT PRIMARY KEY,
    ord_amount INT NOT NULL,
    ord_date DATE NOT NULL,
    cus_id INT,
    FOREIGN KEY (cus_id)
        REFERENCES customer (cus_id),
    pricing_id INT,
    FOREIGN KEY (pricing_id)
        REFERENCES supplier_pricing (pricing_id)
);
CREATE TABLE IF NOT EXISTS rating (
    rat_id INT PRIMARY KEY,
    ord_id INT,
    FOREIGN KEY (ord_id)
        REFERENCES ordertable (ord_id),
    rat_ratstars INT NOT NULL
);

-- 2 --
insert into supplier values(1, 'Rajesh Retails', 'Delhi', 1234567890);
insert into supplier values(2, 'Appario Ltd.', 'Mumbai', 2589631470);
insert into supplier values(3, 'Knome products', 'Banglore', 9785462315);
insert into supplier values(4, 'Bansal Retails', 'Kochi', 8975463285);
insert into supplier values(5, 'Mittal Ltd.', 'Lucknow', 7898456532);

insert into customer values (1, 'AAKASH', 9999999999, 'DELHI', 'M');
insert into customer values (2, 'AMAN', 9785463215, 'NOIDA', 'M');
insert into customer values (3, 'NEHA', 9999999999, 'MUMBAI', 'F');
insert into customer values (4, 'MEGHA', 9994562399, 'KOLKATA', 'F');
insert into customer values (5, 'PULKIT', 7895999999, 'LUCKNOW', 'M');

insert into category values (1, 'BOOKS');
insert into category values (2, 'GAMES');
insert into category values (3, 'GROCERIES');
insert into category values (4, 'ELECTRONICS');
insert into category values (5, 'CLOTHES');

insert into product values (1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2);
insert into product values (2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5);
insert into product values (3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4);
insert into product values (4, 'OATS', 'Highly Nutritious from Nestle', 3);
insert into product values (5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1);
insert into product values (6, 'MILK', '1L Toned Milk', 3);
insert into product values (7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4);
insert into product values (8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5);
insert into product values (9, 'Project IGI', 'compatible with windows 7 and above', 2);
insert into product values (10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5);
insert into product values (11, 'Rich Dad Poor Dad', 'Written by Robert Kiyosaki', 1);
insert into product values (12, 'Train Your Brain', 'By Shireen Stephen', 1);

insert into supplier_pricing values (1, 1, 2, 1500);
insert into supplier_pricing values (2, 3, 5, 30000);
insert into supplier_pricing values (3, 5, 1, 3000);
insert into supplier_pricing values (4, 2, 3, 2500);
insert into supplier_pricing values (5, 4, 1, 1000);
insert into supplier_pricing values(6, 12, 2, 780);
insert into supplier_pricing values(7, 12, 4, 789);
insert into supplier_pricing values(8, 3, 1, 31000);
insert into supplier_pricing values(9, 1, 5, 1450);
insert into supplier_pricing values(10, 4, 2, 999);
insert into supplier_pricing values(11, 7, 3, 549);
insert into supplier_pricing values(12, 7, 4, 529);
insert into supplier_pricing values(13, 6, 2, 105);
insert into supplier_pricing values(14, 6, 1, 99);
insert into supplier_pricing values(15, 2, 5, 2999);
insert into supplier_pricing values(16, 5, 2, 2999);

insert into ordertable values (101, 1500, '2021-10-06', 2, 1);
insert into ordertable values (102, 1000, '2021-10-12', 3, 5);
insert into ordertable values (103, 30000, '2021-09-16', 5, 2);
insert into ordertable values (104, 1500, '2021-10-05', 1, 1);
insert into ordertable values (105, 3000, '2021-08-16', 4, 3);
insert into ordertable values (106, 1450, '2021-08-18', 1, 9);
insert into ordertable values (107, 789, '2021-09-01', 3, 7);
insert into ordertable values (108, 780, '2021-09-07', 5, 6);
insert into ordertable values (109, 3000, '2021-00-10', 5, 3);
insert into ordertable values (110, 2500, '2021-09-10', 2, 4);
insert into ordertable values (111, 1000, '2021-09-15', 4, 5);
insert into ordertable values (112, 789, '2021-09-16', 4, 7);
insert into ordertable values (113, 31000, '2021-09-16', 1, 8);
insert into ordertable values (114, 1000, '2021-09-16', 3, 5);
insert into ordertable values (115, 3000, '2021-09-16', 5, 3);
insert into ordertable values (116, 99, '2021-09-17', 2, 14);

insert into rating values (1, 101, 4);
insert into rating values (2, 102, 3);
insert into rating values (3, 103, 1);
insert into rating values (4, 104, 2);
insert into rating values (5, 105, 4);
insert into rating values (6, 106, 3);
insert into rating values (7, 107, 4);
insert into rating values (8, 108, 4);
insert into rating values (9, 109, 3);
insert into rating values (10, 110, 5);
insert into rating values (11, 111, 3);
insert into rating values (12, 112, 4);
insert into rating values (13, 113, 2);
insert into rating values (14, 114, 1);
insert into rating values (15, 115, 1);
insert into rating values (16, 116, 0);

-- 3 -- 
SELECT 
    COUNT(cus_gender) AS no_of_customers, cus_gender
FROM
    (SELECT 
        ord_amount, cus_id, cus_gender, cus_name
    FROM
        (SELECT 
        ordertable.*, cus_gender, cus_name
    FROM
        customer, ordertable
    WHERE
        ordertable.cus_id = customer.cus_id
    HAVING ord_amount >= 3000) AS table1
    GROUP BY cus_id) AS table2
GROUP BY cus_gender;

-- 4 --
SELECT 
    ord_id, ord_amount, ord_date, product.pro_id, pro_name
FROM
    ordertable,
    product,
    supplier_pricing
WHERE
    ordertable.pricing_id = supplier_pricing.pricing_id
        AND supplier_pricing.pro_id = product.pro_id
        AND ordertable.cus_id = 2;

-- 5 -- 
SELECT 
    supplier.*,
    COUNT(supplier_pricing.supp_id) AS no_of_products
FROM
    supplier_pricing,
    supplier
WHERE
    supplier_pricing.supp_id = supplier.supp_id
GROUP BY supp_id
HAVING COUNT(supplier_pricing.supp_id) > 1;

-- 6 -- 
SELECT 
    category.cat_id, cat_name, pro_name, MIN(supp_price)
FROM
    category,
    product,
    supplier_pricing
WHERE
    supplier_pricing.pro_id = product.pro_id
        AND product.cat_id = category.cat_id
GROUP BY cat_id;

-- 7 --
SELECT 
    product.pro_id, pro_name
FROM
    product,
    ordertable,
    supplier_pricing
WHERE
    ordertable.pricing_id = supplier_pricing.pricing_id
        AND supplier_pricing.pro_id = product.pro_id
        AND ord_date > '2021-10-05';

-- 8 -- 
SELECT 
    cus_name, cus_gender
FROM
    customer
WHERE
    cus_name LIKE 'a%' OR cus_name LIKE '%a';

-- 9 --
DELIMITER //
CREATE PROCEDURE type_of_service()
BEGIN
SELECT 
    supplier.supp_id,
    supp_name,
    rat_ratstars,
    CASE
        WHEN rat_ratstars = 5 THEN 'Excellent Service'
        WHEN rat_ratstars >= 4 THEN 'Good Service'
        WHEN rat_ratstars >= 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END AS type_of_service
FROM
    supplier,
    rating,
    ordertable,
    supplier_pricing
WHERE
    rating.ord_id = ordertable.ord_id
        AND ordertable.pricing_id = supplier_pricing.pricing_id
        AND supplier_pricing.supp_id = supplier.supp_id
ORDER BY rat_ratstars DESC;
END //

DELIMITER ;

CALL e_commerce.type_of_service();