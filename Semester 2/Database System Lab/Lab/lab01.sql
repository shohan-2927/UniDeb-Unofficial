-- Your very own example query
SELECT *
FROM carmechanic.m_car;

-- Let's look up the other schemas (except the ship)
select *
from book_library.customers;

select *
from olympics.o_countries;

-- Select every data from the car table
SELECT *
FROM carmechanic.m_car;

-- Only select License plate number, first sell date and price
SELECT c_id, to_char(first_sell_date, 'yyyy.mm.dd'), first_sell_price
FROM carmechanic.m_car;

-- Select every car brand
SELECT brand as "Name"
FROM carmechanic.m_car_make;

-- Select every color, each value shall appear only once!
SELECT distinct color
FROM carmechanic.m_car;

-- Select every car's license plate no. and their color. If no color provided add 'champagne' instead
SELECT license_plate_number, nvl(color, 'champagne') as "COLOR"
FROM carmechanic.m_car;

-- List every car brand from the Car model table, but be sure they are unique
SELECT distinct make
FROM carmechanic.m_car_model;

-- Select every car's id, license plate and formatted date of first selling (yyyy.mm.dd hh24:mi:ss)
select c_id, license_plate_number, to_char(first_sell_date, 'yyyy.mm.dd hh24:mi:ss')
from carmechanic.m_car;

-- Select the birthyear of each mechanic
select m_name, extract(year from birth_date) as birth_year
from carmechanic.m_mechanic;

-- How old are you? Calcuate with the database!
SELECT (sysdate-to_date('2003.04.15','yyyy.mm.dd'))/365.25
FROM dual;
SELECT months_between(sysdate,to_date('2003.04.15','yyyy.mm.dd'))/12
FROM dual;

-- there are trunc, floor, ceil, round functions to explore

-- Select the month from dual 
SELECT extract(month from sysdate)
FROM dual;

-- What is the date of our next lesson? (1 week between each class)
select sysdate + 7
FROM dual;

-- How long is one semester? Calculate with the database!
select round(months_between(to_date('2026.12.15','yyyy.mm.dd'),to_date('2026.09.08','yyyy.mm.dd')),2)
from dual;
select to_date('2026.05.16', 'yyyy.mm.dd') - to_date('2026.02.09', 'yyyy.mm.dd')
from dual;

-- Select the mechanics in age order (youngest → oldest)
SELECT *
FROM carmechanic.m_mechanic
order by birth_date desc;

-- Select the cars by their first selling date. If we don't know when they are sold, then bring them to the end of the result
SELECT *
FROM carmechanic.m_car
order by first_sell_date nulls last;

-- Select the selling year of each car, with their licence plate in alphabetical order
SELECT extract(year from first_sell_date), license_plate_number
FROM carmechanic.m_car
order by extract(year from first_sell_date) nulls last, license_plate_number;

-- Select the cars by color order (if color not known to the end), and if having the same color then reverse age order (oldest first)
SELECT color
FROM carmechanic.m_car
order by color nulls last;

/* By the first month, each car's value drops 50%.
 * Select each car's "halving date" and their new price
 */
 
select license_plate_number, first_sell_date + 30, first_sell_price/2
from carmechanic.m_car; 
select license_plate_number, add_months(first_sell_date, 1), first_sell_price * 0.5
from carmechanic.m_car;
 

-- How many days till Valentine's day?
select ceil(to_date('2026.02.14', 'yyyy.mm.dd') - sysdate)
from dual;

-------WHERE CLAUSE---------------

-- Select only the gold cars
select *
from carmechanic.m_car
where color = 'gold';


-- Select all Volkswagen car makes 
select *
from carmechanic.m_car_model
where make = 'Volkswagen';

-- Select the car make with id 2
select cm_id, make
from carmechanic.m_car_model
where cm_id = 2;

