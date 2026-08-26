-- Warmup from pervious classes

-- Who bought their car back? 
-- first let's find out the owner id
select owner_id, car_id, count(*) as appearance
from carmechanic.m_owns owns
group by owner_id, car_id
having count(*) > 1;
-- main query
select o_name
from carmechanic.m_owner
where o_id in (select owner_id
from carmechanic.m_owns owns
group by owner_id, car_id
having count(*) > 1);

-- Which repair shops dealt with the Volkswagen Touran already?
select w_name
from carmechanic.m_car_model model inner join carmechanic.m_car car
on model.cm_id = car.model_id
inner join carmechanic.m_repair rep
on car.c_id = rep.car_id
inner join carmechanic.m_workshop ws
on rep.workshop_id = ws.w_id
where cm_name = 'Touran' and make = 'Volkswagen';

-- who were born when the most students were born? (library)
select *
from book_library.customers
where extract(year from birth_date) = (
select extract(year from birth_date)
from book_library.customers
where category = 'student'
group by extract(year from birth_date)
order by count(*) desc
fetch first row only);


-- Set operations
-- Based on set operations in mathematics: intersect, union and minus
-- They work almost the same

-- Intersect
-- Look up first names that belong to both readers and writers (library)
select first_name
from book_library.authors
intersect
select first_name
from book_library.customers;

-- Union
-- Look up names that belong to either readers, writers or both
select first_name
from book_library.authors
union
select first_name
from book_library.customers;

-- Minus
-- Look up names that belong to writers but never to readers
select first_name
from book_library.authors
minus
select first_name
from book_library.customers;

-- Look up Thrillers books that weren't borrowed by people living in Debrecen
select title
from book_library.books
where book_id in (
select books.book_id
from book_library.books books left outer join
book_library.book_items items
on books.book_id = items.book_id
left outer join book_library.borrowing bor
on items.book_item_id = bor.book_item_id
where topic = 'Thriller' --we are fetching the book id of thriller books after joining tables, left outer, because we need all thriller books even if they were not borrowed
minus
select book_id
from book_library.book_items items inner join
book_library.borrowing bor
on items.book_item_id = bor.book_item_id
inner join book_library.customers cust --inner join, because we only the books that were borrowed
on bor.customer_id = cust.library_card_number
where cust.address like '%, Debrecen'); -- here we minus the book id which were borrowed by Debreceni people

-- Look up writers who didn't write Thrillers yet
select first_name, last_name
from book_library.authors
minus
select first_name, last_name
from book_library.books books inner join book_library.writing wrt
on books.book_id = wrt.book_id inner join book_library.authors authors
on wrt.author_id = authors.author_id
where topic = 'Thriller';


-- Or the 2 cheapest books of Agatha Christie
select title, price
from book_library.authors auth inner join book_library.writing wr on auth.author_id = wr.author_id
inner join book_library.books bk on wr.book_id = bk.book_id
where last_name = 'Christie' and first_name = 'Agatha'
order by price desc
fetch first 2 rows with ties;

-- Our pervious customer calls us again with the following request:
-- He is looking for a repair shop for their car:
-- He has a Skoda, so he is looking for an experienced repair shops in VW and Skoda, with at least 10 repairs behind them
-- But he doesn't like "Pataki Alex" so won't visit his repair shop at all
-- Where can he go? 
select w_name, count(*)
from carmechanic.m_repair rep inner join carmechanic.m_workshop ws on rep.workshop_id = ws.w_id
inner join carmechanic.m_mechanic mech on ws.manager_id = mech.m_id
where car_id in (
select c_id
from carmechanic.m_car_model model inner join carmechanic.m_car car on model.cm_id = car.model_id
where make in ('Volkswagen','Skoda'))
and m_name <> 'Pataki Alex'
group by w_name
having count(*) >= 10;


-- In 2000 Volkswagen bought Skoda and replaced all it's parts' with their own
-- How many Volkswagens and pretend-Volkswagens are there in the database?
select make, count(*)
from carmechanic.m_car_model model inner join carmechanic.m_car car on model.cm_id = car.model_id
where make in ('Volkswagen','Skoda')
group by make;


-- Top N analysis - already met
-- Finding the top N records, with offset

-- before Oracle 12 
/*
select *
from (select *
from szerelo.sz_auto
order by azon)
where rownum <= 10;
*/

-- And then
select *
from szerelo.sz_auto
order by azon
fetch first 10 rows only;

-- fetch first 10 rows with ties

-- fetch first 5 percent rows with only

-- fetch first 5 percent rows with ties

-- Data dictionaries 
select *
from dict; --dictionary

select *
from tabs;

select *
from obj;

select *
from all_tables;

select *
from all_tab_columns;

select *
from v$version;




