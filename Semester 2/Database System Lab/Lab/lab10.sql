-- Sequences - complete  
/*
What we already know: - It is used to generate artificial keys
                       - It always generates a new sequence number
                       - You can specify where to start
                       - The sequence number is generated regardless of the event's outcome
What we don’t know yet: 
- Increment by - by how much the value should increase between two sequence numbers (BC)
- Minvalue - The lowest value it uses
- Start with - It starts with this
- Maxvalue - The highest assigned number
- NoMaxValue - No upper limit 
- NoMinValue - No lower limit
- CYCLE/NOCYCLE
- CACHE - How many numbers should be cached for faster access
  Define it as follows: CEIL((MAXVALUE - MINVALUE) / ABS(INCREMENT))
- NoCache
- Order/NOORDER - Ensures that numbers are assigned in the order of requests
*/

-- Let's create the following sequences and test them 
-- A sequence where the increment by value is 10000, has no upper limit, but starts at 10000

create sequence first_seq
start with 10000
nomaxvalue
increment by 10000;

--let's check
select first_seq.nextval
from dual;

/*
A sequence where: 
    The starting number of the sequence is 1
    The upper limit is 15
	the cache is 2
    and a value can be assigned multiple times
*/
create sequence second_seq
start with 1
cache 2
maxvalue 15
cycle;

select second_seq.nextval
from dual;


/*
A sequence similar to the previous one, but using NOCYCLE instead of CYCLE
*/

create sequence second_seq_2
start with 1
cache 2
maxvalue 5
nocycle;

select second_seq_2.nextval
from dual;

cl scr;

-- Your sequences are here: user_sequences

-- A sequence where the minvalue is -3, the start with is 1, and make it cycle

-- Views
/*
Why are they useful? 
- They can restrict what a specific user can access 
- They can save queries that we've written at least a thousand times
- Or ones that might be needed in an application -> data migration, specific users
- They behave similarly to a table 

-- Alter View
-- Add read only
-- Drop read only
-- Compile
-- create or replace
*/

-- Let’s create a view on our EMPLOYEE table that retrieves email addresses and names
create or replace view emp_view_1 as
select name, email
from employee;

select *
from emp_view_1
where email = 'lisa.smith@telesoft.com';

-- Add a new employee
insert into employee(employee_id, name, email, group_id, position)
values('joshuaB'||emp_seq.nextval, 'Joshua Bobber', 'jba@telesoft.com', NULL, 1);
commit;

select *
from emp_view_1;
select *
from employee;

alter view emp_view_1
compile;


-- Retrieve the view’s contents
-- Add a new column to the table
create or replace view emp_view_2 as 
select *
from employee;

select *
from emp_view_2;

alter table employee
add phonetical_writing varchar2(70);

alter view emp_view_2
compile;

-- View the view again
select *
from emp_view_2;

-- delete a field
alter table employee
drop column phonetical_writing;

-- now view the view again
select *
from emp_view_2;

-- drop the view
drop view emp_view_2;

-- We listed the VW cars numerous times, create a view to list all the data of VW cars
create view volkswagens as 
select *
from carmechanic.m_car_model make inner join carmechanic.m_car car
on make.cm_id = car.model_id
where make.make = 'Volkswagen';

select *
from volkswagens;

-- Create a view on car owners, their cars and the car model's details
-- but instead of using ID-s create one piece of ID for each row from the cars' and the owner's id 
create or replace view car_owners as
select o_id||car_id as unique_id, o_name, make|| ' ' ||cm_name as car, details 
from carmechanic.m_owner owner inner join carmechanic.m_owns owns on owner.o_id = owns.owner_id
inner join carmechanic.m_car car on owns.car_id = car.c_id
inner join carmechanic.m_car_model model on car.model_id = model.cm_id;

select *
from car_owners;

-- Synonyms
/*
Similar to other programs, synonyms are used to refer to another object (preferably a shorter one)
Can point to: - A table
          - A view
          - A sequence
          - A function or procedure
          - Another synonym
          - Another database
*/

-- Create a synonym for the TEST_CYCLE_SEQ sequence
create synonym short_name for first_seq;

-- Let's try it
select short_name.currval --return the current value
from dual;

-- Delete the sequence
drop sequence first_seq;

-- Create a synonym named CARS for the szerelo.sz_auto table, then use it in a query
create synonym cars for carmechanic.m_car;

select *
from cars;

-- Look here: user_synonyms
select *
from user_synonyms;

create or replace view own_user_synonyms as 
select synonym_name, table_owner, table_name, db_link, origin_con_id
from all_synonyms
where owner = 'U_JZT75Y';

select *
from own_user_synonyms;