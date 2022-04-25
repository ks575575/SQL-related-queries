
-- 1. create a database called 'assignment' (Note please do the assignment tasks in this database)--
-- 2. Create the tables from ConsolidatedTables.sql and enter the records as specified in it.--

drop table if exists movies;
create table movies (id integer, title varchar(50), category varchar(25));

drop table if exists customers;
insert into movies values(1,	"ASSASSIN'S CREED: EMBERS",	'Animations'),
(2,	'Real Steel',	'Animations'),
(3,	'Alvin and the Chipmunks',	'Animations'),
(4,	'The Adventures of Tin Tin',	'Animations'),
(5,	'Safe', 	'Action'),
(6,	'Safe House',	'Action'),
(7,	'GIA',	'18+'),
(8,	'Deadline 2009',	'18+'),
(9,	'The Dirty Picture',	'18+'),
(10,	'Marley and me',	'Romance');
select * from movies;

-- 3. Create a table called countries with the following columns
-- name, population, capital    
-- choose appropriate datatypes for the columns
create table countries (
name varchar(300), population int, capital varchar(300));

-- a) Insert the following data into the table
-- China 			1382	 	Beijing
-- India			1326	 	Delhi
-- United States		324	 	Washington D.C.
-- Indonesia		260	 	Jakarta
-- Brazil			209	 	Brasilia
-- Pakistan		193	 	Islamabad
-- Nigeria			187	 	Abuja
-- Bangladesh		163	 	Dhaka
-- Russia			143	 	Moscow
-- Mexico			128	 	Mexico City
-- Japan			126	 	Tokyo
-- Philippines		102	 	Manila
-- Ethiopia		101	 	Addis Ababa
-- Vietnam 		94	 	Hanoi
-- Egypt			93	 	Cairo
-- Germany		81	 	Berlin
-- Iran			80	 	Tehran
-- Turkey			79	 	Ankara
-- Congo			79	 	Kinshasa
-- France			64	 	Paris
-- United Kingdom	65	 	London
-- Italy			60	 	Rome
-- South Africa		55	 	Pretoria
-- Myanmar		54	 	Naypyidaw

insert into countries values('China',1382,'Beijing'),
('India',1326,'Delhi'),
('United States',324,'Washington D.C.'),
('Indonesia',260,'Jakarta'),
('Brazil',209,'Brasilia'),
(' Pakistan',193,'Islamabad'),
('Nigeria',187,'Abuja'),
('Bangladesh',163,'Dhaka'),
('Russia',143,'Moscow'),
('Mexico',128,'Mexico City'),
('Japan',126,'Tokyo'),
('Philippines',102,'Manila'),
('Ethiopia',101,'Addis Ababa'),
('Vietnam' ,94,	'Hanoi'),
('Egypt',93,'Cairo'),
 ('Germany',81,	'Berlin'),
('Iran',80,	'Tehran'),
('Turkey',79,'Ankara'),
('Congo',79	,'Kinshasa'),
('France',64,'Paris'),
('United Kingdom',65,'London'),
('Italy',60,'Rome'),
('South Africa',55,'Pretoria'),
('Myanmar',54,'Naypyidaw')
;
select * from countries;
-- b) Add a couple of countries of your choice
insert into countries values ('Kuwait',2989,'Kuwait city'),
('south Korea',1908,'Seoul'),
('bangladesh',1234,'dhaka');

-- c) Change ‘Delhi' to ‘New Delhi'

set sql_safe_updates =0;
update countries 
set capital ='New Delhi'
where name ='India';
select * from countries;

-- 4. Rename the table countries to big_countries .
alter table countries rename big_countries;
select * from big_countries;

-- 5. Create the following tables. Use auto increment wherever applicable

-- a. Product
-- product_id - primary key autoincrement
-- product_name - cannot be null and only unique values are allowed
-- description
-- supplier_id - foreign key of supplier table

create table Product(product_id int PRIMARY KEY auto_increment  ,product_name varchar(300) UNIQUE NOT NULL   , 
description varchar(900),supplier_id int, foreign key(supplier_id) REFERENCES Suppliers (supplier_id));
select * from product;


-- b. Suppliers
-- supplier_id - primary key
-- supplier_name
-- location

create table suppliers(supplier_id int primary key auto_increment, supplier_name varchar(300),location varchar(500));

select * from suppliers;

-- c. Stock
-- id - primary key
-- product_id - foreign key of product table
-- balance_stock

create table stock( balance_stockproduct_id int primary key auto_increment,product_id int
,foreign key(product_id) references product(product_id),balance_stock int);

select * from stock;

-- 6. Enter some records into the three tables.

-- in product table-- 

insert into product values(1,'hair straightener','to straighten hair',1);
insert into product (product_name,description,supplier_id)values('curler','to curl hair',2),
('toothbrush','to get crystal clear teeth',3);
insert into product (product_id,product_name,description,supplier_id)values(4,'knife','to cut anything',4)
,(5,'earpods','to listen',5);
insert into product values(6,'EYELASHER',6,'LASHES');

-- in suppliers table--

insert into suppliers values(1,'Rajkumar','Gurgaon');
insert into suppliers(supplier_name,location) values('Kirtana','Delhi'),('Vrijesh','Motinagar'),
('tina','Rajasthan'),('Russel','daman');
insert into suppliers values(5,'Rajkumar','Gurgaon');
insert into suppliers values(6,'HUIIKK','GurgOHJHon');

-- in stock table--

insert into stock values(1,1,1000);
insert into stock values(2,1,2000),(3,2,3000),(4,3,5000),(5,4,7000);

-- 7. Modify the supplier table to make supplier name unique and not null.

alter table suppliers modify column supplier_name  VARCHAR(300) NOT NULL UNIQUE;

-- 8. Modify the emp table as follows
create table emp(empname varchar(300));

-- a.	Add a column called deptno 
ALTER TABLE emp add column deptno int ;
alter table emp add column emp_id int;
select* from emp;
insert into emp values('Ramesh',10,1),
('Suresh',20,2),
('Naresh',30,3),
('Vijesh',40,4),
('yogesh',50,5);
insert into emp values
('hitesh',60,6),('ranjit',70,7);
insert into emp values('yofr',100,10);

-- b. Set the value of deptno in the following order

-- deptno = 20 where emp_id is divisible by 2
-- deptno = 30 where emp_id is divisible by 3
-- deptno = 40 where emp_id is divisible by 4
-- deptno = 50 where emp_id is divisible by 5
-- deptno = 10 for the remaining records.

SELECT * FROM EMPLOYEES;
select deptno,EMPLOYEEID, case when 'EMPLOYEEID/2' then 20
when 'EMPLOYEEID/3' then  30
when 'EMPLOYEEID/4' then  40
when 'EMPLOYEEID/5' then 50
else 10
end as type
from EMPLOYEE;

-- 9. Create a unique index on the emp_id column.
alter table emp modify column emp_id int primary key ;

alter table emp add column emp_no int,
add column first_name varchar(300),
add column last_name varchar(300), 
add column salary int;
select * from emp;
SELECT * FROM EMPLOYEES; 
SELECT @@SQL_MODE,@@GLOBAL.SQL_MODE;
insert into emp VALUES ('RAMESH',10,33,45,'rajan','shiv',30000),
('SUREA',29,26,22,'sajan','niv',25000),('MANJAN',24,78,37,'manjn','sharma',20000),('sHIVJI',27,49,46,'shiv','paraksh',25005),
('dGUJ',50,56,57,'Chirag','thakur',40000);
SET GLOBAL SQL_MODE='NO_ENGINE_SUBSTITUTION';

-- 10. Create a view called emp_sal on the emp table by selecting the following fields in the order of highest salary to the lowest salary.

-- emp_no, first_name, last_name, salary
CREATE VIEW `emp_sal` AS
select emp_no,first_name,last_name,salary
from emp;
SELECT emp_no,first_name,last_name,salary
from emp 
order by salary desc;