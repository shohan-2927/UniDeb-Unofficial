
QUESTION BANK SHIP SCHEMA with solutions: 



### Question number 1 

List the full name and date of birth of clients whose last name starts with a lowercase or uppercase 'b'.
Sort the result ascending by last name and then by first name. (2)

List the name and population of cities in Italy. If no population is given, print 0 instead. (5)

List all data of Asian countries, sorted descending by their area. (8)

List all data of ships with a net weight exceeding 300 tons.
Sort the list by net weight. (9)

List the full name of clients in the form "<last name>, <first name>" (i.e., the first name should be separated from the last name 
by a comma and a space) whose residence is unknown and whose first name is made up of 5 characters. 
Sort the list descending by last name. (17)

List in alphabetical order the name of all countries in our database. Each country name should appear only once in the result. (18)

List all data of small ports with mobile cranes.
The description of some ports contains the strings 'port size: small' and 'mobile cranes' (not necessarily in this order). (30) 



### Question number 2 

List the date, time, value (shipping fee) of orders that were either placed in the afternoon or have a value of at least 10 million.
Sort the result ascending by the time of order (regardless of the date). (21)

List the identifier of the departure port of trips that arrived at the port of Catania (port ID: 'It\_Cat') 
in the 2nd half of June 2021 (i.e., after the 15th).Also include the exact departure and arrival time of those trips.
Sort the result ascending by the exact arrival time. (22)

List the identifier of clients who have placed an order in the past five years (based on the time of the query).
Also include the date and time of these orders.
Sort the list descending by the time of order. (23)

List all data of trips (the dates should also include the times!) that departed in the middle of a minute 
(i.e., at a time with a non-zero second).Sort the result ascending by departure time. (24)

List the full name, phone number, and date of birth of clients who were born during the summer months (June, July, August).
Sort the list by the month of birth, then by last name, and then by first name. (25)

List the time of departure (without the date), the date and time of arrival, and the identifier of the departure 
and arrival ports for trips that departed on June 6, 2021.
Sort the result by the time of departure. (26)


List the full name of clients aged at least 60 in the form "<last name>, <first name>", 
along with their age (in integer years) and phone number.Sort the list descending by the exact age. (29)


### Question number 3 

Which orders required more than 3 trips to fulfill, and how many trips were needed?
Sort the result descending by the number of trips. (32)

In which months (year, month) were at least 8 orders placed?
The list should be in chronological order. (34)

List in ascending order the identifier of orders having assigned containers with a total cargo weight exceeding 1000 tons. (38)

On which continents are there more than 20 countries? (39)

Which ports have at least four phone numbers?
Sort the result ascending by port ID. (40)



### Question number 4 (Rank: 4)

List the identifier and full name of clients who requested more than 20 containers in one of their orders and whose email address is known.
Sort the list by last name and then by first name. Each client should appear only once in the result. (42)

List all data of ports that have a phone number starting with '21' and have a description.
Each port should appear only once in the result. (43)

List the identifier and full name of clients who have an order worth more than 1 million and whose residence is unknown.
Sort the list by last name and then by first name. (44)

List the identifier and full name of clients who have placed at least one order.
Sort the result by last name and then by first name. (45)

List the identifier and full name of clients from Italy with both their phone number and email address given. (46)

List the full name and phone number of clients from Syria. (50)

Print the type name and description for the ship named 'SC Rosy'.
You may assume that there is only one ship with that name. (49)


---

### Question number 5:

How many times did the ship named 'Goliat' depart from each port? You may assume that there is only one ship with that name. 
Include only those ports that the ship has departed at least once. 
Sort the result descending by the number of departures and then ascending by port ID. (51)

List the departure and arrival ports for orders with the combined cargo weight of the assigned containers exceeding 1000 tons. 
Beside the port IDs, print the total cargo weight as well. Sort the result descending by the total cargo weight. (54)

List the full name of clients, in descending order of their last names, who have placed orders for more than 100 containers in 
total so far. Beside the name, print the number of requested containers as well. (56)

Print the name and country of cities where more than one client comes from. Sort the result alphabetically by city name. (57)

What is the lowest net weight of ships of each ship type? Ship types should be represented in the result by their names. 
Include only ship types with at least one ship. (58)

What was the highest shipping fee in orders placed in each month (year, month)? Include only those months for which 
the average cargo weight of containers assigned to orders placed in that month exceeds 20 tons. (60)

---

### Question number 6:

List the identifier of the departure and arrival ports for orders with an arrival port in Greece, as well as the date of the order, 
in ascending order of the latter. (62)

List the identifier of ports in Turkey with at least one known phone number. Each port should appear only once in the result. (63)

List cities having ports suitable for serious repairs, as well as ports from which at least one trip led to these ports. 
A port is suitable for serious repairs if its description contains the string 'ship service: strong'. 
The result should include the country and city name of such ports and the identifier of the departure port of trips leading to them. 
Sort the result by country name, then by city name, and then by departure port ID. 
Each of these value triples should appear only once in the result. (64)

List clients from Italy and their orders. The list should include the clients' full name, email address, and phone number, as well as the identifier of the departure and 
arrival ports and the shipping fee, sorted in descending order of the latter. (65)

List the identifier and name of all ship types, along with the identifier and name of ships of each type. The column containing the name of ship types should be named 'type\_name', and the column containing the name of the ships should be named 'ship\_name'. 
Ship types with no ships should also be included in the result. Sort the list by the name of ship type and then by ship name. (71)

---

### Question number 7:

List the identification, country and real number of clients whose last name starts with a 'D'. (84)

For which order(s) for shipping from the port of Catania (port ID: 'It\_Cat') was paid the highest shipping fee? Print the identifier of the order(s), 
the identifier of the arrival port, the number of requested containers, and the client's full name. (85)

Which order(s) for shipping from the port of Catania (port ID: 'It\_Cat') has the highest number of requested containers? Print the identifier of the order(s), the identifier of the arrival port, and the client's full name. (86)

At which port did the longest trip(s) from the port of Catania (port ID: 'It\_Cat') arrive? 
Print the identifier of the arrival port as well as the name of the city and country of the port. (88)(81)

Which is the earliest departure of the ship named 'SC Bella'? You may assume that there is only one ship with that name. Print the identifier of the trip and the identifier of the arrival port. (90)

List the identifier, country and name of cities with a port from which the ship named 'SC Nina' has departed at least once in the past. You may assume that there is only one ship with that name. Each city should appear only once in the result. (91)

List the identifier and name of ships that have never arrived at a port in France as the destination of a trip. (93)

---

### Question number 8:

List the identifier of orders with a higher shipping fee than in any of the orders placed in April 2021. Beside the order ID, print the shipping fee as well. (95)

List the identifier, country, and name of cities with a population of more than one million, as well as those where at least one client comes from and more than 
60 orders come from. Each city should appear only once in the result. Sort the list by country name and then by city name. (99)

List the exact departure time and the identifier of the departure and arrival ports of trips performed by a ship with a net weight of less than 250 tons and arriving at 
a port with excellent protection (i.e., a port with a description containing the string 'protection: excellent'). (102)

List the identifier, country, and name of cities with a population of more than one million, as well as those where at least one client aged more  
than 50 comes from. Each city should appear only once in the result.  Sort by country name and then by city name. (104.)

List the identifier, country, and name of cities either having a port or being the residence of at least one of our clients. Each city should appear only once in the result. 
Sort the list by country name and then by city name. (108.)


List in alphabetical order the identifier of ports to which at least one trip led from the port of Catania (port ID: 'It\_Cat') and serve as the destination of at least 
one order for shipping from the port of Catania. Each port should appear only once in the result. (107)

List the name, maximum carrying capacity, and type name of ships that have not performed a single trip. The column containing the name of the ships should be named 
'ship\_name', and not the column containing the name of ship types should be named 'type\_name'. (109)

Print the identifier of the departure and arrival ports of the three longest trips performed by the ship named 'SC Nina'. You may assume that there is only one ship with that name. (111)

Which three countries had the most orders placed for shipping from their ports? Beside the country name, 
print the number of orders as well as the number of shipping from there as well. (113)

List the full name of the ten clients who have paid the most for their orders in total so far. 
Beside the client's name, print the shipping fee paid as well. (114)

Which three countries had the most orders placed for shipping from their ports? Beside the country name, print the number of orders for shipping from there as well. (115.)

Print the full name of the four clients who have placed the most orders, along with the number of their orders. (116)

Print the identifier of the departure and arrival ports of the three longest trips performed by the ship named 'SC Nina'. 
You may assume that there is only one ship with that name. (118)

---

### Question number 9:

Create a table named 'sh\_port\_email' storing the email addresses of ports and including the following columns: p\_id (a string of up to 10 characters), 
with a reference to the 'sh\_port' table, and email (a string of up to 200 characters). 
A port can have multiple email addresses, so make the primary key of the table a combination of the two columns. Assign a name to each constraint. (122)

Create a table named 'sh\_staff' storing the personal data of the staff of the ships and including the following columns (with arbitrary names): 
identifier (an integer of up to 5 digits; this is the primary key), last\_name and first\_name (both being strings of up to 40 characters), date\_of\_birth (date), 
email\_address (a string of up to 200 characters), and the ship whose staff this person belongs to (a string of up to 10 characters), with a reference to the 'sh\_ship' table. 
The last and first names and the ship must not be unknown. 
Make the last name, first name, and date of birth a composite key of the table. Assign a name to each constraint. (123)

Create a table named 'sh\_ship\_repair' storing the repair data of ships and including the following columns (with arbitrary names): 
the identifier of the ship being repaired (a string of up to 20 characters), with a reference to the 'sh\_ship' table, the start and end dates of the repair dates, 
the price of the repair (a real number of up to 10 digits with 2 decimal places; must not be unknown), and the description of the repair (a string of up to 200 characters). 
Make the primary key of the table a combination of the ship ID and the start date. Note that a simple restriction is that the repair must end later than it started. 
Assign a name to each constraint. (124)

---

### Question number 10:

Delete the key made up of the 'departure\_time' and 'ship' columns from your 'sh\_trip' table (but keep the columns). (131)

Grant INSERT privilege to all users on your 'sh\_ports' table. (132)

Delete the primary key constraint of your 'sh\_port\_phone' table. (137)

Delete your 'sh\_ship' and 'sh\_ship\_type' tables. Take into account the foreign keys referencing these tables. 
You may use multiple statements to solve this task. (140)

Revoke the SELECT privilege from the user named 'panovics' on your 'sh\_trip' table. (141)

Revoke the INSERT privilege from all users on your 'sh\_order' table. (144)

Grant INSERT privilege to all users on your 'sh\_port' table. (148)

---

### Question number 11:

Insert ports with a known degree of rail connection (i.e., ports with a description containing the string 'rail connection') from the 'ship' schema into your 'sh\_port' table. (153)

A devastating virus has taken its toll in many cities across Africa. To update our database, halve the population of African 
cities with a current population of more than half a million. (155)

Delete trips that departed in June 2021 and on which fewer than 20 containers were carried. (156)

Delete orders placed by a client from Italy whose email address is unknown. (157)

Delete orders for shipping from a port in Italy with a shipping fee of less than one million. (160)

Our population data are outdated. As one of the steps to update them, increase the population of the cities of Asian countries by 5%. (162)

An administrator of our company made a big mistake: he erroneously entered the trips departing from the port of Algeciras in July 2021 
into the database as if they had departed from Valencia. In fact, no trip started from Valencia at that time. 
Correct the administrator's mistake. For the sake of simplicity, you can assume that there is only one city called 'Algeciras' and 'Valencia', 
respectively, and that both cities have a single port. (164)

Capitalize the last name of the client who has paid the most shipping fee for their orders in total so far (we have more than one such client, change all of them). (166)

Change the name of the best-performing ship as follows: put the name of the ship that has completed the most trips so far between two asterisks (\*). 
If we have more than one such ship, then change all of them. (170)

---

### Question number 12:

Create a view that lists how many trips led to each port. The list should include the identifier of the ports, the name and country of the city they are located in, 
and the number of trips. Ports with no trips leading to them should also be included in the result. (172)

Create a view that lists how many phone numbers each port has. The list should include the identifier of the ports, the name and country of the 
city they are located in, and the number of their phone numbers. Ports with no phone numbers should also be included in the result. (171)

Create a view that shows how many ports are located in each country. Countries with no ports or even no cities should also be included in the list. (175)

Create a view that lists how many orders were placed for shipping from each port. The list should include the identifier of the ports, the name and country of the city they are located in, and the number of orders. Ports with no orders from them should also be included in the result. (176)

Create a view that lists all attributes of the orders, together with the name and country of the city of the departure and arrival ports. (177)

Create a view that lists the last and first name of our customers, the name and country of the city of their residence, and the number of their orders. 
Customers with an unknown residence and those who have never placed an order should also be included in the result. (180)

---

SOLUTIONS OF SOME QUESTIONS: 

1ST PAPER:


-- 1. List in alphabetical order the name of all countries in our database. 
--Each country name should appear only once in the result. (18)
select distinct country
from sh_country
order by country asc;


-- 2. List the date, time, and value (shipping fee) of orders that were either placed in the afternoon or 
--have a value of at least 10 million. Afternoon times are times from noon to midnight, 
--including noon but not including midnight. Sort the result ascending by the time of order (regardless of the date).
select date_of_order , to_char(date_of_order,'HH24:MI:SS') as time , shipping_fee 
from sh_order 
where to_char(date_of_order,'HH24')>=12
or shipping_fee >=10000000
order by to_char(date_of_order,'HH24:MI:SS');


-- 3. List in ascending order the identifier of orders having assigned containers with atotal cargo weight exceeding 1000 tons.
select order_id 
from sh_assign
group by order_id 
having sum(cargo_weight)>1000
ORDER BY order_id;;

-- 4. List the identifier and full name of clients who have placed at least one order. 
--Sort the result by last name and then by first name. Each client should appear only once in the result.
select c_id , first_name || ' ' || last_name as full_name
from sh_client
where c_id in (select client_id from sh_order)
order by last_name, first_name;

-- 5. How many times did the ship named 'Goliat' depart from each port? 
--You may assume that there is only one ship with that name. Include only those ports that the ship has departed at least once. 
--Sort the result descending by the number of departures and then ascending by port ID.
select departure_port , count(*)
from sh_trip
where ship = (select sh_id from sh_ship where sh_name = 'Goliat')
group by departure_port
order by count(*) desc,departure_port
;

-- 6. List the identifier and name of all ship types, along with the identifier and name of ships of each type. 
--The column containing the name of ship types should be named 'type_name', and the column containing the name of the 
--ships should be named 'ship_name'. Ship types with no ships should also be included in the result. 
--Sort the list by the name of ship type and then by ship name.
select T_id , T_name as type_name , sh_id , sh_name as ship_name
from sh_ship_type 
left join sh_ship on sh_type = t_id
order by T_name, sh_name;

-- 7. List the identifier of orders with a higher shipping fee than in any of the orders placed in April 2024. 
--Beside the order ID, print the shipping fee as well.
select o_id , shipping_fee from sh_order
where shipping_fee > (select max(shipping_fee) from sh_order 
                    where date_of_order >= DATE '2024-04-01' 
                    AND date_of_order < DATE '2024-05-01');
-- 8. Which three countries had the most orders placed for shipping from their ports? 
--Beside the country name, print the number of orders for shipping from there as well.
select country , count(*)
from sh_city 
join sh_port on city = c_id
join sh_order on p_id = departure_port
group by country
order by count(*) desc
fetch first 3 rows only;


-- 9. Create a table named 'sh_staff' storing the personal data of the staff of the ships 
--and including the following columns (with arbitrary names): identifier (an integer of up to 5 digits; 
--this is the primary key), last name and first name (both being strings of up to 40 characters), date of birth (date), 
--email address (a string of up to 200 characters), and the ship whose staff this person belongs to 
--(a string of up to 10 characters), with a reference to the 'sh_ship' table. The last four items and the ship must not 
--be unknown. Make the last name, first name, and date of birth a composite key of the table. 
--Assign a name to each constraint.
Create table sh_staff(
    id Number(5) constraint sh_staff_pk primary key,
    last_name Varchar2(40 CHAR) not null,
    first_name Varchar2(40 CHAR) not null,
    birth date not null,
    email Varchar2(200) not null,
    ship varchar2(10) constraint sh_staff_fk references sh_ship not null,
    constraint sh_staff_uk unique(last_name,first_name,birth)
)
;


-- 10. Revoke the SELECT privilege from the user named 'panovics' on your 'sh_trip' table.
revoke select on sh_trip from panovics;

-- 11. Insert ports with a known degree of rail connection (i.e., ports with a description containing the string 
--'rail connection') from the 'ship' schema into your 'sh_port' table.
create table port_copy as (select * from sh_port);
insert into port_copy
select *
from sh_port
where p_description like '%rail connection%';


-- 12. Create a view that lists how many orders were placed for shipping from each port.
--The list should include the identifier of the ports, the name and country of the city they are located in, 
--and the number of orders. Ports with no orders from them should also be included in the result.
CREATE VIEW orders_per_port AS
select p_id, c_name,country,count(o_id)
from sh_port
left join sh_order on departure_port = p_id 
join sh_city on c_id = city
group by p_id, c_name,country ;


2nd Paper:


-- 1. List all data of clients whose phone number contains the digit 9 exactly 
-- three times. Sort the list by last name. (19.)
select * 
from sh_client 
where phone like '%9%9%9%' and phone not like '%9%9%9%9%'
order by last_name;

-- 2. List the date and time of orders placed in February and April 2021, the 
-- identifier of the departure and arrival ports, and the shipping fee, in 
-- descending order of the latter. (28.)
select date_of_order , to_char(date_of_order,'HH24:MI:SS') as time , departure_port , arrival_port , shipping_fee
from sh_order 
where extract(month from date_of_order) in (2,4) 
and extract(year from date_of_order) = 2024
order by shipping_fee desc;

-- 3. List in ascending order the identifier of orders having assigned 
-- containers with a total cargo weight exceeding 1000 tons. (38.)
select order_id from sh_assign
group by order_id
having sum(cargo_weight)>1000
order by order_id;


-- 4. List all data of ports that have a phone number starting with '21' and 
-- have a description. Each port should appear only once in the result. (43.)
select distinct sh_port.*
from sh_port
join sh_port_phone on port_id = p_id
where phone like '21%' and p_description is not null;


-- 5. List the departure and arrival ports for orders with the combined cargo 
-- weight of the assigned containers exceeding 1000 tons. Beside the port IDs, 
-- print the total cargo weight as well. Sort the result descending by the 
-- total cargo weight. (54.)
select departure_port, arrival_port, sum(cargo_weight)
from sh_order 
join sh_assign on order_id = o_id
group by departure_port, arrival_port
having sum(cargo_weight)>1000
order by sum(cargo_weight) desc;

-- 6. List the identifier of ports in Turkey with at least one known phone 
-- number. Each port should appear only once in the result. (63.)
select distinct p_id 
from sh_port
join sh_city on city = c_id
join sh_port_phone on p_id = port_id
where country = 'Turkey'
and phone is not null;

-- 7. For containers assigned to the order with an identifier of '065601', 
-- print the identifier of trips on which the container(s) with the highest 
-- cargo weight was carried. (87.)
select distinct  trip_id 
from sh_assign a join sh_carry c on a.container_id = c.container_id 
where c.order_id = '065601'
and cargo_weight = (select max(cargo_weight) from sh_assign where order_id = '065601' );


-- 8. List the identifier, country, and name of cities either having a port or 
-- being the residence of at least one of our clients. Each city should appear 
-- only once in the result. Sort the list by country name and then by city 
-- name. (108.)
select c_id , country , c_name
from sh_city
where c_id in ( select c.city from sh_client c )
or c_id in ( select p.city from sh_port p)
ORDER BY country, c_name;

-- 9. Create a table named 'sh_port_email' storing the email addresses of ports 
-- and including the following columns: p_id (a string of up to 10 characters), 
-- with a reference to the 'sh_port' table, and email (a string of up to 200 
-- characters). A port can have multiple email addresses, so make the primary 
-- key of the table a combination of the two columns. Assign a name to each 
-- constraint. (122.)

create table sh_port_copy as ( select * from ship.sh_port);
Alter table sh_port copy
add primary key (p_id)

create table sh_port_email ( 
    p_id Varchar2(10) constraint sh_port_email_fk references sh_port_copy(p_id),
    email VARCHAR2(200),
    constraint sh_port_email_pk primary key(p_id,email)
);

-- 10. Grant INSERT and DELETE privileges to the user named 'panovics' on your 
-- 'sh_client' table. (150.)
Grant insert, delete on sh_client to panovics;

-- 11. Change the arrival time of trips performed by the ship(s) named 
-- 'Asterix' and having an unknown arrival time to exactly 10 days later than 
-- their departure time. (168.)

create table ship_trip_copy1 as ( select * from ship.sh_trip);

update ship_trip_copy1
set arrival_time  = departure_time + 10
where ship in (select sh_id from sh_ship where sh_name = 'Asterix')
AND arrival_time is null;

-- 12. Create a view that shows the total number of trips performed by the ships 
-- of each ship type. The list should include the identifier and name of the 
-- ship types and the number of trips completed. Ship types with no ships at 
-- all and ship types with ships having no trips performed should also be 
-- included in the result. Sort the list by the name of the ship type. (178.)
select st.T_name ,st.T_id , count(ship) 
from ship.sh_ship_type st
left join ship.sh_ship on sh_type = st.t_id
left join ship.sh_trip on ship = sh_id
group by st.T_name ,st.T_id
order by st.T_name ;


3rd Paper:

-- 1. List the name and population of cities in Italy.  
--    If no population is given, print 0 instead.
select  c_name, nvl(population , 0) as population
from ship.sh_city
where country = 'Italy';

-- 2. List all data of trips (the dates should also include the times!)  
--    that departed in the middle of a minute (i.e., at a time with a nonzero second).  
--    Sort the result ascending by departure time.
select T_ID, to_char(departure_time,'YYYY-MM-DD HH24:MI:SS'), 
 to_char(arrival_time,'YYYY-MM-DD HH24:MI:SS'),
 departure_port, arrival_port, ship
from ship.sh_trip
where to_char(departure_time,'ss') != '00'
order by departure_time;

-- 3. Which ports have at least four phone numbers?  
--    Sort the result ascending by port ID.
select port_id 
from ship.sh_port_phone
group by port_id
having count(phone)>3
order by port_id asc;


-- 4. List the full name and phone number of clients from Syria.
select first_name ||' '|| last_name as full_name , phone 
from ship.sh_client
where city in (select c_id from ship.sh_city where country = 'Syria' );

-- 5. Print the name and country of cities where more than one client comes from.  
--    Sort the result alphabetically by city name.
select c_name , country 
from sh_city city
join sh_client client on city.c_id= client.city
group by c_name , country
having count(client.c_id)>1
order by c_name;

-- 6. List the identifier of ports in Turkey with at least one known phone number.  
--    Each port should appear only once in the result.
select distinct p_id 
from ship.sh_port
join ship.sh_city on city = c_id
join ship.sh_port_phone on port_id = p_id
where phone is not null
and country = 'Turkey';

-- 7. Which is the earliest departure of the ship named 'SC Bella'?  
--    You may assume that there is only one ship with that name.  
--    Print the identifier of the trip and the identifier of the arrival port.
select t_id , arrival_port
from sh_trip tr
where ship = (select sh_id from sh_ship where sh_name = 'SC Bella')
and departure_time = ( select min(departure_time) from sh_trip where ship = tr.ship);

-- 8. List the exact departure time and the identifier of the departure and arrival ports of trips  
--    performed by a ship with a net weight of less than 250 tons, arriving at a port with excellent protection  
--    (i.e., a port with a description containing the string 'protection: excellent').
select departure_time , departure_port , arrival_port 
from sh_trip
where ship in ( select sh_id from sh_ship where net_weight < 250 )
and arrival_port in (select p_id from sh_port
                where p_description like '%protection: excellent%');

-- 9. Create a table named 'sh_staff' storing the personal data of the staff of the ships and including the following columns  
--    (with arbitrary names): identifier (an integer of up to 5 digits; this is the primary key), last name and first name  
--    (both being strings of up to 40 characters), date of birth (date), email address (a string of up to 200 characters),  
--    and the ship whose staff this person belongs to (a string of up to 10 characters), with a reference to the 'sh_ship' table.  
--    The last and first names and the ship must not be unknown.  
--    Make the last name, first name, and date of birth a composite key of the table.  
--    Assign a name to each constraint.
create table sh_ship_copy as ( select * from ship.sh_ship);
alter table sh_ship_copy
add primary key(sh_id);

Create table sh_staff2(
    id NUMBER(5) constraint staff2_pk primary key,
    last_name varchar2(40) not null,
    first_name varchar2(40) not null,
    birth date,
    email varchar2(200) not null,
    ship varchar2(10) constraint sh_staff2_fk references sh_ship_copy not null,
    constraint sh_staff2_uk Unique(first_name, last_name,birth)
);
    

-- 10. Delete your 'sh_ship' and 'sh_ship_type' tables.  
--     Take into account the foreign keys referencing these tables.  
--     You may use multiple statements to solve this task.
create table sh_ship_type_copy as ( select * from sh_ship_type);

drop table sh_ship_copy  cascade constraints;
drop table sh_ship_type_copy  cascade constraints;

-- 11. Delete orders placed by a client from Italy whose email address is unknown.
create table sh_ship_order as ( select * from sh_order);

delete --select *
from sh_ship_order 
where client_id in ( select c_id from sh_client 
                    where email is null 
                    and city in ( select c_id from sh_city 
                                 where country = 'Italy'));
    

-- 12. Create a view that lists how many trips led to each port.  
--     The list should include the identifier of the ports, the name and country of the city they are located in,  
--     and the number of trips. Ports with no trips leading to them should also be included in the result.
create view view_tr as 
select p_id , country , c_name ,  count(t_id) as count_trips
from sh_port
left join sh_trip on p_id = arrival_port
join sh_city on city = c_id
group by p_id , country , c_name ;


4TH Paper


-- 1. List the full name and date of birth of clients  
--    whose last name starts with a lowercase or uppercase 'b'.
--    Sort the result ascending by last name and then by first name.(2.)
select first_name || ' '||last_name as full_name , date_of_birth
from sh_client
where lower(last_name) like 'b%'
order by last_name , first_name;

-- 2. List the time of departure (without the date),  
--    and the departure and arrival ports for trips that  
--    departed on June 6, 2021. Sort the result by departure time.
select to_char(departure_time,'HH24:MI:SS') as trip_time , departure_port, arrival_port
from sh_trip 
where trunc(departure_time) = DATE '2024-06-02'
order by departure_time;

-- 3. In which months (year, month) were at least 8 orders placed?  
--    The list should be in chronological order.
select to_char(date_of_order,'yyyy mm'),count(o_id)
from sh_order
group by to_char(date_of_order,'yyyy mm')
having count(o_id)>=8
order by to_char(date_of_order,'yyyy mm');

-- 4. Print the type name and description for the ship  
--    named 'SC Rosy'. You may assume that there is only  
--    one ship with that name.
select t_name, t_description
from sh_ship_type 
join sh_ship on sh_type = t_id
where sh_name = 'SC Rosy';

-- 5. Print the name and country of cities where more  
--    than one client comes from. Sort the list  
--    alphabetically by city name.
select c.c_name , c.country 
from sh_city c
join sh_client cl on c.c_id = cl.city
group by c.c_name , c.country  
having count(cl.c_id) > 1
order by c.c_name;

-- 6. List the identifier and name of all ship types,  
--    along with the identifier and name of ships of each type.  
--    Name the type column 'type_name' and the ship column 'ship_name'.  
--    Include ship types with no ships.  
--    Sort by ship type name, then by ship name.
select t_id , t_name as type_name , sh_id , sh_name as ship_name
from sh_ship_type 
left join sh_ship on sh_type = t_id
order by t_name , sh_name;

-- 7. List the identifier, country, and name of cities  
--    with a port from which the ship named 'SC Bella'  
--    has ever departed. You may assume there is only  
--    one ship with that name. Each city should appear  
--    only once in the result.
select distinct c_id , country , c_name
from sh_city 
join sh_port on city = c_id
join sh_trip on departure_port = p_id
where ship in ( select sh_id from sh_ship where sh_name = 'SC Bella');


-- 8. List the name, maximum carrying capacity, and type name  
--    of ships that have not performed a single trip. The  
--    column containing the ship’s name should be named  
--    'ship_name', and the column containing the type’s name  
--    should be named 'type_name'.
select sh_name, max_carrying_capacity , t_name
from sh_ship join sh_ship_type on t_id = SH_TYPE
where sh_id not in (select ship from sh_trip);
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
grant insert on sh_port to public;

-- 11. Change the name of the best-performing ship as follows:  
--     put the name of the ship that has completed the most  
--     trips so far between two asterisks (*). If more than one  
--     ship ties, update all of them.
create table sh_ship_copy5 as (select * from sh_ship);

update sh_ship_copy5
set sh_name = '*'|| sh_name ||'*'
where sh_id in ( select ship from sh_trip  
                group by ship 
                order by count(t_id) desc
                fetch first 1 row with ties);

-- 12. Create a view that lists the last and first name of our  
--     customers, the name and country of the city of their  
--     residence, and the number of their orders. Include  
--     customers with unknown residence or who have never  
--     placed an order.```
CREATE VIEW view_client_orders AS
select last_name , first_name ,c_name , country , count(o_id)
from sh_client cl 
left join sh_city ci on cl.city =ci.c_id
left join sh_order o on o.client_id = cl.c_id
group by  last_name , first_name ,c_name , country


-- 1. List all data of small ports with mobile cranes.  
--    The description must contain 'port size: small' and 'mobile cranes' (in any order). (28.)
select * 
from sh_port
where lower(p_description) like '%port size: small%' and lower(p_description) like '%mobile cranes%';

-- 2. List the identifier of ships performing trips of more than two days,  
--    the trip duration in days (rounded to two decimals) AS duration,  
--    and the departure and arrival port IDs. Include trips lacking an arrival_time  
--    but departed more than two days ago. Sort descending by exact trip duration. (30.)

select ship , ROUND((NVL(arrival_time, SYSDATE) - departure_time),2) AS duration, departure_port, arrival_port
from ship.sh_trip 
where NVL(arrival_time, SYSDATE)- departure_time >2 
order by (NVL(arrival_time, SYSDATE) - departure_time) DESC;

-- 3. On which continents are there more than 20 countries? (39.)
select continent 
from sh_country
group by continent 
having count(country)>20;

-- 4. List the identifier and full name of clients from Italy with both  
--    their phone number and email address given. (46.)
select cl.c_id , first_name||' '||last_name as full_name
from sh_client cl join sh_city city on cl.city = city.c_id
where country = 'Italy' and phone is not null and email is not null;

-- 5. List the full name of clients, in descending order of their last names,  
--    who have placed orders for more than 100 containers in total so far.  
--    Beside the name, print the number of requested containers as well. (56.)
select last_name||' '||first_name as full_name, sum(no_of_containers)
from sh_client cl join sh_order on client_id = c_id
group by last_name, first_name
having sum(no_of_containers)>100 
order by last_name desc;


-- 6. List clients from Italy and their orders: the client’s full name,  
--    email address, phone number, departure_port, arrival_port, and shipping_fee.  
--    Sort descending by shipping_fee. (65.)
select last_name||' '||first_name as full_name, email , phone ,departure_port ,arrival_port ,shipping_fee
from sh_client cl 
join sh_city ci on cl.city = ci.c_id
join sh_order on client_id = cl.c_id
where country = 'Italy' 
order by shipping_fee desc;


-- 7. List the identifier and name of ships that have never arrived at a port  
--    in France as the destination of a trip. (83.)
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
--    Sort by country name and then by city name. (104.)
select distinct c_id , c_name , country from sh_city
where population > 1000000 
or c_id in ( select city from sh_client 
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
--    Assign names to each constraint. (109.)
create table ship_cp1 as ( select * from ship.sh_ship);
alter table ship_cp1 
add primary key(sh_id);

create table sh_ship_repair2(
    ship_id varchar2(10) constraint repair_fk1 references ship_cp1,
    start_time date,
    end_time date,
    price Number(10,2) not null,
    description VARCHAR2(200),
    constraint repair_pk1 primary key(ship_id,start_time),
    constraint repair_ck1 check(end_time>start_time)

);

-- 10. Delete the primary key constraint of your 'sh_port_phone' table. (124.)
alter table sh_port_phone
drop primary key;


-- 11. Our population data are outdated. As one of the steps to update them,  
--    increase the population of the cities of Asian countries by 5%. (162.)
create table sh_city_copy as ( select * from sh_city);
update sh_city_copy 
set population = population *1.05
where country in ( select country from sh_country where continent = 'Asia');

-- 12. Create a view that lists the last and first name of our customers,  
--    the name and country of the city of their residence, and the number of their orders.  
--    Include customers with an unknown residence and those who have never placed an order. (180.)
select last_name , first_name ,c_name , country , count(o_id)
from sh_client cl 
left join sh_city ci on cl.city =ci.c_id
left join sh_order o on o.client_id = cl.c_id
group by  last_name , first_name ,c_name , country;




-- 1.  List the full name and date of birth of clients whose last name starts  
--     with a lowercase or uppercase 'b'. Sort ascending by last name, then first name. (2.)
SELECT first_name || ' ' || last_name AS full_name, date_of_birth 
FROM sh_client
WHERE LOWER(last_name) LIKE 'b%'
ORDER BY last_name, first_name;

-- 2.  List the full name, phone number, and date of birth of clients born during  
--     the summer months (June, July, August). Sort by month of birth, then last name, then first name. (25.)
select first_name|| ' ' || last_name as full_name , date_of_birth, phone
from sh_client
where extract( month from date_of_birth ) in (6,7,8) 
order by extract( month from date_of_birth ) , last_name , first_name ;

-- 3.  Which orders required more than 3 trips to fulfill, and how many trips were needed?  
--     (Each trip counts only once per order, regardless of container count.) List the full name of clients whose phone number starts 
--     List orders by their identifier, sorted descending by trip count. (32.)
select order_id , count(distinct trip_id) as trip_count
from sh_carry
group by order_id
having count(distinct trip_id)>3
order by trip_count desc;

-- 4.  List all data of ports that have a phone number starting with '21' and a description.  
--     Each port should appear only once in the result. (43.)
select distinct p.* 
from sh_port p
join sh_port_phone on port_id = p_id
where phone like '21%' 
and p_description is not null;

-- 5.  How many times did the ship named 'Goliat' depart from each port?  
--     You may assume there is only one ship with that name. Include only ports it departed from at least once.  
--     Sort descending by departure count, then ascending by port ID. (51.)
select departure_port , count(ship)
from sh_ship
join sh_trip on ship = sh_id
where sh_name = 'Goliat'
group by departure_port
order by count(ship) desc, departure_port asc;

-- 6.  List the identifier of ports in Turkey with at least one known phone number.  
--     Each port should appear only once in the result. (63.)
select distinct p_id 
from sh_port
join sh_city on city = c_id
join sh_port_phone on p_id = port_id
where phone is not null
and country = 'Turkey';

-- 7. At which port did the longest trip(s) from the port of Catania (port ID: 'It_Cat') arrive?  
--    Print the identifier of the arrival port as well as the name of the city and country of the port. (88.)
select p_id , c_name , country 
from sh_port join sh_city on c_id = city
where p_id in (
    select arrival_port 
    from sh_trip 
    where departure_port = 'It_Cat'
    order by arrival_time - departure_time desc
    fetch first 1 row with ties
);

-- 8. List the full name of the ten clients who have paid the most for their orders in total so far.  
--    Beside each client’s name, print the total shipping fee paid. (114.)
select first_name||' '||last_name , sum(shipping_fee)
from sh_client 
join sh_order on c_id = client_id
group by first_name||' '||last_name 
order by sum(shipping_fee) desc
fetch first 10 rows with ties;

-- 9. Create a table named 'sh_port_email' storing the email addresses of ports, including:  
--      • p_id   — VARCHAR2(10), FK to sh_port  
--      • email  — VARCHAR2(200)  
--    A port can have multiple emails, so make (p_id, email) the primary key.  
--    Assign names to each constraint. (122.)
create table sh_port_cp1 as ( select * from sh_port);
alter table sh_port_cp1
add primary key (p_id);

create table sh_port_email1(
    p_id varchar2(10) constraint email_fk references sh_port_cp1 ,
    email varchar2(200),
    constraint email_pk primary key(p_id,email)
)
;
-- 10. Delete the primary key constraint of your 'sh_port_phone' table. (137.)
create table sh_port_phone1 as ( select * from sh_port_phone);
alter table sh_port_phone1
add primary key (port_id,phone);
alter table sh_port_phone1 
drop primary key;

-- 11. Delete orders for shipping from any port in Italy with a shipping fee of less than one million. (160.)
delete --select * 
from sh_order
join sh_port on  departure_port = p_id
join sh_city on city = c_id
where country = 'Italy' and shipping_fee < 1000000;

-- 12. Create a view that lists all attributes of the orders, together with the name and country  
--     of the city of the departure port and the name and country of the city of the arrival port. (177.)
CREATE VIEW v_order_ports AS;
SELECT 
  o.*,
  dep_city.c_name   AS dep_city_name,
  dep_city.country  AS dep_country,
  arr_city.c_name   AS arr_city_name,
  arr_city.country  AS arr_country
FROM sh_order o
LEFT JOIN sh_port   dep_p  ON o.departure_port = dep_p.p_id
LEFT JOIN sh_city   dep_city ON dep_p.city     = dep_city.c_id
LEFT JOIN sh_port   arr_p  ON o.arrival_port   = arr_p.p_id
LEFT JOIN sh_city   arr_city ON arr_p.city     = arr_city.c_id;
;

select count(o_id) from sh_order;

select o.*, dep_city.c_name as dep_city , dep_city.country as dep_country , ar_city.c_name as arrival_city , ar_city.country as arr_country
from sh_order o 
join sh_port dep_port on o.departure_port = dep_port.p_id
join sh_city dep_city on dep_port.city = dep_city.c_id
join sh_port ar_port on o.arrival_port = ar_port.p_id
join sh_city ar_city on ar_port.city =ar_city.c_id;





-- 1. List the full name of clients whose phone number starts  
--    with '393' and whose email address is known. (12.)
select first_name || ' ' || last_name as full_name
from sh_client
where phone like '393%' and email is not null;

-- 2. List the identifier of the departure port of trips that  
--    arrived at the port of Catania (port ID: 'It_Cat') in the  
--    2nd half of June 2021 (i.e., after the 15th). Also include  
--    the exact departure and arrival time of those trips. Sort  
--    the result ascending by the exact arrival time. (22.)

select departure_port, departure_time, arrival_time
from ship.sh_trip 
where arrival_port = 'It_Cat'
AND to_char(arrival_time,'yyyy-mm')='2021-06' and extract( day from arrival_time) >15
order by arrival_time asc;

-- 3. On which continents are there more than 20 countries? (39.)
select continent from sh_country
group by continent
having count(country)>20;

-- 4. List the identifier and full name of clients who have placed  
--    at least one order. Sort the result by last name and then by  
--    first name. Each client should appear only once in the result. (45.)
select distinct c_id, last_name ||' '||first_name as full_name
from sh_client
where c_id in ( select client_id from sh_order)
order by full_name;



-- 5. How many orders were placed in each month (year, month) with  
--    an arrival port having mobile cranes? A port has mobile cranes  
--    if its description contains the string 'mobile cranes'. Sort  
--    the result descending by the number of orders. (55.)
select to_char(date_of_order,'mm/yyyy'),count(o_id) 
from sh_order
where arrival_port in ( select p_id from sh_port 
                        where p_description like '%mobile cranes%')
group by to_char(date_of_order,'mm/yyyy')
order by count(o_id ) desc;

-- 6. Determine the lowest and highest cargo weight of containers  
--    carried on trips departing in June 2021. (67.)
select min(cargo_weight), max(cargo_weight) 
from sh_assign a 
join sh_carry ca on ca.container_id =  a.container_id and ca.order_id =  a.order_id
join sh_trip on t_id = trip_id
where to_char(departure_time,'MM YYYY') = '06 2021';


-- 7. Which ship(s) performed the shortest trip(s) from the port of  
--    Catania (port ID: 'It_Cat'), and what was the destination?  
--    Print the name of the ship(s) and the identifier of the  
--    arrival port. (84.)
select sh_name, sh_id , arrival_port
from sh_ship join sh_trip on ship = sh_id
where departure_port = 'It_Cat' 
order by arrival_time - departure_time asc
fetch first 1 row with ties;

-- 8. List the full name and date of birth of our five oldest clients  
--    from Italy. (119.)
select first_name||' '|| last_name as full_name , date_of_birth
from sh_client
where city in ( select c_id from sh_city where country = 'Italy')
order by date_of_birth asc
fetch first 5 rows only;

-- 9. Create a table named 'sh_ship_repair' storing the repair data of ships  
--    and including the following columns (with arbitrary names):  
--      • the identifier of the ship being repaired (VARCHAR2(10)),  
--        with a reference to the 'sh_ship' table  
--      • the start and end time of the repair (DATE; NOT NULL)  
--      • the price of the repair (NUMBER(10,2); NOT NULL)  
--      • the description of the repair (VARCHAR2(200))  
--    Make the primary key a combination of the ship ID and the start  
--    time of the repair. Add a constraint that end time > start time.  
--    Assign a name to each constraint. (124.)

-- 10. Change the maximum length of the 'email' column of your  
--     'sh_client' table to 50 characters and the length of the  
--     'street' column to 100 characters. (134.)
create table sh_client_copy as (select * from sh_client);
alter table sh_client
modify (email varchar2(50), street varchar2(100));



-- 11. Capitalize the last name of the client who has paid the most  
--     shipping fee for their orders in total so far (if there is  
--     more than one such client, change all of them). (165.)
update sh_client
set last_name = upper(last_name)
where c_id in ( select client_id from sh_order 
            group by client_id
            order by sum(shipping_fee) desc
            fetch first 1 row with ties)
;

            

-- 12. Create a view that shows how many ports are located in each country.  
--     Countries with no ports or even no cities should also be included  
--     in the list. (175.)
create view view11 as (
select co.country , count(p.p_id) as nbr_port from sh_country co
left join sh_city ci on co.country = ci.country
left join sh_port p on p.city = ci.c_id
group by co.country);





