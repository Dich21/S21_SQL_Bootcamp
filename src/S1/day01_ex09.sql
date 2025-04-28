-- SELECT name
--     FROM pizzeria
-- EXCEPT
-- SELECT name
--     FROM pizzeria
--              JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id;

SELECT name
    FROM pizzeria
    WHERE id NOT IN (SELECT pizzeria_id FROM person_visits);

-- SELECT name
--     FROM pizzeria
--     WHERE NOT EXISTS(SELECT 1 FROM person_visits WHERE person_visits.pizzeria_id = pizzeria.id);