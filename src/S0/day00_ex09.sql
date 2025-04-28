select
    (select name
     from person
     where person.id = person_visits.person_id) as person_name,
    (select name
     from pizzeria
    where pizzeria.id = person_visits.pizzeria_id) as pizzeria_name
from (select *
      from person_visits
      WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09') as person_visits
order by person_name asc,
pizzeria_name desc;