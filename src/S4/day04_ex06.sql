CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name
    FROM pizzeria
             JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
             JOIN person ON person_visits.person_id = person.id
             JOIN menu ON pizzeria.id = menu.pizzeria_id
    WHERE visit_date = '2022-01-08'
      AND person.name = 'Dmitriy'
      AND menu.price < '800';

SELECT * FROM mv_dmitriy_visits_and_eats;

drop materialized view mv_dmitriy_visits_and_eats;