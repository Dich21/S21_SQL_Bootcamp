INSERT INTO person_visits
SELECT MAX(id) + 1, (SELECT id FROM person WHERE name = 'Denis'),
       (SELECT id FROM pizzeria WHERE name = 'Dominos'), '2022-02-24'
    FROM person_visits;
INSERT INTO person_visits
SELECT MAX(id) + 1, (SELECT id FROM person WHERE name = 'Irina'),
       (SELECT id FROM pizzeria WHERE name = 'Dominos'), '2022-02-24'
    FROM person_visits;
SELECT * FROM person_visits;

-- DELETE
--     FROM person_visits
--     WHERE visit_date = '2022-02-24';
-- SELECT * FROM person_visits;
