select pizzeria.name as pizzeria_name -- в задании не указано конкретное название колонны, оставляю такое
from pizzeria
join person_visits on pizzeria.id = person_visits.pizzeria_id
join person on person_visits.person_id = person.id
join menu on pizzeria.id = menu.pizzeria_id
where person_visits.visit_date = '2022-01-08' and person.name = 'Dmitriy' and menu.price <= 800

