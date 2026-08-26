-- Identifying joins 78% + 56%

-- -- Select car models, which has no car in the database. List the make and the model name.
select make, cm_name
from carmechanic.m_car_model model left outer join carmechanic.m_car car on model.cm_id = car.model_id
where c_id is NULL;

-- -- Look up what is an avg. evaluation price for each car model. 
-- -- If the car model was not evaluated, print "Never been evaluated" in the query.

select make, cm_name, 
decode(nvl(avg(price), 0), 0, 'Never been evaluated', avg(price)) as Average --decode((column), value, to-some-value-we-want, default)
from carmechanic.m_car_evaluation eval right join carmechanic.m_car car on eval.car_id = car.c_id
right join carmechanic.m_car_model model on car.model_id = model.cm_id
group by make, cm_name;
--the decode fumction works like this if-statement: If (column = value) Return the-value-we-want, Else Return Default;

-- -- Rumours spread, that cars that had no owners are evaluated higher, than the ones that were already owned. 
-- -- Support or decline that, by finding the AVG price of owned and not owned cars. 
select decode(nvl(owner_id, 0), 0, 'No owner', 'Has owner'), avg(price)
from carmechanic.m_car_evaluation eval inner join carmechanic.m_car car on eval.car_id = car.c_id 
left outer join carmechanic.m_owns owns on car.c_id = owns.car_id
group by decode(nvl(owner_id, 0), 0, 'No owner', 'Has owner');

-- -- Look up workshops that never worked with Volkswagen Tourans!
select *
from carmechanic.m_workshop
where w_id not in (
select workshop_id
from carmechanic.m_car_model model inner join carmechanic.m_car car on model.cm_id = car.model_id
inner join carmechanic.m_repair rep on car.c_id = rep.car_id
where make = 'Volkswagen' and cm_name = 'Touran'
);

-- Subqueries, nesting queries 67% + 56%

-- -- Who bought the same car models as the one(s) that needed the most repair? 
-- -- The most repair is calculated by how many times the car needed to visit a workshop.
select  distinct o_id, o_name
from carmechanic.m_owner owner inner join carmechanic.m_owns owns  on owner.o_id = owns.owner_id
inner join carmechanic.m_car car on owns.car_id = car.c_id
where model_id in 
(select cm_id
from carmechanic.m_car_model model inner join carmechanic.m_car car on model.cm_id = car.model_id
inner join carmechanic.m_repair rep on car.c_id = rep.car_id
group by cm_id
order by count(*) desc
fetch first row with ties
);

-- -- Which workshop(s) have the most experience in Volkswagen Group cars? 
-- -- Volkswagen Group consists from the following brands: Volkswagen, Skoda, Seat, Audi, Porsche, Cupra, Bentley
select w_name
from carmechanic.m_workshop 
where w_id in (
select workshop_id
from carmechanic.m_car_model model inner join carmechanic.m_car car on model.cm_id = car.model_id
inner join carmechanic.m_repair rep on car.c_id = rep.car_id
where make in ('Volkswagen', 'Skoda', 'Seat', 'Audi', 'Porsche', 'Cupra', 'Bentley')
group by workshop_id
order by count(*) desc
fetch first row with ties
);


-- -- Who is the owner of the repair shop, 
-- -- that repaired the most popular (most of them can be found in the database) Volkswagen model the most often? 
select mech.m_name
from carmechanic.m_workshop ws inner join carmechanic.m_mechanic mech on ws.manager_id = mech.m_id
where ws.w_id in (
select workshop_id
from carmechanic.m_car car inner join carmechanic.m_repair rep on car.c_id = rep.car_id 
where car.model_id in(
select cm_id
from carmechanic.m_car_model model inner join carmechanic.m_car car on model.cm_id = car.model_id
where make = 'Volkswagen'
group by cm_id
order by count(*) desc
fetch first row with ties)
group by workshop_id
order by count(*) desc
fetch first row with ties);

-- -- What non-Volkswagen Group cars were owned by those never owned German cars either? List their make and model! 
-- -- German cars: Audi, Volkswagen, Mercedes-Benz, Opel, BMW
select * 
from carmechanic.m_owner
where o_id not in (
select owns.owner_id
from carmechanic.m_car_model model inner join carmechanic.m_car car on model.cm_id = car.model_id 
inner join carmechanic.m_owns owns on car.c_id = owns.car_id
where make in ('Audi', 'Volkswagen', 'Mercedes-Benz', 'Opel', 'BMW'));


/*
-- -- Accident victim is looking for a car that hit them and fleed. Gave us the following information about the car that hit them:
- The victim's name is Vince Fanni so her current car cannot be the one that hit her
- The car smelled like oil, surely was repaired in the past year
- The car had a huge I LOVE SOPRON sticker on it, the owner is surely from Sopron
- Her handbag got hanged on the tow hook, means the car surely have one
Write a query to help her find the responsible person!
 */
 select *
 from carmechanic.m_owner
 where address like '%Sopron%';
 
 -- The only owner who is from Sopron in the database is Papp Mohamed. So, odds are he is the culprit. Investigation over. One of the shortest query ever.
 select o_name, address, car_id, model_id, cm_name, make, details, date_of_buy
 from carmechanic.m_owner owner inner join carmechanic.m_owns owns on owner.o_id = owns.owner_id
 inner join carmechanic.m_car car on owns.car_id = car.c_id
 inner join carmechanic.m_car_model model on car.model_id = model.cm_id
 where address like '%Sopron%' and
 details like '%tow hook%';

 
-- Set operations

-- -- List every person in the database that has 2 letter 'e'-s in their name in both upper and lower case 
select o_name
from carmechanic.m_owner
where lower(o_name) like '%e%e%';
union
select m_name
from carmechanic.m_mechanic
where lower(m_name) like '%e%e%';


-- -- List German brands that has more than 5 gasoline models in total and also French car brands that have more than 3 diesel models!
select make
from carmechanic.m_car_model
where make in ('Volkswagen', 'BMW', 'Audi', 'Mercedes-benz', 'Opel')
and details like '%gasoline%'
group by make
having count(*) >= 5
union
select make
from carmechanic.m_car_model
where make in ('Renault', 'Peugeot')
and details like '%diesel%'
group by make
having count(*) > 3;

-- -- List every car evaluation that happened on Volkswagen models except the ones that evaluate a car owned by 'Papp Mohamed'
select eval.*
from carmechanic.m_car_evaluation eval inner join carmechanic.m_car car on eval.car_id = car.c_id
inner join carmechanic.m_car_model model on car.model_id = model.cm_id
where make = 'Volkswagen'
minus
select eval.*
from carmechanic.m_car_evaluation eval inner join carmechanic.m_car car on eval.car_id = car.c_id 
inner join carmechanic.m_owns owns on car.c_id = owns.car_id
inner join carmechanic.m_owner owner on owns.owner_id = owner.o_id
where o_name = 'Papp Mohamed';


-- -- List current Opel Astra owners and workers of the 'Harmati Kft.' in one query
select o_name as NAME
from carmechanic.m_owner 
where o_id in(
select owner_id
from carmechanic.m_owns ows_outer
where date_of_buy = (
select max(date_of_buy)
from carmechanic.m_owns ows_inner
where ows_inner.owner_id = ows_outer.owner_id)
and car_id in (
select c_id
from carmechanic.m_car_model mdl inner join carmechanic.m_car car on mdl.cm_id = car.model_id
where make = 'Opel' and cm_name = 'Astra'
))
union
select m_name as NAME
from carmechanic.m_workshop ws inner join carmechanic.m_works_for wf on ws.w_id = wf.workshop_id
inner join carmechanic.m_mechanic mec on wf.mechanic_id = mec.m_id
where end_of_employment is null and ws.w_name = 'Harmat Kft.';

-- -- Legend says that people either love German or French cars. 
-- -- Decline or support this legend by listing all car owners who had both German and French cars in their lifetime!
select ows.owner_id
from carmechanic.m_car_model mdl inner join carmechanic.m_car car on mdl.cm_id = car.model_id
inner join carmechanic.m_owns ows on car.c_id = ows.car_id
where make in ('Volkswagen', 'BMW', 'Audi', 'Mercedes-benz', 'Opel')
intersect
select ows.owner_id
from carmechanic.m_car_model mdl inner join carmechanic.m_car car on mdl.cm_id = car.model_id
inner join carmechanic.m_owns ows on car.c_id = ows.car_id
where make in ('Peugeot', 'Renault', 'Citroen');
