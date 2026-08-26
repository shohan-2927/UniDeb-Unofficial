-- ADNANE:  SHIP_SCHEMA_PAPERS WITH NO SOLUTIONS + FUNCTIONS NEEDED

 ALL FUNCTIONS NEEDED FOR THE EXAM (FROM ANNA)
SELECT column_name(s)
FROM table_name
[WHERE condition]
[GROUP BY column_name(s)]
[HAVING condition]
[ORDER BY column_name(s)];

concatenation ||

desc, asc, nulls last, nulls first

conditions in WHERE clause:
	<, >, =, <>, !=
	between X and y
	in, not in
	is null, is not null

The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

There are two wildcards often used in conjunction with the LIKE operator:
     The percent sign (%) represents zero, one, or multiple characters
     The underscore sign (_) represents one, single character
 LIKE 
 AND
 OR

Functions:
--  round()      -- trunc()            -- substr()    	    -- instr()	-- length()    
--  to_char()    -- to_date()          --month_between()    -- extract(... from ...)   
--  lower()      -- upper()            -- replace()    	    -- nvl()
--  max()        -- min()      -- count()     -- avg()      --	sum()
-- sysdate   current system date and time


yyyy - year 	hh24 - hour
mm - month	mi - minute
dd - day 	ss - second


day, Day, DAY, dy, Dy, DY
month, Month, MONTH, mon, Mon, MON


 subquery ! 

 The different set operators are:
	UNION
	UNION ALL
	MINUS
	INTERSECT

 ROWNUM	

 INNER JOIN
 LEFT OUTER JOIN
 RIGHT OUTER JOIN 
 FULL OUTER JOIN

 FETCH FIRST n ROWS ONLY
 FETCH FIRST n ROWS WITH TIES // USE THIS IF YOU STUDY WITH PANOVICS.
 OFFSET n ROWS FETCH NEXT m ROWS WITH TIES


 CREATE TABLE/VIEW 

 ALTER TABLE table_name ADD column_name datatype;

 ALTER TABLE table_name DROP COLUMN column_name;

 ALTER TABLE table_name RENAME COLUMN old_name to new_name;

 ALTER TABLE table_name MODIFY column_name datatype;

 ALTER TABLE table_name DROP PRIMARY KEY;


 DROP TABLE table_name;

 WHEN THEY ASK YOU TO BE CAREFUL WITH referential integrity constraints (Foreign key)
 DROP TABLE table_name CASCADE CONSTRAINTS;

 INSERT INTO table_name (column1, column2, column3, ...)
 VALUES (value1, value2, value3, ...);

 INSERT INTO table_name
 VALUES (value1, value2, value3, ...);

 UPDATE table_name
 SET column1 = value1, column2 = value2, ...
 WHERE condition;

 DELETE 
 FROM table_name 
 WHERE condition;

 CREATE VIEW view_name AS
 SELECT column1, column2, ...
 FROM table_name
 WHERE condition;

 grant privilege_name on object_name to {user_name | public | role_name} 

 revoke privilege_name on object_name from {user_name | public | role_name};




PAPER 1 :

-- 1. List in alphabetical order the name of all countries in our database. 
-- Each country name should appear only once in the result. (18)
select distinct country
from ship.sh_country
order by country;

-- 2. List the date, time, and value (shipping fee) of orders that were either placed in the afternoon or 
-- have a value of at least 10 million. Afternoon times are times from noon to midnight, 
-- including noon but not including midnight. Sort the result ascending by the time of order (regardless of the date).
select date_of_order, to_char(date_of_order, 'hh24:mm:ss') as time, shipping_fee
from ship.sh_order
where shipping_fee >= 1000000 or
to_char(date_of_order, 'hh24') >= 12
order by time;


-- 3. List in ascending order the identifier of orders having assigned containers 
-- with a total cargo weight exceeding 1000 tons.
select order_id, sum(cargo_weight)
from ship.sh_assign
group by order_id
having sum(cargo_weight) > 1000
order by order_id;


-- 4. List the identifier and full name of clients who have placed at least one order. 
-- Sort the result by last name and then by first name. Each client should appear only once in the result.
select c_id, first_name || ' ' || last_name as full_name
from ship.sh_client
where c_id in(select distinct client_id from ship.sh_order)
order by last_name, first_name;


-- 5. How many times did the ship named 'Goliat' depart from each port? 
-- You may assume that there is only one ship with that name. Include only those ports that the ship has departed at least once. 
-- Sort the result descending by the number of departures and then ascending by port ID.
select departure_port, count(*)
from ship.sh_ship ship inner join ship.sh_trip trip on ship.sh_id = trip.ship
where sh_name = 'Goliat'
group by departure_port
having count(*) >= 1
order by count(*) desc;



-- 6. List the identifier and name of all ship types, along with the identifier and name of ships of each type. 
-- The column containing the name of ship types should be named 'type_name', and the column containing the name of the 
-- ships should be named 'ship_name'. Ship types with no ships should also be included in the result. 
-- Sort the list by the name of ship type and then by ship name.
select t_id, t_name as type_name , sh_id, sh_name as ship_name
from ship.sh_ship sh right outer join ship.sh_ship_type tp on sh.sh_type = tp.t_id
order by t_name, ship_name;



-- 7. List the identifier of orders with a higher shipping fee than in any of the orders placed in April 2021. 
-- Beside the order ID, print the shipping fee as well.


select o_id, shipping_fee, date_of_order
from ship.sh_order
where shipping_fee > ALL(select shipping_fee from ship.sh_order 
where extract(year from date_of_order) = 2021 and extract(month from date_of_order) = 04);


-- 8. Which three countries had the most orders placed for shipping from their ports? 
-- Beside the country name, print the number of orders for shipping from there as well.
select country, count(*)
from ship.sh_order o inner join ship.sh_port p on o.departure_port = p.p_id
inner join ship.sh_city city on p.city = city.c_id
group by country
order by count(*) desc
fetch first 3 rows only;


-- 9. Create a table named 'sh_staff' storing the personal data of the staff of the ships 
-- and including the following columns (with arbitrary names): identifier (an integer of up to 5 digits; 
-- this is the primary key), last name and first name (both being strings of up to 40 characters), date of birth (date), 
-- email address (a string of up to 200 characters), and the ship whose staff this person belongs to 
-- (a string of up to 10 characters), with a reference to the 'sh_ship' table. The last four items and the ship must not 
-- be unknown. Make the last name, first name, and date of birth a composite key of the table. 
-- Assign a name to each constraint.
create table sh_ship_copy as
select *
from ship.sh_ship;

alter table sh_ship_copy
add constraint sh_ship_pk primary key(sh_id);

create table sh_staff(
staff_id number(5) constraint staff_pk primary key,
last_name varchar2(40) constraint ln_nl not null,
first_name varchar2(40) constraint fn_nl not null,
date_of_birth date constraint dob_nl not null,
email_address varchar2(200) constraint ea_nl not null,
ship varchar2(10) constraint staff_fk references sh_ship_copy(sh_id) not null,

constraint staff_ck unique(last_name, first_name, date_of_birth));



-- 10. Revoke the SELECT privilege from the user named 'panovics' on your 'sh_trip' table.
create table sh_trip_copy as
select *
from ship.sh_trip;

grant select on sh_trip_copy to panovics;

revoke select on sh_trip_copy from panovics;

-- 11. Insert ports with a known degree of rail connection (i.e., ports with a description containing the string 
-- 'rail connection') from the 'ship' schema into your 'sh_port' table.
create table sh_port_copy as 
select * from ship.sh_port;

delete from sh_port_copy;
truncate table sh_port_copy;

insert into sh_port_copy
select *
from ship.sh_port
where p_description like '%rail connection%';

select *
from sh_port_copy;

-- 12. Create a view that lists how many orders were placed for shipping from each port.
-- The list should include the identifier of the ports, the name and country of the city they are located in, 
-- and the number of orders. Ports with no orders from them should also be included in the result.
create or replace   view orders_per_port as
select p_id, c_name, country, count(*) as order_count
from ship.sh_order o right outer join ship.sh_port p on o.departure_port = p.p_id
inner join ship.sh_city city on p.city = city.c_id
group by p_id, c_name, country
order by count(*) desc;

select *
from orders_per_port;



PAPER 2: 

-- 1. List all data of clients whose phone number contains the digit 9 
-- exactly three times. Sort the list by last name. (19.)
select *
from ship.sh_client
where phone like '%9%9%9%' and phone not like '%9%9%9%9%'
order by last_name;

-- 2. List the date and time of orders placed in February and April 2021, 
-- the identifier of the departure and arrival ports, and the shipping fee, 
-- in descending order of the latter. (28.)
select o_id, date_of_order, to_char(date_of_order, 'hh24:mi:ss') as time, departure_port, arrival_port, shipping_fee
from ship.sh_order
where extract(month from date_of_order) in (02, 04) and extract(year from date_of_order) = 2021
order by shipping_fee;

-- 3. List in ascending order the identifier of orders having assigned 
-- containers with a total cargo weight exceeding 1000 tons. (38.)
select order_id, sum(cargo_weight)
from ship.sh_assign
group by order_id
having sum(cargo_weight) > 1000
order by order_id;

-- 4. List all data of ports that have a phone number starting with '21' 
-- and have a description. Each port should appear only once in the result. (43.)
select distinct prt.* 
from ship.sh_port prt inner join ship.sh_port_phone phn on prt.p_id = phn.port_id
where phone like '21%' and
p_description is not null;

-- 5. List the departure and arrival ports for orders with the combined cargo 
-- weight of the assigned containers exceeding 1000 tons. Beside the port IDs, 
-- print the total cargo weight as well. Sort the result descending by the 
-- total cargo weight. (54.)
select departure_port, arrival_port, sum(cargo_weight)
from ship.sh_assign asn inner join ship.sh_order ord on asn.order_id = ord.o_id
group by departure_port, arrival_port
having sum(cargo_weight) > 1000
order by sum(cargo_weight) desc;

-- 6. List the identifier of ports in Turkey with at least one known phone number. 
-- Each port should appear only once in the result. (63.)
select port_id
from ship.sh_port_phone phn inner join ship.sh_port prt on phn.port_id = prt.p_id
right join ship.sh_city city on prt.city = city.c_id
where country = 'Turkey'
group by port_id
having count(phone) >= 1;

select distinct p_id 
from ship.sh_port join ship.sh_city on city = c_id
join ship.sh_port_phone on p_id = port_id
where country = 'Turkey' and 
phone is not null;

-- 7. For containers assigned to the order with an identifier of '065601', 
-- print the identifier of trips on which the container(s) with the highest 
-- cargo weight was carried. (87.)
select trip_id
from ship.sh_carry carry inner join ship.sh_assign asn on carry.container_id = asn.container_id
where asn.order_id = '065601'
order by cargo_weight desc
fetch first row with ties;

select distinct  trip_id 
from ship.sh_assign a join ship.sh_carry c on a.container_id = c.container_id 
where c.order_id = '065601'
and cargo_weight = (select max(cargo_weight) from ship.sh_assign where order_id = '065601' );


-- 8. List the identifier, country, and name of cities either having a port or 
-- being the residence of at least one of our clients. Each city should appear 
-- only once in the result. Sort the list by country name and then by city name. (108.)
select c_id, country, c_name
from ship.sh_city
where c_id in 
(select distinct city
from ship.sh_client
where city is not null

union

select city
from ship.sh_port
where city is not null)

order by country, c_name;


select c_id , country , c_name
from ship.sh_city
where c_id in ( select city from ship.sh_client)
or c_id in ( select city from ship.sh_port)
ORDER BY country, c_name;



-- 9. Create a table named 'sh_port_email' storing the email addresses of ports 
-- and including the following columns: p_id (a string of up to 10 characters), 
-- with a reference to the 'sh_port' table, and email (a string of up to 200 characters). 
-- A port can have multiple email addresses, so make the primary key of the table 
-- a combination of the two columns. Assign a name to each constraint. (122.)
Alter table sh_port_copy
add primary key (p_id);

create table sh_port_email (
p_id varchar2(10) constraint pr_em_pid_fk references sh_port_copy(p_id),
email varchar2(200),

constraint pr_em_pk primary key(p_id, email)
);


-- 10. Grant INSERT and DELETE privileges to the user named 'panovics' on your 
-- 'sh_client' table. (150.)
grant insert, delete on sh_client to panovics;

-- 11. Change the arrival time of trips performed by the ship(s) named 'Asterix' 
-- and having an unknown arrival time to exactly 10 days later than their departure time. (168.)

--first create a copy of the original table
update ship_trip_copy
set arrival_time  = departure_time + 10
where ship in (select sh_id from ship.sh_ship where sh_name = 'Asterix')
AND arrival_time is null;


-- 12. Create a view that shows the total number of trips performed by the ships 
-- of each ship type. The list should include the identifier and name of the ship types 
-- and the number of trips completed. Ship types with no ships at all and ship types 
-- with ships having no trips performed should also be included in the result. 
-- Sort the list by the name of the ship type. (178.)
create or replace view trips_per_ship_type as
select tp.t_id, tp.t_name, count(tr.t_id)
from ship.sh_ship_type tp left join ship.sh_ship sh on tp.t_id = sh.sh_type
left join ship.sh_trip tr on sh.sh_id = tr.ship
group by tp.t_id, tp.t_name
order by t_name;

select st.T_name ,st.T_id , count(ship) 
from ship.sh_ship_type st left join ship.sh_ship on sh_type = st.t_id
left join ship.sh_trip on ship = sh_id
group by st.T_name ,st.T_id
order by st.T_name ;


-- 3rd Paper:

-- 1. List the name and population of cities in Italy. If no population is given, 
-- print 0 instead.
select c_name, nvl(population, 0)
from ship.sh_city
where country = 'Italy';


-- 2. List all data of trips (the dates should also include the times!) that departed 
-- in the middle of a minute (i.e., at a time with a nonzero second). Sort the result 
-- ascending by departure time.
select t_id, to_char(departure_time, 'yyyy-mm-dd hh24:mi:ss') as departure, to_char(arrival_time, 'yyyy-mm-dd hh24:mi:ss') as arrival, departure_port, arrival_port, ship
from ship.sh_trip
where to_char(departure_time, 'ss') != 00
order by departure asc;


-- 3. Which ports have at least four phone numbers? Sort the result ascending by port ID.
select port_id, count(phone)
from ship.sh_port_phone
group by port_id
having count(phone) >= 4
order by port_id;

-- 4. List the full name and phone number of clients from Syria.
select first_name || ' ' || last_name as full_name, phone
from ship.sh_client cl inner join ship.sh_city ct on cl.city = ct.c_id
where country = 'Syria';


-- 5. Print the name and country of cities where more than one client comes from. 
-- Sort the result alphabetically by city name.
select country, c_name, count(cl.c_id)
from ship.sh_client cl inner join ship.sh_city ct on cl.city = ct.c_id
group by country, c_name
having count(cl.c_id) > 1;

-- 6. List the identifier of ports in Turkey with at least one known phone number. 
-- Each port should appear only once in the result.
select distinct port_id
from ship.sh_port_phone phn inner join ship.sh_port prt on phn.port_id = prt.p_id
inner join ship.sh_city ct on prt.city = ct.c_id
where country = 'Turkey' and phone is not null;


-- 7. Which is the earliest departure of the ship named 'SC Bella'? You may assume 
-- that there is only one ship with that name. Print the identifier of the trip and 
-- the identifier of the arrival port.
select t_id, arrival_port, departure_time
from ship.sh_trip tr inner join ship.sh_ship sh on tr.ship = sh.sh_id
where sh_name = 'SC Bella' and departure_time in (select min(departure_time) from ship.sh_trip where ship = 300);

select *
from ship.sh_trip tr
where ship = (select sh_id from ship.sh_ship where sh_name = 'SC Bella')
and departure_time = ( select min(departure_time) from ship.sh_trip where ship = 300);


-- 8. List the exact departure time and the identifier of the departure and arrival ports 
-- of trips performed by a ship with a net weight of less than 250 tons, arriving at a port 
-- with excellent protection (i.e., a port with a description containing the string 
-- 'protection: excellent').
select departure_port, arrival_port, to_char(departure_time, 'yyyy-mm-dd hh24:mi:ss') as time
from ship.sh_trip tr inner join ship.sh_ship sh on tr.ship = sh.sh_id
inner join ship.sh_port prt on tr.arrival_port = prt.p_id
where net_weight < 250 and p_description like '%protection: excellent%';

select departure_port , arrival_port, departure_time 
from ship.sh_trip
where ship in ( select sh_id from ship.sh_ship where net_weight < 250 )
and arrival_port in (select p_id from ship.sh_port
                where p_description like '%protection: excellent%');

-- 9. Create a table named 'sh_staff' storing the personal data of the staff of the ships 
-- and including the following columns (with arbitrary names): identifier (an integer of up to 5 digits; 
-- this is the primary key), last name and first name (both being strings of up to 40 characters), 
-- date of birth (date), email address (a string of up to 200 characters), and the ship whose staff this person 
-- belongs to (a string of up to 10 characters), with a reference to the 'sh_ship' table. The last and first names 
-- and the ship must not be unknown. Make the last name, first name, and date of birth a composite key of the table. 
-- Assign a name to each constraint.

create table sh_staff(
staff_id number(5) constraint sh_staff_pk primary key,
last_name varchar2(40) not null,
first_name varchar2(40) not null,
date_of_birth date,
email_address varchar2(200),
ship varchar2(10) constraint sh_staff_fk references sh_ship_copy(sh_id) not null,

constraint sh_staff_ck unique(last_name, first_name, date_of_birth)
);





create table sh_ship_copy as
select * from ship.sh_ship;


alter table sh_ship_copy
add constraint sh_ship_copy_pk primary key(sh_id);



-- 10. Delete your 'sh_ship' and 'sh_ship_type' tables. Take into account the foreign keys referencing these tables. 
-- You may use multiple statements to solve this task.

-- 11. Delete orders placed by a client from Italy whose email address is unknown.
create table sh_orders_copy as
select *
from ship.sh_order;

select *
from sh_orders_copy;

delete from sh_orders_copy
where client_id in (select distinct c_id from ship.sh_client where email is null) and 
city in (select c_id from ship.sh_city where country = 'Italy');


-- 12. Create a view that lists how many trips led to each port. The list should include the identifier of the ports, 
-- the name and country of the city they are located in, and the number of trips. Ports with no trips leading to them 
-- should also be included in the result.
create or replace view trips_per_port as;
select p_id, c_name, country, count(t_id)
from ship.sh_trip tr left join ship.sh_port prt on tr.arrival_port = prt.p_id
inner join ship.sh_city ct on prt.city = ct.c_id
group by p_id, c_name, country;


4TH paper

-- 1. List the full name and date of birth of clients  
--    whose last name starts with a lowercase or uppercase 'b'.  
--    Sort the result ascending by last name and then by first name.
select first_name || ' ' || last_name, date_of_birth
from ship.sh_client
where lower(last_name) like 'b%'
order by last_name, first_name;

-- 2. List the time of departure (without the date),  
--    and the departure and arrival ports for trips that  
--    departed on June 6, 2021. Sort the result by departure time.

select to_char(departure_time,'hh24.mi.ss') as time, arrival_port
from ship.sh_trip
where to_char(departure_time, 'yyyy.mm.dd') = '2021.06.06'
order by departure_time;

-- 3. In which months (year, month) were at least 8 orders placed?  
--    The list should be in chronological order.
select to_char(date_of_order, 'mm.yyyy') as month, count(o_id)
from ship.sh_order
group by to_char(date_of_order, 'mm.yyyy')
having count(o_id) >= 8
order by month;

-- 4. Print the type name and description for the ship  
--    named 'SC Rosy'. You may assume that there is only  
--    one ship with that name.
select t_name, t_description
from ship.sh_ship sh inner join ship.sh_ship_type tp on sh.sh_type = tp.t_id
where sh_name = 'SC Rosy';


-- 5. Print the name and country of cities where more  
--    than one client comes from. Sort the list alphabetically by city name.
select country, c_name
from ship.sh_client cl inner join ship.sh_city ct on cl.city = ct.c_id
group by country, c_name
having count(cl.c_id) > 1
order by c_name;

-- 6. List the identifier and name of all ship types,  
--    along with the identifier and name of ships of each type.  
--    Name the type column 'type_name' and the ship column 'ship_name'.  
--    Include ship types with no ships.  
--    Sort by ship type name, then by ship name.
select t_id, t_name as type_name, sh_id, sh_name as ship_name
from ship.sh_ship sh right join ship.sh_ship_type tp on sh.sh_type = tp.t_id
order by t_name, sh_name;   

-- 7. List the identifier, country, and name of cities  
--    with a port from which the ship named 'SC Bella'  
--    has ever departed. You may assume there is only  
--    one ship with that name. Each city should appear  
--    only once in the result.
select distinct c_id, country, c_name
from ship.sh_trip tr inner join ship.sh_port prt on tr.departure_port = prt.p_id
inner join ship.sh_city ct on prt.city = ct.c_id
where ship in (select sh_id from ship.sh_ship where sh_name = 'SC Bella');

-- 8. List the name, maximum carrying capacity, and type name  
--    of ships that have not performed a single trip. The  
--    column containing the ship’s name should be named  
--    'ship_name', and the column containing the type’s name  
--    should be named 'type_name'.
select sh_name as ship_name, max_carrying_capacity, t_name as type_name
from ship.sh_ship_type tp inner join ship.sh_ship sh on tp.t_id = sh.sh_type
left join ship.sh_trip tr on sh.sh_id = tr.ship
where tr.t_id is null;

select sh_name, max_carrying_capacity , t_name
from ship.sh_ship sh join ship.sh_ship_type tp on tp.t_id = sh.SH_TYPE
where sh_id not in (select ship from ship.sh_trip);

-- 9. Create a table named 'sh_staff' storing the personal data  
--    of the ship staff, with these columns (arbitrary names):  
--      • identifier        — integer up to 5 digits (PK)  
--      • last name         — VARCHAR2(40), NOT NULL  
--      • first name        — VARCHAR2(40), NOT NULL  
--      • date of birth     — DATE, NOT NULL  
--      • email             — VARCHAR2(200), NOT NULL  
--      • ship              — VARCHAR2(10), NOT NULL, FK to sh_ship  
--    Make (last_name, first_name, date_of_birth) a composite  
--    key. Assign names to all constraints.


-- 10. Grant INSERT privilege to all users on your  
--     'sh_port' table.
grant insert oon sh_port_copy to public;

-- 11. Change the name of the best-performing ship as follows:  
--     put the name of the ship that has completed the most  
--     trips so far between two asterisks (*). If more than one  
--     ship ties, update all of them.
create table sh_ship_copy as
select * from ship.sh_ship;


update sh_ship_copy
set sh_name = '*'|| sh_name ||'*'
where sh_id in(
select ship
from ship.sh_trip
group by ship
order by count(t_id) desc
fetch first row with ties);

select *
from sh_ship_copy;

-- 12. Create a view that lists the last and first name of our  
--     customers, the name and country of the city of their  
--     residence, and the number of their orders. Include  
--     customers with unknown residence or who have never  
--     placed an order.

create or replace view name_of_customers as;
select last_name, first_name, c_name, country, count(o_id)
from ship.sh_order o right join ship.sh_client cl on o.client_id = cl.c_id
left join ship.sh_city ct on cl.city = ct.c_id
group by last_name, first_name, c_name, country;

select last_name , first_name ,c_name , country , count(o_id)
from ship.sh_client cl 
left join ship.sh_city ci on cl.city =ci.c_id
left join ship.sh_order o on o.client_id = cl.c_id
group by  last_name , first_name ,c_name , country;


5th paper

-- 1. List all data of small ports with mobile cranes.  
--    The description must contain 'port size: small' and 'mobile cranes' (in any order).
select *
from ship.sh_port
where lower(p_description) like '%port size: small%' and lower(p_description) like '%mobile cranes%';

-- 2. List the identifier of ships performing trips of more than two days,  
--    the trip duration in days (rounded to two decimals) AS duration,  
--    and the departure and arrival port IDs. Include trips lacking an arrival_time  
--    but departed more than two days ago. Sort descending by exact trip duration.
select t_id, round(nvl(arrival_time, sysdate) - departure_time) as duration, departure_port, arrival_port
from ship.sh_trip
where nvl(arriv al_time, sysdate) - departure_time > 2
order by duration desc;

-- 3. On which continents are there more than 20 countries?
select continent, count(country)
from ship.sh_country
group by continent
having count(country) > 20;


-- 4. List the identifier and full name of clients from Italy with both  
--    their phone number and email address given.
select cl.c_id , first_name||' '||last_name as full_name
from ship.sh_client cl full join ship.sh_city ct on cl.city = ct.c_id
where country = 'Italy' and phone is not null and email is not null;

-- 5. List the full name of clients, in descending order of their last names,  
--    who have placed orders for more than 100 containers in total so far.  
--    Beside the name, print the number of requested containers as well.
select c_id, first_name||' '||last_name as full_name, sum(no_of_containers)
from ship.sh_client cl inner join ship.sh_order o on cl.c_id = o.client_id
group by c_id, first_name, last_name
having sum(no_of_containers) > 100
order by last_name desc;

-- 6. List clients from Italy and their orders: the client’s full name,  
--    email address, phone number, departure_port, arrival_port, and shipping_fee.  
--    Sort descending by shipping_fee.
select c_id, first_name || ' ' || last_name, email, phone, departure_port, arrival_port,shipping_fee
from ship.sh_client cl inner join ship.sh_order o on cl.c_id = o.client_id
where city in (select c_id from ship.sh_city where country = 'Italy')
order by shipping_fee desc;

-- 7. List the identifier and name of ships that have never arrived at a port  
--    in France as the destination of a trip.
select distinct sh_id, sh_name
from ship.sh_ship 
minus
select distinct sh_id, sh_name
from ship.sh_ship sh inner join ship.sh_trip tr on sh.sh_id = tr.ship
where arrival_port in (
select p_id 
from ship.sh_port prt inner join ship.sh_city ct on prt.city = ct.c_id
where country = 'France');

SELECT s.sh_id, s.sh_name
FROM ship.sh_ship s
WHERE s.sh_id NOT IN (
   	SELECT t.ship
     	FROM ship.sh_trip t
     	JOIN ship.sh_port p  ON t.arrival_port = p.p_id
     	JOIN ship.sh_city c  ON p.city = c.c_id
    	WHERE c.country = 'France'
 );

-- 8. List the identifier, country, and name of cities with a population of more  
--    than one million, as well as those where at least one client aged more  
--    than 50 comes from. Each city should appear only once in the result.  
--    Sort by country name and then by city name.
select distinct ct.c_id, country,c_name, population
from ship.sh_client cl right join ship.sh_city ct on cl.city = ct.c_id
where population > 1000000 or
(sysdate - date_of_birth) / 365.25 > 50
order by country, c_name;

select distinct c_id , country , c_name , population from ship.sh_city
where population > 1000000 
or c_id in ( select city from ship.sh_client 
            where Months_between(sysdate,Date_of_birth)/12 >50)
order by country , c_name;


-- 9. Create a table named 'sh_ship_repair' storing the repair data of ships  
--    with these columns (arbitrary names):  
--      • ship_id     VARCHAR2(10)  REFERENCES sh_ship(sh_id)  
--      • start_time  DATE  
--      • end_time    DATE  
--      • price       NUMBER(10,2)  NOT NULL  
--      • description VARCHAR2(200)  
--    Primary key(ship_id, start_time). Add a constraint that end_time > start_time.  
--    Assign names to each constraint.
create sh_ship_repair (
ship_id varchar2(10) constraint sh_ship_repair_fk references sh_ship_copy(ship_id),
start_time date, 
end_time date,
price number(10,2) not null,
description varchar2(200),

constraint sh_ship_repair_pk primary key(ship, id, start_time),
constraint sh_ship_repair_chk check (end_time > start_time)
);

-- 10. Delete the primary key constraint of your 'sh_port_phone' table.
alter table sh_port_phone_copy
drop constraint sh_port_phone_copy_pk;

-- 11. Our population data are outdated. As one of the steps to update them,  
--     increase the population of the cities of Asian countries by 5%.


-- 12. Create a view that lists the last and first name of our customers,  
--     the name and country of the city of their residence, and the number of their orders.  
--     Include customers with an unknown residence and those who have never placed an order.



6TH PAPER: 

-- 1. List the full name and date of birth of clients whose last name starts  
--    with a lowercase or uppercase 'b'. Sort ascending by last name, then first name.

-- 2. List the full name, phone number, and date of birth of clients born during  
--    the summer months (June, July, August). Sort by month of birth, then last name, then first name.

-- 3. Which orders required more than 3 trips to fulfill, and how many trips were needed?  
--    (Each trip counts only once per order.) List orders by identifier, sorted descending by trip count.

-- 4. List all data of ports that have a phone number starting with '21' and a description.  
--    Each port should appear only once in the result.

-- 5. How many times did the ship named 'Goliat' depart from each port?  
--    Include only ports it departed from at least once.  
--    Sort descending by departure count, then ascending by port ID.

-- 6. List the identifier of ports in Turkey with at least one known phone number.  
--    Each port should appear only once in the result.

-- 7. At which port did the longest trip(s) from the port of Catania (ID: 'It_Cat') arrive?  
--    Print the arrival port ID, city name, and country.

-- 8. List the full name of the ten clients who have paid the most in total shipping fees.  
--    Print the client’s name and total shipping fee paid.

-- 9. Create a table named 'sh_port_email' storing the email addresses of ports, including:  
--      • p_id   — VARCHAR2(10), FK to sh_port  
--      • email  — VARCHAR2(200)  
--    Make (p_id, email) the primary key. Assign names to constraints.

-- 10. Delete the primary key constraint of your 'sh_port_phone' table.

-- 11. Delete orders for shipping from any port in Italy with a shipping fee less than one million.

-- 12. Create a view listing all order attributes, plus the name and country of the departure and arrival port cities.




7TH PAPER : 

-- 1. List the full name of clients whose phone number starts with '393'  
--    and whose email address is known.

-- 2. List the departure port ID of trips that arrived at 'It_Cat'  
--    in the 2nd half of June 2021, plus exact departure and arrival times.  
--    Sort ascending by arrival time.

-- 3. On which continents are there more than 20 countries?

-- 4. List the identifier and full name of clients who have placed at least one order.  
--    Sort by last name then first name.

-- 5. How many orders were placed each month where the arrival port has mobile cranes?  
--    Sort descending by the number of orders.

-- 6. Determine the lowest and highest cargo weight of containers  
--    carried on trips departing in June 2021.

-- 7. Which ship(s) performed the shortest trip(s) from the port of Catania ('It_Cat')?  
--    Print ship name(s) and arrival port ID.

-- 8. List the full name and date of birth of our five oldest clients from Italy.

-- 9. Create a table named 'sh_ship_repair' storing repair data with columns:  
--      • ship ID (VARCHAR2(10)), FK to sh_ship  
--      • start and end time (DATE, NOT NULL)  
--      • price (NUMBER(10,2), NOT NULL)  
--      • description (VARCHAR2(200))  
--    Primary key: (ship ID, start time). Add constraint end_time > start_time.

-- 10. Change the maximum length of 'email' column in 'sh_client' to 50 chars,  
--     and 'street' column to 100 chars.

-- 11. Capitalize the last name(s) of the client(s) who have paid the most in total shipping fees.

-- 12. Create a view that shows how many ports are located in each country.  
--     Include countries with no ports or cities.


-- Update sh_order table
-- The oldest client(s) will get 10% off in their latest placed order. Update the shipping fee for those orders.

select *
from ship.sh_client;

select O_ID
from ship.sh_order
where client_id in
    (select c_id
    from ship.sh_client
    order by date_of_birth 
    fetch first row with ties) 
and date_of_order in 
    (select max(date_of_order) 
    from ship.sh_order where client_id in 
        (select c_id
        from ship.sh_client
        order by date_of_birth 
        fetch first row with ties)
        group by client_id);
    