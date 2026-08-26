-- Warming up 
/*
Which cars' colors aren't null or one of the three base colors
('black', 'white', 'grey')
*/
select *
from carmechanic.m_car
where color is not null
and
color not in ('black', 'white', 'gray');

/*
I thought about a car:
- There's at least one 'e' and 'o' in the brand's name
- it's ID is between 1 and 5
- The car make's name's length is 4 chars
- The first word of it's description is gasoline
*/
select *
from carmechanic.m_car_model
where (make like '%o%' and make like '%e%')
and 
(cm_id between 1 and 5)
and 
(length (cm_name) = 4)
and
(substr(details,1, instr(details, ',')-1) = 'gasoline');

-- Look up Library customers whose First and Last names' first letter is the same 
select *
from book_library.customers
where substr(last_name,1,1) = substr(first_name,1,1);

-- Group by and aggregation
-- Functions: count, min, max, sum, avg
select color, count(*)
from carmechanic.m_car
group by color;

-- Count
-- Count the cars in the database
select count(*)
from carmechanic.m_car;

-- Count the unique colors
select count(distinct color)
from carmechanic.m_car;

-- Count the unique colors outside the base colors
select count(distinct color)
from carmechanic.m_car
where color not in ('white', 'black', 'grey');

-- Count how many cars belong to each color
select color, count(*)
from carmechanic.m_car
group by color;

-- Repeat, but order them by the numbers, nulls at the end
select color, count(*)
from carmechanic.m_car
group by color
order by count(*) nulls last;

-- Count the makes in the database for each brand
select make, count(cm_name)
from carmechanic.m_car_model
group by make;

-- Min/Max

-- What was the highest price they sold a car for?
select max(first_sell_price)
from carmechanic.m_car;

-- When was the first car sold?
select min(first_sell_date)
from carmechanic.m_car;

-- What was the highest price a red car was sold for?
select max(first_sell_price)
from carmechanic.m_car
where color = 'red';

-- What was the highest and lowest price for each month? (without the year)
select extract(month from first_sell_date) as month, min(first_sell_price) as "LOWEST", 
max(first_sell_price) as "HIGHEST"
from carmechanic.m_car
group by extract(month from first_sell_date)
order by extract(month from first_sell_date);

-- What's the price range the database sells cars for?
select min(first_sell_price), max(first_sell_price)
from carmechanic.m_car;

-- SUM
-- What money did people spend on cars totally when they got new ones?
select sum(first_sell_price)
from carmechanic.m_car;

-- AVG
-- What is the average price for each color?
select color, avg(first_sell_price)
from carmechanic.m_car
group by color;

-- Repeat, but only work with cars above 1.5 million!
select color, avg(first_sell_price)
from carmechanic.m_car
where first_sell_price > 1500000
group by color;

-- Only list cars where the average car price is over 6 million
select color, avg(first_sell_price)
from carmechanic.m_car
where first_sell_price > 1500000
group by color
having avg(first_sell_price) > 6000000;


-- What is the average salary of a car mechanic? 
select avg(salary)
from carmechanic.m_works_for;

-- Mix and match!

-- What is the average age for library customers with first and last names' first character being the same
select avg((sysdate-birth_date)/365.25)
from book_library.customers
where substr(first_name,1,1) = substr(last_name,1,1);

-- How old are mechanic make in average by city?
select substr(address,1, instr(address, ',')-1), avg(sysdate-birth_date)/365.25
from carmechanic.m_mechanic
group by substr(address,1, instr(address, ',')-1);

-- How much do blue cars sell for in average after 2010?
select round(avg(first_sell_price),2)
from carmechanic.m_car
where color = 'blue' and extract(year from first_sell_date) > 2010;


-- Which publishers published more than 2 science fiction, thriller or history books? Order by their name!
select publisher
from book_library.books
where lower(topic) in ('science fiction','thriller','history')
group by publisher
having count(topic)>2
order by publisher;