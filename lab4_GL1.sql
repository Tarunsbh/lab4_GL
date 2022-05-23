create database lab4_GL1;

use lab4_GL1;

create table suplier (supp_id int primary key, supp_name varchar(50) NOT null, supp_city varchar(50) NOT null, supp_phone varchar(50) NOT null);
create table customer(cus_id int primary key, cus_name varchar(20) NOT null, cus_phone varchar(50) NOT null, cus_city varchar(30) NOT null, cus_gender char);
create table category (cat_id int primary key, cat_name varchar(20) NOT null);
create table product (pro_id int primary key, pro_name varchar(20) NOT null default "Dummy", pro_desc varchar(60), cat_id int, foreign key (cat_id) references category (cat_id));
create table supplier_pricing ( pricing_id int primary key, pro_id int, foreign key (pro_id) references product (pro_id), supp_id int, foreign key (supp_id) references suplier (supp_id), supp_price int DEFAULT 0);
create table orders (ord_id int primary key, ord_amount int NOT null, ord_date DATE NOT null, cus_id int, foreign key (cus_id) references customer (cus_id), pricing_id int, foreign key (pricing_id) references supplier_pricing(pricing_id));
create table rating (rat_id int primary key, ord_id int,  foreign key (ord_id) references orders (ord_id), rat_ratstars INT NOT null);
 
insert into suplier values(1,"Rajesh Retails", "Delhi", 1234567890);
insert into suplier values(2,"Appario Ltd.", "Mumbai", 2589631470);
insert into suplier values(3,"Knome products", "Mumbai", 9785462315 );
insert into suplier values(4,"Bansal Retails", "Kochi", 8975463285);
insert into suplier values(5," Mittal Ltd.", "Lucknow", 7898456532);

insert into customer values(1,"Aakash", 9999999999, "Delhi", "M");
insert into customer values(2, "Aman", 9785463214, "Noida", "M");
insert into customer values(3, "Neha", 9999999999, "Mumbai", "F");
insert into customer values(4, "Megha", 6951423202,"Kolkata", "F");
insert into customer values(5, "Pulkit", 4551236525,"Lucknow", "M");

insert into category values(1,"Books");
insert into category values(2,"Games");
insert into category values(3,"Groceries");
insert into category values(4,"Electronics");
insert into category values(5,"Clothes");

insert into product values(1,"GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2);
insert into product values(2,"TSHIRT", "SIZE-L with Black, Blue and White variations", 5);
insert into product values(3, "ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4);
insert into product values(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500); 
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000); 
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000); 
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000); 
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780); 
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789); 
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000); 
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450); 
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999); 
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549); 
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529); 
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105); 
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99); 
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999); 
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

INSERT INTO orders VALUES (101,1500,"2021-10-06",2,1); 
INSERT INTO orders VALUES(102,1000,"2021-10-12",3,5); 
INSERT INTO orders VALUES(103,30000,"2021-09-16",5,2); 
INSERT INTO orders VALUES(104,1500,"2021-10-05",1,1); 
INSERT INTO orders VALUES(105,3000,"2021-08-16",4,3); 
INSERT INTO orders VALUES(106,1450,"2021-08-18",1,9); 
INSERT INTO orders VALUES(107,789,"2021-09-01",3,7); 
INSERT INTO orders VALUES(108,780,"2021-09-07",5,6); 
INSERT INTO orders VALUES(109,3000,"2021-0-10",5,3); 
INSERT INTO orders VALUES(110,2500,"2021-09-10",2,4); 
INSERT INTO orders VALUES(111,1000,"2021-09-15",4,5); 
INSERT INTO orders VALUES(112,789,"2021-09-16",4,7); 
INSERT INTO orders VALUES(113,31000,"2021-09-16",1,8); 
INSERT INTO orders VALUES(114,1000,"2021-09-16",3,5); 
INSERT INTO orders VALUES(115,3000,"2021-09-16",5,3); 
INSERT INTO orders VALUES(116,99,"2021-09-17",2,14);

INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5); 
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,2);




-- Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
select count(customer.cus_gender) from customer join orders on customer.cus_id = orders.cus_id and ord_amount >= 3000 group by customer.cus_gender;

-- Display all the orders along with product name ordered by a customer having Customer_Id=2

select pro.pro_name,o.ord_amount,o.ord_date
from orders o
join supplier_pricing sp
on o.pricing_id = sp.pricing_id
join product pro
on sp.pro_id = pro.pro_id
where o.cus_id = 2;


-- Display the Supplier details who can supply more than one product.
select * from suplier where supp_id in (select supp_id from supplier_pricing group by (supp_id) having count(supp_id)>1);


-- Find the least expensive product from each category and print the table with category id, name, product name and price of the product
select cat.cat_id,min(t2.supp_price) as price from category cat inner join
(select * from product p inner join (select pro_id as id, supp_price from supplier_pricing group by (id) having min(supp_price)) as t1 on t1.id=p.pro_id)
as t2 on t2.cat_id=cat.cat_id group by cat.cat_id;

-- Display the Id and Name of the Product ordered after “2021-10-05”.
select * from orders where ord_date > '2021-10-05';



-- Display customer name and gender whose names start or end with character 'A'.
select cus_name from customer where cus_name like 'a%' or cus_name like 'a%';


-- Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”
delimiter &&
create procedure proc()
begin
select report.supp_id,report.supp_name,report.average,
case
when report.average = 5 then 'Excellent Service'
when report.average > 4 then 'Good Service'
when report.average > 2  then 'Average Service'
else "Poor Service"
end as type_of_service from
(select final.supp_id, suplier.supp_name, final.average from
(select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as average from
(select supplier_pricing.supp_id, test.ord_id, test.rat_ratstars from supplier_pricing inner join
(select orders.pricing_id, rating.ord_id, rating.rat_ratstars
from orders inner join rating on rating .ord_id=orders.ord_id
) as test on test.pricing_id = supplier_pricing.pricing_id)
as test2 group by supplier_pricing.supp_id)
as final inner join suplier where final.supp_id = suplier.supp_id) as report;
END &&
delimiter ;

call proc();