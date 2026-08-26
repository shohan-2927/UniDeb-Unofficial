-- List people and their birth date who have 2 'a'-s in their name and students with the same data as well
select first_name || ' ' || last_name as "NAME", birth_date
from book_library.customers
where 
(lower(first_name || last_name) like '%a%a%' and
lower(first_name || last_name) not like '%a%a%a%')
or
category = 'student';

-- List book themes with how many times they were borrowed
select topic, count(*)
from book_library.books books left outer join book_library.book_items item on books.book_id = item.book_id
left outer join book_library.borrowing bor on item.book_item_id = bor.book_item_id
group by topic
order by count(*) desc;


SELECT topic, COUNT(br.book_item_id) AS borrow_count
FROM book_library.books b LEFT JOIN book_library.book_items bi ON b.book_id = bi.book_id
LEFT JOIN book_library.borrowing br ON bi.book_item_id = br.book_item_id
GROUP BY topic
ORDER BY borrow_count DESC;

--which one is correct? i am confused now. for counting the borrowing books individually, run this:
select *
from book_library.borrowing;


-- List student users from the all_users table 
select *
from all_users
where username like 'U_%';

-- List repairment happened in the "Harmat Kft."'s workshop, did on red, blue or black cars, and their finished repairment was more than 3 days
select rep.* -- only fetches result from this table
from carmechanic.m_car car inner join carmechanic.m_repair rep on car.c_id = rep.car_id
inner join carmechanic.m_workshop ws on rep.workshop_id = ws.w_id
where w_name = 'Harmat Kft.' and
color in ('red', 'blue', 'black') and
end_date - start_date >3;


-- Who was the last owner of car BBB230
select owner_id, o_name
from carmechanic.m_car car_outer inner join carmechanic.m_owns owns on car_outer.c_id = owns.car_id
inner join carmechanic.m_owner owner on owns.owner_id = owner.o_id
where license_plate_number = 'BBB230' 
and
date_of_buy = 
(select max(date_of_buy)
from carmechanic.m_owns owns_inner
where owns_inner.car_id = car_outer.c_id);

-- Which cars were evaluated for 1 million at least once?
select distinct car.license_plate_number
from carmechanic.m_car_evaluation eval inner join carmechanic.m_car car on eval.car_id = car.c_id
where price > 1000000
order by license_plate_number;

-- Which cars were only evaluated for more than 1 million? Nothing less
select car.*
from carmechanic.m_car_evaluation eval_outer inner join carmechanic.m_car car on eval_outer.car_id = car.c_id
where 1000000 < all (
select price
from carmechanic.m_car_evaluation
where car_id = eval_outer.car_id);

-- Which cars' avg. evaluations is more than 1 million
select c_id, avg(price)
from carmechanic.m_car_evaluation eval inner join carmechanic.m_car car on eval.car_id = car.c_id
group by c_id
having avg(price) > 1000000;

-- Which mechanic's had their longest time working somewhere? Where was it?
select m_id, m_name, round(max(nvl(end_of_employment, sysdate)-start_of_employment),2) as working_days, substr(address, 1, instr(address, ',')-1) as place
from carmechanic.m_works_for wk inner join carmechanic.m_mechanic mech on wk.mechanic_id = mech.m_id
group by m_id, m_name, substr(address, 1, instr(address, ',')-1)
order by working_time desc
fetch first row only;

select *
from carmechanic.m_mechanic;

-- Who are the Debreceniers who bought red cars after 2010, including 2010.
select o_name, address, extract(year from date_of_buy) as year
from carmechanic.m_car car inner join carmechanic.m_owns owns on car.c_id = owns.car_id
inner join carmechanic.m_owner owner on owns.owner_id = owner.o_id
where color = 'red' and
extract(year from date_of_buy) >= 2010 and
lower(substr(address, 1, instr(address, ',')-1)) = 'debrecen';

-- Which is the highest evaluated Volkswagen?
select eval.*, make
from carmechanic.m_car_model model inner join carmechanic.m_car car on model.cm_id = car.model_id
inner join carmechanic.m_car_evaluation eval on car.c_id = eval.car_id
where make = 'Volkswagen'
order by price desc
fetch first row only;

-- Who bought the same car type as the one needed to be repaired the most
select distinct o_name
from carmechanic.m_car_model model inner join carmechanic.m_car car
on model.cm_id = car.model_id
inner join carmechanic.m_owns owns
on car.c_id = owns.car_id
inner join carmechanic.m_owner owner
on owns.owner_id = owner.o_id
where cm_id in (
select cm_id
from carmechanic.m_car_model model inner join carmechanic.m_car car
on model.cm_id = car.model_id
inner join carmechanic.m_repair rep
on car.c_id = rep.car_id
group by cm_id
order by count(*) desc
fetch first row with ties);


-- Who never had an Opel?
select o_id, o_name
from carmechanic.m_owner
minus
select owner_id
from carmechanic.m_car_model model inner join carmechanic.m_car car
on model.cm_id = car.model_id
inner join carmechanic.m_owns ows
on car.c_id = ows.car_id
inner join carmechanic.m_owner owner
on ows.owner_id = owner.o_id
where make = 'Opel';


-- Which car belongs to which person right now?
SELECT o.car_id, owner.o_name
FROM carmechanic.m_owns o inner join carmechanic.m_owner owner on o.owner_id = owner.o_id
WHERE o.date_of_buy = (
    SELECT MAX(date_of_buy)
    FROM carmechanic.m_owns
    WHERE car_id = o.car_id);