-- QUERY 1 & Query 2 - Creating a database and relevant tables namely - supplier, customer, category, product, supplier_pricing, order and rating. Then populating these with given data according to E-commerce Schema definitions.


-- Query 1 - Creating Database E- Commerce and Relevant Tables. 
create database if not exists e_commerce;

use e_commerce;

CREATE TABLE IF NOT EXISTS supplier (
    SUPP_ID INT NOT NULL PRIMARY KEY,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50) NOT NULL,
    SUPP_PHONE VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS customer (
    CUS_ID INT NOT NULL PRIMARY KEY,
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    CUS_GENDER CHAR
);

CREATE TABLE IF NOT EXISTS category (
    cat_id INT PRIMARY KEY,
    cat_name VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS product (
    PRO_ID INT NOT NULL PRIMARY KEY,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    PRO_DESC VARCHAR(60),
    CAT_ID INT,
    FOREIGN KEY (CAT_ID)
        REFERENCES category (CAT_ID)
);

CREATE TABLE IF NOT EXISTS supplier_pricing (
    PRICING_ID INT NOT NULL PRIMARY KEY,
    PRO_ID INT NOT NULL,
    SUPP_ID INT NOT NULL,
    SUPP_PRICE INT DEFAULT 0,
    FOREIGN KEY (PRO_ID)
        REFERENCES product (PRO_ID),
    FOREIGN KEY (SUPP_ID)
        REFERENCES supplier (SUPP_ID)
);

CREATE TABLE IF NOT EXISTS `order`(
    ORD_ID INT NOT NULL PRIMARY KEY,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT,
    PRICING_ID INT,
    FOREIGN KEY (CUS_ID)
        REFERENCES customer (CUS_ID),
    FOREIGN KEY (PRICING_ID)
        REFERENCES supplier_pricing (PRICING_ID)
);

CREATE TABLE IF NOT EXISTS rating (
    RAT_ID INT NOT NULL PRIMARY KEY,
    ORD_ID INT NOT NULL,
    RAT_RATSTARS INT NOT NULL,
    FOREIGN KEY (ORD_ID)
        REFERENCES `order` (ORD_ID)
);


-- Query 2 - Populating the created tables with the data as specified

-- Populating the table - Supplier
insert into supplier values(1, "Rajesh Retails", "Delhi", "1234567890");
insert into supplier values(2, "Appario Ltd.", "Mumbai", "2589631470");
insert into supplier values(3, "Knome products", "Banglore", "9785462315");
insert into supplier values(4, "Bansal Retails", "Kochi", "8975463285");
insert into supplier values(5, "Mittal Ltd.", "Lucknow", "7898456532");

-- Populating the table - Customer
insert into customer values(1, "AAKASH", "9999999999", "DELHI", 'M');
insert into customer values(2, "AMAN", "9785463215", "NOIDA", 'M');
insert into customer values(3, "NEHA", "9999999999", "MUMBAI", 'F');
insert into customer values(4, "MEGHA", "9994562399", "KOLKATA", 'F');
insert into customer values(5, "PULKIT", "7895999999", "LUCKNOW", 'M');

-- Populating the table - Category
insert into category values(1, "BOOKS");
insert into category values(2, "GAMES");
insert into category values(3, "GROCERIES");
insert into category values(4, "ELECTRONICS");
insert into category values(5, "CLOTHES");

-- Populating the table - Product
insert into product values(1, "GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2);
insert into product values(2, "TSHIRT", "SIZE-L with Black, Blue and White variations", 5);
insert into product values(3, "ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4);
insert into product values(4, "OATS", "Highly Nutritious from Nestle", 3);
insert into product values(5, "HARRY POTTER", "Best Collection of all time by J.K Rowling", 1);
insert into product values(6, "MILK", "1L Toned MIlk", 3);
insert into product values(7, "Boat Earphones", "1.5Meter long Dolby Atmos", 4);
insert into product values(8, "Jeans", "Stretchable Denim Jeans with various sizes and color", 5);
insert into product values(9, "Project IGI", "compatible with windows 7 and above", 2);
insert into product values(10, "Hoodie", "Black GUCCI for 13 yrs and above", 5);
insert into product values(11, "Rich Dad Poor Dad", "Written by RObert Kiyosaki", 1);
insert into product values(12, "Train Your Brain", "By Shireen Stephen", 1);

-- Populating the table - Supplier_Pricing
insert into supplier_pricing values(1,1,2,1500);
insert into supplier_pricing values(2,3,5,30000);
insert into supplier_pricing values(3,5,1,3000);
insert into supplier_pricing values(4,2,3,2500);
insert into supplier_pricing values(5,4,1,1000);
insert into supplier_pricing values(6,12,2,780);
insert into supplier_pricing values(7,12,4,789);
insert into supplier_pricing values(8,3,1,31000);
insert into supplier_pricing values(9,1,5,1450);
insert into supplier_pricing values(10,4,2,999);
insert into supplier_pricing values(11,7,3,549);
insert into supplier_pricing values(12,7,4,529);
insert into supplier_pricing values(13,6,2,105);
insert into supplier_pricing values(14,6,1,99);
insert into supplier_pricing values(15,2,5,2999);
insert into supplier_pricing values(16,5,2,2999);


-- Populating the table - Order
insert into `order` values(101, 1500, '2021-10-06', 2, 1);
insert into `order` values(102, 1000, '2021-10-12', 3, 5);
insert into `order` values(103, 30000, '2021-09-16', 5, 2);
insert into `order` values(104, 1500, '2021-10-05', 1, 1);
insert into `order` values(105, 3000, '2021-08-16', 4, 3);
insert into `order` values(106, 1450, '2021-08-18', 1, 9);
insert into `order` values(107, 789, '2021-09-01', 3, 7);
insert into `order` values(108, 780, '2021-09-07', 5, 6);
insert into `order` values(109, 3000, '2021-01-10', 5, 3); -- Tuple with OrderID 109 has an altered date 2021-01-10 from the bad date inout 2021-00-10.
insert into `order` values(110, 2500, '2021-09-10', 2, 4);
insert into `order` values(111, 1000, '2021-09-15', 4, 5);
insert into `order` values(112, 789, '2021-09-16', 4, 7);
insert into `order` values(113, 31000, '2021-09-16', 1, 8);
insert into `order` values(114, 1000, '2021-09-16', 3, 5);
insert into `order` values(115, 3000, '2021-09-16', 5, 3);
insert into `order` values(116, 99, '2021-09-17', 2, 14);

-- Populating the table - Rating 
insert into rating values(1,101,4);
insert into rating values(2,102,3);
insert into rating values(3,103,1);
insert into rating values(4,104,2);
insert into rating values(5,105,4);
insert into rating values(6,106,3);
insert into rating values(7,107,4);
insert into rating values(8,108,4);
insert into rating values(9,109,3);
insert into rating values(10,110,5);
insert into rating values(11,111,3);
insert into rating values(12,112,4);
insert into rating values(13,113,2);
insert into rating values(14,114,1);
insert into rating values(15,115,1);
insert into rating values(16,116,0);

-- Query 3 - Display COUNT of Customers By Gender who have placed order atleast 3000 
SELECT Gender, COUNT(gender) as Total_Customers FROM 
(SELECT customer.cus_id, customer.cus_gender AS Gender,amount.total_amount FROM customer RIGHT JOIN
(SELECT cus_id, total_amount FROM
(SELECT cus_id, SUM(ord_amount) AS total_amount FROM `order` GROUP BY cus_id) c
WHERE c.total_amount >= 3000) AS amount ON (amount.cus_id = customer.cus_id)) as final_table
GROUP BY Gender;

-- Query 4 - Display all the orders along with product name ordered by a customer having Customer_Id=2

select `order`.*, product.pro_name AS PRODUCT from `order`, supplier_pricing, product 
where 
	`order`.PRICING_ID = supplier_pricing.pricing_id and
    supplier_pricing.pro_id  = product.pro_id and
    `order`.cus_id = 2;
    
 -- Query 5 - Supplier and their details when they deliver more than one product.
 
 SELECT supplier.*, count.Total_Products FROM supplier 
    RIGHT JOIN (SELECT supp_id, COUNT(supp_id) AS Total_products FROM supplier_pricing GROUP BY supp_id) 
    AS count ON (count.supp_id = supplier.supp_id) WHERE count.Total_products > 1;
    
-- Query 6 - The least expensive product from each category and populate the table with category id, name, product name and price of the product and displau
select PSP.*, c.cat_name from category c 
inner join(select p.pro_id, p.pro_name, p.cat_id, SP.MinProductPrice from product p 
inner join(select pro_id, min(supp_price) as MinProductPrice from supplier_pricing group by pro_id) as SP
where SP.pro_id = p.pro_id)as PSP where PSP.CAT_ID = c.cat_id;

-- Query 7 - Display the Id and Name of the Product ordered after “2021-10-05”.

select P.PRO_ID AS PRODUCTID, P.PRO_NAME AS PRODUCT from `order` as O, supplier_pricing as SP, product as P
	where O.pricing_id = SP.PRICING_ID AND
    SP.pro_id = P.pro_id AND
    O.ORD_DATE > "2021-10-05";
    
-- Query 8 - Customer names and gender that start or end with character 'A'.

SELECT cus_name as Customer_Name, cus_gender as Gender FROM customer 
WHERE cus_name LIKE 'A%' OR cus_name LIKE '%A';
    
-- Q9 - Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.

use e_commerce;

select `order`.ORD_ID, `order`.PRICING_ID, rating.RAT_RATSTARS from `order` inner join rating where `order`.ORD_ID=rating.ORD_ID;
select `order`.PRICING_ID, avg(rating.RAT_RATSTARS) as rating, 

case 
when avg(rating.RAT_RATSTARS)=5 then 'Excellent Service'
when avg(rating.RAT_RATSTARS)>4 then 'Good Service'
when avg(rating.RAT_RATSTARS)>2 then 'Average Service'
else 'Poor Service' end as Type_of_Service from `order` 
inner join rating where `order`.ORD_ID=rating.ORD_ID group by `order`.PRICING_ID;

--

select Y.Final_ID, Y. Final_Supp_Name, Y.FinalAverage,

case 
when Y.FinalAverage=5 then 'Excellent Service'
when Y.FinalAverage>4 then 'Good Service'
when Y.FinalAverage>2 then 'Average Service'
else 'Poor Service' 
end 
as Type_of_Service from 
( select S.supp_id as Final_ID, supp_name as Final_Supp_Name, X.SupplierAverage as FinalAverage from SUPPLIER as S inner join
( select ORD_RAT_SP.SUPPLIER_ID,  avg(ORD_RAT_SP.RATING_STARS) as SupplierAverage FROM
( select SP.supp_id as SUPPLIER_ID,  ORD_RAT.ORD_ID, ORD_RAT.RAT_ID, ORD_RAT.rat_ratstars as RATING_STARS from supplier_pricing as SP inner join
( select O.ORD_ID, O.pricing_id, R.RAT_ID, R.RAT_RATSTARS from `order` O inner join rating R ON
O.ord_id = R.ord_id) as ORD_RAT on ORD_RAT.pricing_id = SP.pricing_id) as ORD_RAT_SP group by ORD_RAT_SP.SUPPLIER_ID) as X on X.supplier_id = S.supp_Id)
as Y;