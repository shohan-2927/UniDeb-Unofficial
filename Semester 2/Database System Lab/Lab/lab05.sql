-- Inner select
-- Insert a lookup into a pervious one 
-- Dividing each question into one or multiple sub-questions
-- sub queries

-- Which car was pricier than the most expensive VW?
-- 1 - how much was the most expensive VW?
select max(first_sell_price)
from carmechanic.m_car_model model inner join carmechanic.m_car car
on model.cm_id = car.model_id
where make = 'Volkswagen';
-- 2 - What was pricier than that?
select *
from carmechanic.m_car
where first_sell_price > (select max(first_sell_price)
from carmechanic.m_car_model model inner join carmechanic.m_car car
on model.cm_id = car.model_id
where make = 'Volkswagen');

-- Which car was bought first?
-- 1 - When was the first buy?
select min(first_sell_date)
from carmechanic.m_car;
-- 2 - What was bought that time?
select make, cm_name
from carmechanic.m_car_model model inner join carmechanic.m_car car
on model.cm_id = car.model_id
where first_sell_date = (select min(first_sell_date)
from carmechanic.m_car);

-- Which mechanic earns the best?
-- How much is the highest pay?
select max(salary)
from carmechanic.m_works_for;
-- Who makes that kind of money?
select *
from carmechanic.m_works_for works inner join carmechanic.m_mechanic mechanic
on works.mechanic_id = mechanic.m_id
where salary = (select max(salary)
from carmechanic.m_works_for);

--alternative solution (without JOIN):
select *
from carmechanic.m_mechanic
where m_id = (select mechanic_id
from carmechanic.m_works_for
order by salary desc
fetch first row only);

-- A customer turned to us with the following request:
-- After analyzing the current car-price range he found that
-- He could either afford an expensive fiat (1-5th most expensive) or a cheaper VW (1-5 cheapest) 
-- He is okay with any brand
-- But the color must be red 

--solution: first we try to find the fifth most expensive fiat
select first_sell_price
from carmechanic.m_car_model model inner join carmechanic.m_car car
on model.cm_id = car.model_id
where make = 'Fiat'
order by first_sell_price desc
offset 4 rows fetch first 1 row only;
-- then we find the fifth cheapest VW
select first_sell_price
from carmechanic.m_car_model model inner join carmechanic.m_car car
on model.cm_id = car.model_id
where make = 'Volkswagen'
order by first_sell_price asc
offset 4 rows fetch first 1 row only;
--now we filter by the color, use those subqueries inside the parenthesis
select *
from carmechanic.m_car_model model inner join carmechanic.m_car car
on model.cm_id = car.model_id
where first_sell_price > (select first_sell_price
from carmechanic.m_car_model model inner join carmechanic.m_car car
on model.cm_id = car.model_id
where make = 'Fiat'
order by first_sell_price desc
offset 4 rows fetch first 1 row only)
and first_sell_price < (select first_sell_price
from carmechanic.m_car_model model inner join carmechanic.m_car car
on model.cm_id = car.model_id
where make = 'Volkswagen'
order by first_sell_price asc
offset 4 rows fetch first 1 row only) 
and details like '%gasoline%'
and color = 'red';

-- How many students were born when the most students were born? (library)
select extract(year from birth_date), count(*)
from book_library.customers
where category = 'student'
group by extract(year from birth_date)
order by count(*) desc
fetch first row only;


-- Let's look up the rarest cars in the database 
-- We need car types that has at most 2 cars in the database
select make, cm_name, count(*)
from carmechanic.m_car_model model
group by make, cm_name
having count(*) <= 2;

-- Which workshop have never dealt with a VW Touran?
--Who DID repair a VW Touran
select workshop_id
from carmechanic.m_car_model model inner join carmechanic.m_car car
on model.cm_id = car.model_id 
inner join carmechanic.m_repair rep on car.c_id = rep.car_id
where model.make = 'Volkswagen' and model.cm_name = 'Touran';
--Who is not on the list
select *
from carmechanic.m_workshop
where w_id not in (select workshop_id
from carmechanic.m_car_model model inner join carmechanic.m_car car
on model.cm_id = car.model_id inner join carmechanic.m_repair rep
on car.c_id = rep.car_id
where model.make = 'Volkswagen' and model.cm_name = 'Touran');


-- Whose car is still at the repair shop?
select o_name, c_id, start_date, end_date
from carmechanic.m_owner owner inner join carmechanic.m_owns owns
on owner.o_id = owns.owner_id
inner join carmechanic.m_car car on owns.car_id = car.c_id
inner join carmechanic.m_repair rep on car.c_id = rep.car_id
where end_date is null;

-- Which car didn't need repairment before?

-- all and any
-- hr schema 
-- Who earns more than anyone from the IT department?
--first we try to find the salaries of employees from IT department
select salary
from hr.departments dep inner join hr.employees emp
on dep.department_id = emp.department_id
where department_name = 'IT';
-- now the main query
select *
from hr.employees 
where salary > any (select salary
from hr.departments dep inner join hr.employees emp
on dep.department_id = emp.department_id
where department_name = 'IT');
-- Who earns more than everyone from the IT department?
select *
from hr.employees 
where salary > all (select salary
from hr.departments dep inner join hr.employees emp
on dep.department_id = emp.department_id
where department_name = 'IT');

-- Are there any repairments that were more expensive than any of the car evaluations?
 select * 
 from carmechanic.m_repair
 where repair_cost > any (select price
 from carmechanic.m_car_evaluation);
 
-- List the all the cars where at least one of the repairment costs is higher than 50.000
select *
from carmechanic.m_repair
where repair_cost > 50000;

-- List the all the cars where all the repairment costs is higher than 50.000
select *
from carmechanic.m_repair
where repair_cost > 50000;

-- Correlated queries
-- List cars which had repairments more expensive than their first selling price
-- List every owner's latest car
select *
from carmechanic.m_owner;
-- 1. find 515's latest car id
select car_id
from carmechanic.m_owns
where owner_id = 515
order by date_of_buy desc
fetch first row only;
-- now the main query, we don't want to use the number 515
select *
from carmechanic.m_car car inner join carmechanic.m_owns owns
on car.c_id = owns.car_id
inner join carmechanic.m_owner owner_outer
on owns.owner_id = owner_outer.o_id
where c_id = 
(select car_id
from carmechanic.m_owns
where owner_id = owner_outer.o_id
order by date_of_buy desc
fetch first row only);

-- List every car with their most expensive repairment cost
--for example, we will work with c_id = 103
select repair_cost
from carmechanic.m_repair
where car_id = 103
order by repair_cost desc
fetch first row only;
-- now the main query
select *
from carmechanic.m_car car_outer inner join carmechanic.m_repair rep
on car_outer.c_id = rep.car_id
where repair_cost = (select repair_cost
from carmechanic.m_repair
where car_id = car_outer.c_id
order by repair_cost desc
fetch first row only);
