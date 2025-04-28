INSERT INTO person_visits
SELECT (SELECT MAX(id) + 1 FROM person_visits),
       (SELECT id FROM person WHERE name = 'Dmitriy'),
       (SELECT pizzeria.id
            FROM pizzeria
                     JOIN menu ON pizzeria.id = menu.pizzeria_id
            WHERE price < '800'
            LIMIT 1), '2022-01-08';
SELECT * FROM person_visits;

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
SELECT * FROM mv_dmitriy_visits_and_eats;

DELETE FROM person_visits WHERE id = (SELECT MAX(id) FROM person_visits);
SELECT * FROM person_visits;






