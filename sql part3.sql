-- 1. Write a stored procedure that accepts the month and year as inputs and prints the ordernumber, 
-- orderdate and status of the orders placed in that month. 
call my_proc(2018,5);


-- 2. Write a stored procedure to insert a record into the cancellations table for all cancelled orders.
call orderstat(5,5,1005,'payment initiated','transaction started');
select * from cancellations;
-- STEPS: 

-- a.	Create a table called cancellations with the following fields

-- id (primary key), 
 	-- customernumber (foreign key - Table customers), 
-- ordernumber (foreign key - Table Orders), 
-- comments
create table cancellations (id int unique  primary key,customernumber int,ordernumber int,
foreign key(customernumber)references customers(customernumber),foreign key(ordernumber ) references orders(ordernumber),comments varchar(300)
)
select * from cancellations;
alter table cancellations add column orderstatus varchar(300);

-- All values except id should be taken from the order table.

-- b. Read through the orders table . If an order is cancelled, then put an entry in the cancellations table.

-- 3. a. Write function that takes the customernumber as input and returns the purchase_status based on the following criteria . [table:Payments]
create table payments(purchase_status varchar(200),amount numeric,customernumber int,foreign key(customernumber) references customers(customernumber));
select * from payment;


-- if the total purchase amount for the customer is < 25000 status = Silver, amount between 25000 and 50000, status = Gold
-- if amount > 50000 Platinum.

select 1 as customernumber,pur_status(1) as purchase_status;
select 3 as customernumber,pur_status(3) as purchase_status;

-- b. Write a query that displays customerNumber, customername and purchase_status from customers table.
select c.customernumber,c.customername,p.purchase_status from customers c inner join payment p on c.customernumber=p.customernumber;



-- 4. Replicate the functionality of 'on delete cascade' and 'on update cascade' using triggers on movies and rentals tables. Note: Both tables - movies and rentals - don't have primary or foreign keys. Use only triggers to implement the above.

-- 5. Select the first name of the employee who gets the third highest salary. [table: employee]
select first, salary from employees order by salary desc limit 1 offset 2 ;

-- 6. Assign a rank to each employee  based on their salary. The person having the highest salary has rank 1. [table: employee]

select employeeID,salary ,rank() over(order by salary desc) salary_rank
from employee;
