-- List all the Volkswagen models
select cm_name 
from carmechanic.m_car_model
where make = 'Volkswagen'; 

-- List the not Volkswagen models
select cm_name 
from carmechanic.m_car_model
--where make != 'Volkswagen';
where make <> 'Volkswagen';

-- List the German (Volkswagen, Audi, Mercedes Benz, Opel, BMW) brands' models
select * 
from carmechanic.m_car_model
where make in ('Volkswagen', 'Audi', 'Mercedes', 'Benz', 'Opel', 'BMW');

-- List cars where color is unknown 
select *
from carmechanic.m_car
where color is NULL or color = '';

-- List only the cars where color is not unknown 
select *
from carmechanic.m_car
where color is not NULL or color != '';

-- Look up the cars that aren't the part of the Volkswagen Group (Volkswagen, Fiat, Audi, Skoda)
select * 
from carmechanic.m_car_model
where make not in ('Volkswagen', 'Fiat', 'Audi', 'Skoda');

-- Look up cars that are not Opel nor Golf
select * 
from carmechanic.m_car_model
where cm_name != 'Golf' and make != 'Opel';

-- Look up car makes that's name starts with G
select * 
from carmechanic.m_car_model
where cm_name like 'G%';

-- Look up car makes where the name contains 'o'
-- % represents zero or more characters
select * 
from carmechanic.m_car_model
where lower(make) like '%o%';

-- Look up car makes that's name is exactly 4 characters
-- _ (underscore) represents a single character
select * 
from carmechanic.m_car_model
where cm_name like '____';

-- Look up car makes containing at least 2 'a's 
select * 
from carmechanic.m_car_model
where cm_name like '%a%a%';

-- Look up car makes that's name contains exactly 2 'a'-s
select * 
from carmechanic.m_car_model
where cm_name like '%a%a%'
and
cm_name not like '%a%a%a%';

-- Look up car makes that's name's second character is an o
select * 
from carmechanic.m_car_model
where cm_name like '_o%';

--  List all student tables from "all_tables"
select *
from all_tables
where owner like 'U\_%' escape '\';

-- Select all the cars sold between 600k and 1.5M HUF for their first sale
select * 
from carmechanic.m_car
where first_sell_price between 600000 and 15000000;

-- List the cars that were sold in 2007
select * 
from carmechanic.m_car
where extract(year from first_sell_date) = 2007;

select * 
from carmechanic.m_car
where first_sell_date between to_date('2007.01.01','yyyy.mm.dd')
and to_date('2007.12.31','yyyy.mm.dd')

-- What's the year today?
select extract(year from sysdate)
from dual;

-- List each car's licence in alphabetical order where the licence plate is not 6 chars long
select * 
from carmechanic.m_car
where length(license_plate_number) != 6
order by license_plate_number asc;

-- Check our user's name in the dual
select user
from dual;

-- Handling strings
select substr('123456789', 3, 4)
from dual;

select instr('987654321', '4')
from dual;

select trim('        whitespace    ')
from dual;

-- Where do the book library customers live? 
-- Use substring and trim 
select distinct substr(address, instr(address, ', ')+2)
from book_library.customers;

-- upper, lower, initcap

-- Find the library customers who had Bday yesterday!
select *
from book_library.customers
where extract(month from birth_date) = extract(month from sysdate)
and extract(day from birth_date) = extract(day from sysdate);

-- Let's find our Virgo readers  (Virgo 23rd August - 22nd September)
select *
from book_library.customers
where (extract(month from birth_date) = 8 and
    extract(day from birth_date) between 23 and 31) --August Virgo
or 
(extract(month from birth_date) = 9 and
    extract(day from birth_date) between 1 and 22); --September Virgo
        

-- Find the Virgo men in the list of readers 
select *
from book_library.customers
where gender = 'm' and
((extract(month from birth_date) = 8 and
    extract(day from birth_date) between 23 and 31) --August Virgo
or 
(extract(month from birth_date) = 9 and
    extract(day from birth_date) between 1 and 22)
);

-- Find writers who would be (or are) at least 100 years old now
select first_name, last_name, birth_date
from book_library.authors
where extract(year from sysdate) - extract(year from birth_date) >= 100;

select first_name, last_name, birth_date
from book_library.authors
where (sysdate - birth_date)/365.25 >= 100;

select first_name, last_name, to_char(birth_date, 'dd.mm.yyyy')
from book_library.authors
where (months_between(sysdate, birth_date)/12) >=100;

-- Find writers whose name starts with letters A to F
select *
from book_library.authors
where last_name between 'A' and 'Fz'; --dictionary-like range


select *
from book_library.authors
where upper(substr(last_name,1,1)) between 'A' and 'F';