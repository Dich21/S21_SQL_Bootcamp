WITH tmp AS (SELECT pizzeria.name, gender
                 FROM pizzeria
                          JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
                          JOIN person ON person_visits.person_id = person.id),
     mt AS (SELECT name FROM tmp WHERE gender = 'male'),
     ft AS (SELECT name FROM tmp WHERE gender = 'female')
SELECT name AS pizzeria_name
    FROM (SELECT * FROM mt EXCEPT ALL SELECT * FROM ft)
UNION ALL
(SELECT * FROM ft EXCEPT ALL SELECT * FROM mt)
ORDER BY pizzeria_name;

