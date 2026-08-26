-- Create the tables and relationships shown in the diagram, taking the following into account:
/*
EMPLOYEE Table: 
    - Employee IDs are unique and are formed as follows: the first letter of the first name, the last name, and a number derived from a sequence
    example: Andrea Example AE1
	- The email address is first name + "." + last name + "@telesoft.com"
    - The group ID points to the foreign key of the group table
    - In the case of a direct manager, the table points to itself; the field may be empty
    - The group leader and the direct supervisor are not necessarily the same person
*/
create sequence emp_seq
start with 1
increment by 1;

create table employee(
employee_id varchar2(50) primary key,
name varchar2(50),
email varchar2(50) constraint email_u unique,
direct_manager varchar2(50),
position number(2,0)
);

alter table employee
add constraint self_join_fk foreign key (direct_manager) references employee(employee_id);
/*
GROUP TABLE:
    - The group leader is selected from the EMPLOYEE table
    - The group name abbreviation can be up to 5 characters long (short name of the group)
*/
create table emp_groups(
group_id number primary key,
teamlead_id varchar2(50) references employee(employee_id),
full_name varchar2(30),
short_name char(5)
);

alter table employee
add group_id number references emp_groups(group_id);
/*
PROJECT TABLE:
	- The manager, i.e., the PM or PO, is not necessarily the group leader; this is the same role as a Software Developer
    - Every project name is unique
    - The start date cannot be null
    - The start date must be earlier than the planned completion date
*/
create table emp_project(
project_id number primary key,
manager_id varchar2(50) references employee(employee_id),
name varchar2(100) constraint uni_name_u unique,
start_date date,
completion_date date,
constraint start_date_sooner_check check (start_date < completion_date)
);

-- PROJECT_GROUPS table
create table project_groups(
project_id number references emp_project(project_id),
group_id number references emp_groups(group_id),
constraint pro_grp_pk primary key (group_id, project_id)
);


-- Let's populate the tables with test data!
-- Let's manually create the following:
-- Add ourselves as company managers to the EMPLOYEE table
select emp_seq.nextval
from dual;

insert into employee(employee_id, name, email, group_id, position)
values('jahmed'||emp_seq.nextval, 'Jamil Ahmed', 'jamil.ahmed@telesoft.com', NULL, 1);

/*
Let's recruit! 
From the library schema, let's search for non-student residents of Debrecen and Eger to join our company
*/
insert into employee(employee_id, name, email, group_id, position)
select lower(substr(first_name, 1, 1)||last_name) || emp_seq.nextval as employee_id,
first_name || ' ' || last_name as name,
lower(first_name) || '.' || lower(last_name) || '@telesoft.com' as email,
null as group_id,
null as position
from book_library.customers
where category <> 'student'
and
(address like '%, Debrecen' or address like '&, Eger');

--let's check our table, how it looks now after inserting the values
select *
from employee;

/*
Let’s create the following groups:
Internal IT, abbreviated as IIT
Core System Design and Development Division: CSDDD
System Testing and Integration Team: STIT
Group leaders can be freely assigned 
*/
insert into emp_groups(group_id, teamlead_id, full_name, short_name)
values (1, 'jsmith188', 'Internal IT', 'IIT');
insert into emp_groups(group_id, teamlead_id, full_name, short_name)
values (2, 'levans182', 'Core System Design', 'CSDDD');
insert into emp_groups(group_id, teamlead_id, full_name, short_name)
values (3, 'jturner186', 'System Testing', 'STIT');

select *
from emp_groups;

/*
Let’s create the following project:
The project manager is a freely chosen employee who is not a group leader
Name: UUSI2.ESR Procurement Software
The project begins on May 5 and ends in 2 years
The CSDDD and STIT are working on the project
*/
insert into emp_project(project_id, manager_id, name, start_date, completion_date)
values(1, 'dlewis185', 'UUSI2.ESR Procurement Software', to_date('2026.05.05','yyyy.mm.dd'), to_date('2028.05.05','yyyy.mm.dd'));

--let's check the table
select *
from emp_project;
/*
Let’s recruit 1 intern (student) for the CSDDD
*/
insert into employee(employee_id, name, email, group_id, position)
select lower(substr(first_name, 1, 1)||last_name) || emp_seq.nextval as employee_id,
first_name || ' ' || last_name as name,
lower(first_name) || '.' || lower(last_name) || '@telesoft.com' as email,
2 as group_id,
null as position
from book_library.customers
where category = 'student' 
and rownum = 1;

--let's save all the transactions till now
commit;
/*
One of our employees got married and took her husband’s surname with a hyphen, e.g., Good-Campbell Emma
Let’s mark this in the database by simply changing her name
*/

select *
from employee;
--Emma good-campbell
update employee
set name = 'Emma Good-Campbell'
where employee_id = 'ecampbell187';
commit;

/*
Let’s set up the following hierarchy:
We should have exactly 2 people working under us, the leaders of the 3 teams
IIT: 1 manager, 2 deputy managers under them, and 2 employees per deputy manager
CSDDD: 1 manager, 3 employees, and 1 intern under them
STIT: 1 manager, 1 deputy manager, and 3 employees
*/


/*
Let’s permanently lay off 1 employee
*/
delete
--select *
from employee
where employee_id = 'ecampbell187';

/*
Today we also need to lay off another employee from the ATFD. This is final
He was coordinating the intern, so if no one takes over mentoring, the intern will also be laid off (savepoint)
The intern stays (rollback)
*/
select *
from employee;

savepoint layoff;

delete 
from employee
where employee_id = 'ssmith18';

rollback layoff;


