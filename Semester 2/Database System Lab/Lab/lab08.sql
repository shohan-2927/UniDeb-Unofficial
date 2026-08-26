-- Create 
/*
Createable objects: - Sequences
					- Table
					- Indexes
					- Views
					- Procedures and Functions
					
Create or Replace
*/

-- Starting with tables

-- Copy the carmechanic.m_car table 
/*
	CREATE TABLE m_car AS 
	SELECT
	FROM
*/
create table m_car as 
select *
from carmechanic.m_car;

-- Create a table that contains the data of all VW cars but no data with the car make
create table volkswagens_1 as 
select car.*
from carmechanic.m_car_model model inner join carmechanic.m_car car
on model.cm_id = car.model_id
where make = 'Volkswagen';


create table volkswagen_2 as
select *
from carmechanic.m_car 
where model_id in (
select cm_id
from carmechanic.m_car_model
where make = 'Volkswagen');
/*
The main elements of the database; we have been working with these so far
We can restrict their contents using constraints
We can create them manually or by "copying" them from another table

Types: NUMBER [n, m] where N and M are elements of the set of natural numbers, n is the number of digits, and m is the number of decimal places
         CHAR [N]
         VARCHAR2[N] --what is the difference between char and varchar?
         DATE
         
         DEFAULT - specifying a default value

Constraints:   UNIQUE
               NOT NULL
               PRIMARY KEY
               REFERENCES table.column
               CHECK condition
               
Table constraints:  UNIQUE
                    PRIMARY KEY
                    FOREIGN KEY ... REFERENCES
                    CHECK
                
*/

-- Create a table for users based on the provided schema and the description:
/*
Table name: USER_TABLE
user_id number primary key
email_address varchar2(50) 
last_name varchar2(25) 
first_name varchar2(25) 
date_of_birth date
place_of_birth varchar2(30)
*/

create table USER_TABLE(
user_id number primary key,
email_address varchar2(50),
last_name varchar2(25),
first_name varchar2(25),
date_of_birth date,
place_of_birth varchar2(30)
);

-- Create another ACCESS table with the following specs:
/*
	access_id number primary key
	owner number ? USER_TABLE user_id
	active boolean
*/

create table user_access (
    access_id number primary key,
    owner_number number references user_table(user_id),
    active number(1,0)
);

-- ALTER, modifications
/*
Table modifications: ADD table constraint
				  ADD column definition
                  MODIFY column definition
                  MODIFY constraint
                  DROP column
                  DROP constraint
                  RENAME COLUMN old_name TO newname
                  RENAME CONSTRAINT
                  RENAME TABLE new_table_name
*/

-- Drop the birhtplace from the user table
alter table user_table
drop column place_of_birth;

-- Make the email address unique
alter table user_table
add constraint email_u unique (email_address);

-- Add valid_to field to the ACCESS table
alter table user_access
add valid_to date;

-- Rename the date_of_birth field to birth_date
alter table user_table
rename column date_of_birth to birth_date;

-- TRUNCATE
-- Truncate our Volkswagen table, but let the structure be
truncate table volkswagens_1;

select *
from volkswagens_1;

-- DROP 
-- Drops literally anything needed in the database 
-- Drop the user table
drop table user_table cascade constraints;

-- Drop the ACCESS table
drop table user_access;

-- Drop the testing VW table 
drop table volkswagens_1;
drop table volkswagen_2;

-- DROP TABLE table_name [CASCADE CONSTRAINTS] [PURGE]
/*
CASCADE CONSTRAINTS - Also deletes rows bound by foreign key constraints
PURGE - Frees up all storage space associated with the dropped object
*/

-- Try to create a table, which stores the red cars, that were repaired in last 5 years
create table red_cars as 
select car.*
from carmechanic.m_car car inner join carmechanic.m_repair rep on car.c_id = rep.car_id
where color = 'red' and
months_between(sysdate, start_date)/12 < 5;