-- 1. select all employees in department 10 whose salary is greater than 3000. [table: employee]
SELECT EMPLOYEEID,DEPTNO,SALARY
FROM EMPLOYEE
WHERE SALARY>3000
HAVING DEPTNO =10;
select * FROM EMPLOYEE;

-- 2. The grading of students based on the marks they have obtained is done as follows:

-- 40 to 50 -> Second Class
-- 50 to 60 -> First Class
-- 60 to 80 -> First Class
-- 80 to 100 -> Distinctions
CREATE TABLE STUDENT(STUD_ID INT PRIMARY KEY AUTO_INCREMENT,MARKS INT );
SELECT * FROM STUDENT;
INSERT INTO STUDENT(MARKS)VALUES(40),(45),(50),(55),(60),(65),(70),(75),(80),(85),(90),(95),(100),(40),(40),(40),(40),
(40),(40),(40),(40),(55),(60),(65),(70),(75),(80),(85),(90),(95),(100),(55),(60),(65),(70),(75),(80),(85),(90),
(95),(55),(60),(65),(70),(75),(80),(85),(90),(95);
SELECT STUD_ID,MARKS,IF(MARKS between 40 and 50 ,'second class',if(marks between 50 and 60,'first class',
if(marks between 60 and 80,'first class',if(marks between 80 and 100,'Distinctions','fail')))) as Grade
FROM STUDENT;
select * from student;
-- a. How many students have graduated with first class?
select count(*) as 'number of students with first class' from student
where marks  between 40 and 50;

-- b. How many students have obtained distinction? [table: students]
select count(*) as 'number of students with distinctions' from student
where marks between 80 and 100;


-- 3. Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station]
create table station (ID int primary key auto_increment,cityname varchar(300));
insert into station values(1,'Chennai'),(2,'Bengaluru'),(3,'Patna'),(4,'Hyderabad'),(5,'Kolkata'),(6,'Mumbai'),(7,'Delhi'),(8,'Aurangabad'),(9,'Paris'),
(10,'Pune'),(11,'Thane'),(12,'salem'),(13,'Thiruvananthpuram'),(14,'San Francisco'),(15,'Jaipur'),(16,'Lucknow'),(17,'Baroda'),(18,'Alexandria'),(19,'Amsterdam'),
(20,'Austin'),(21,'Boston'),(22,'Xinjiang'),(23,'Kochi'),(24,'Austin'),(25,'Austin');
insert into station(cityname)values('Agra'),('Bilaspur'),('Moscow'),('Los angeles');
insert into station(cityname)values('Imara'),('Edmonton'),('Ottawa'),('Oklahoma'),('Lima'),('Oxford'),('Ufa'),('Uslan'),('Urumqi'),('Ujjain'),('Odisha');
select * from station;

select   DISTINCT cityname, ID from station 
where id%2=0;

-- 4. Find the difference between the total number of city entries in the table and the number of distinct city entries in the table. In other words, if N is the number of city entries in station, and N1 is the number of distinct city names in station, 
-- write a query to find the value of N-N1 from station.[table: station]
select (count(cityname)  - count(DISTINCT cityname)) as difference from station;

-- 5. Answer the following
-- a. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
SELECT DISTINCT CITYNAME from station WHERE CITYNAME regexp '^[aeiou]';

-- Your result cannot contain duplicates. [Hint: Use RIGHT() / LEFT() methods ]

-- b. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
SELECT CITYNAME FROM STATION WHERE LEFT(CITYNAME,1)IN('a','e','i','o','u') and
right(cityname,1) IN ('a','e','i','o','u');
-- c. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
select cityname 
From station;

-- d. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates. [table: station]

select DISTINCT cityname from station  where
cityname not regexp '^[AEIOU]|[aeiou]$';



-- 6. Write a query that prints a list of employee names having a salary greater than $2000 per month who have been employed for less than 36 months. Sort your result by descending order of salary. [table: emp]
select  concat(first,' ',last) as EmpFullName,hiredate ,salary,adddate(hiredate,interval 3 year ) as EmployedMonths from employees where salary>2000;
-- 7. How much money does the company spend every month on salaries for each department? [table: employee]

select * from(                            -- derived table maxdepartmnt--
select 
department,Salary
,salary as msalary
,concat(first,' ',last) as 'full name'
from employees 
group by department) as mdepartment inner join employees e  on Mdepartment.department=e.department
and mdepartment.msalary=e.salary;






-- 8. How many cities in the CITY table have a Population larger than 100000. [table: city]
create table city(cityname varchar(300),country varchar(300),disttno int ,population int);
insert into city values('california','United States',435,3245,100),('los angeles','United States',435,10000,200),('Chicago','United States',435,10000,100),
('Boston','United States',435,100,100),('New York','United States',435,30000,600),('San Diego','United States',435,5998,700),('San Antonio','United States',435,20000,800)
,('Dallas','United States',435,3290,900),('Atlanta','United States',435,50000,600),('Phoenix','United States',435,3000,600),('Indianapolis','United States',435,3200,600),
('Denver','United States',435,3200,700),('Seattle','United States',435,30000,400),('Salem','United States',435,3200,400),('New Orleans','United States',435,3200,320)
,('Las Vegas','United States',435,102,567),('Sacramento','United States',435,100,5678);

select * from city;
-- 9. What is the total population of California? [table: city]
select totalpopulation from city where cityname ='California';
-- 10. What is the average population of the districts in each country? [table: city]
select COUNTRY, avg(disttpopulation) from city;



select * from city;


-- 11. Find the ordernumber, status, customernumber, customername and comments for all orders that are ‘Disputed=  [table: orders, customers]

select a.ordernumber,a.orderdate,a.order_status,b.customername,b.customernumber,b.comments 
from orders a 
inner join customers b on a.customernumber=b.customernumber
;




