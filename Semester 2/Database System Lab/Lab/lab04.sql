-- Connection between tables 
-- With something to join them → foreign key
-- We're expecting more from the tables where join points to
select *
from carmechanic.m_car_model model
INNER join
carmechanic.m_car car
on model.cm_id = car.model_id;

-- Testing:
-- LEFT: m_car_model, RIGHT: m_car

-- INNER JOIN
-- Look up the car model for each license_plate, display them with the plate no, car model and brand
-- Are there any nulls?

-- Try again with LEFT JOIN
-- Where are the nulls?
select *
from carmechanic.m_car_model model
LEFT OUTER join
carmechanic.m_car car
on model.cm_id = car.model_id;

-- Again with right join
-- Where are the nulls?
select *
from carmechanic.m_car_model model
RIGHT OUTER join
carmechanic.m_car car
on model.cm_id = car.model_id;

-- Full outer join
select *
from carmechanic.m_car_model model
FULL OUTER join
carmechanic.m_car car
on model.cm_id = car.model_id;

-- Self join → employee
select workers.first_name || ' ' || workers.last_name worker,
managers.first_name || ' ' || managers.last_name manager
from hr.employees workers
left outer join
hr.employees managers
on workers.manager_id = managers.employee_id;


-- Simple queries
-- How much was spent to repair the VGR001 (license plate)
select sum(repair_cost)
from carmechanic.m_car car
left outer join
carmechanic.m_repair repair
on car.c_id = repair.car_id
where car.license_plate_number = 'VGR001';

-- Is there anyone who had a golden Opel Astra?
select distinct o_name
from carmechanic.m_car_model model
inner join
carmechanic.m_car car
on model.cm_id = car.model_id
inner join carmechanic.m_owns owns
on car.c_id = owns.car_id
inner join carmechanic.m_owner owner
on owns.owner_id = owner.o_id
where car.color = 'gold' and model.make = 'Opel' and model.cm_name = 'Astra';

-- How much do mechanics earn on average in each city?
select substr(address, 0, instr(address, ',')-1), avg(salary)
from carmechanic.m_works_for works
inner join
carmechanic.m_mechanic mechanic
on works.mechanic_id = mechanic.m_id
group by substr(address, 0, instr(address, ',')-1);


-- Who bought their car back? 
select o_name, car_id, count(*)
from carmechanic.m_car car inner join carmechanic.m_owns owns
on car.c_id = owns.car_id
inner join carmechanic.m_owner owner 
on owns.owner_id = owner.o_id
group by o_name, car_id
having count(*) > 1;


-- Which cars needed the 1/10th of their original selling price to be spent on their repairs?
select c_id, sum(repair_cost), avg(first_sell_price)
from carmechanic.m_car car inner join carmechanic.m_repair rep
on car.c_id = rep.car_id
group by c_id
having sum(repair_cost) > avg(first_sell_price)*0.1;

-- Which car spent the most time at the repair shop?
select c_id, (nvl(end_date, sysdate) - start_date) as repair_time
from carmechanic.m_car car inner join carmechanic.m_repair rep
on car.c_id = rep.car_id
order by repair_time desc
fetch first row only;

-- Find cars that were evaluated on a higher price than they were sold for the first time
select *
from carmechanic.m_car car inner join carmechanic.m_car_evaluation eval
on car.c_id = eval.car_id
where eval.price > car.first_sell_price;

-- Joins with 3-4 tables
-- Which repair shops dealt with the Volkswagen Touran already?
select make, cm_name, workshop_id, w_name
from carmechanic.m_car_model model left outer join carmechanic.m_car car
on model.cm_id = car.model_id
left outer join carmechanic.m_repair rep on car.c_id = rep.car_id
left outer join carmechanic.m_workshop ws on rep.workshop_id = ws.w_id
where cm_name = 'Touran' and make = 'Volkswagen';

-- Which repairmen need to work in a different city than their hometown? 
select mech.m_name, mech.address, ws.address
from carmechanic.m_mechanic mech inner join carmechanic.m_works_for wf
on mech.m_id = wf.mechanic_id 
inner join carmechanic.m_workshop ws
on wf.workshop_id = ws.w_id
where wf.end_of_employment is null
and substr(mech.address, 1, instr(mech.address, ',')-1) != substr(ws.address, 1, instr(ws.address, ',')-1);

-- What was the priciest gasoline car each repairman has repaired
select m_id, max(first_sell_price)
from carmechanic.m_car_model model inner join carmechanic.m_car car on model.cm_id = car.model_id
inner join carmechanic.m_repair rep on car.c_id = rep.car_id
inner join carmechanic.m_workshop ws on rep.workshop_id = ws.w_id
inner join carmechanic.m_works_for wf on ws.w_id = wf.workshop_id
inner join carmechanic.m_mechanic mech on wf.mechanic_id = mech.m_id
where model.details like '%gasoline%'
group by mech.m_id;


-- Whose car is still at the repairshop?
select o_name, start_date
from carmechanic.m_owner owner inner join carmechanic.m_owns owns on owner.o_id = owns.owner_id
inner join carmechanic.m_car car on owns.car_id = car.c_id
inner join carmechanic.m_repair rep on car.c_id = rep.car_id
where end_date is null;

-- Which car make has cars that needed to be repaired only once
select cm_name
from carmechanic.m_car_model model inner join carmechanic.m_car car on model.cm_id = car.model_id
inner join carmechanic.m_repair rep on car.c_id = rep.car_id
group by cm_name
having count(rep.car_id) = 1;


-- How much did 'Kerekes Viktor' spent on each of his cars?
select license_plate_number, o_name, sum(repair_cost)
from carmechanic.m_owner owner inner join carmechanic.m_owns owns on owner.o_id = owns.owner_id
inner join carmechanic.m_car car on owns.car_id = car.c_id
inner join carmechanic.m_repair rep on car.c_id = rep.car_id
where o_name = 'Kerekes Viktor'
group by o_name, license_plate_number;

select license_plate_number, sum(rep.repair_cost)
from carmechanic.m_car car inner join carmechanic.m_repair rep
on car.c_id = rep.car_id
inner join carmechanic.m_owns owns
on car.c_id = owns.car_id
inner join carmechanic.m_owner owner
on owns.owner_id = owner.o_id
where owner.o_name = 'Kerekes Viktor'
group by car.license_plate_number;

-- Which brand is more popular? Volkswagen or Skoda? 
select make, count(owner_id)
from carmechanic.m_car_model model inner join carmechanic.m_car car on model.cm_id = car.model_id
inner join carmechanic.m_owns owns on car.c_id = owns.car_id
where make in ('Volkswagen', 'Skoda')
group by make
order by count(owner_id) desc;

select mk.make, count(*)
from carmechanic.m_car_model mk inner join carmechanic.m_car car on mk.cm_id = car.model_id
where mk.make in ('Volkswagen', 'Skoda')
group by mk.make;

-- Which are the most reliable types? Let's look them up
select mk.cm_name, count(rep.start_date)
from carmechanic.m_car_model mk inner join carmechanic.m_car car
on mk.cm_id = car.model_id
inner join carmechanic.m_repair rep
on car.c_id = rep.car_id
group by mk.cm_name
order by count(rep.start_date);