-- insert sicilian pizza into menu
INSERT INTO menu
SELECT COUNT(*) + 1, (SELECT id FROM pizzeria WHERE name = 'Dominos'),
       'sicilian pizza', 900
    FROM menu;

-- insert Denis's order
INSERT INTO person_order
SELECT ((SELECT MAX(id) FROM person_order) + 1), (SELECT id FROM person WHERE name = 'Denis'),
       (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'), '2022-02-24';

-- insert Irina's order
INSERT INTO person_order
SELECT ((SELECT MAX(id) FROM person_order) + 1), (SELECT id FROM person WHERE name = 'Irina'),
       (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'), '2022-02-24'
SELECT * FROM person_order;

-- delete Denis's and Irina's orders
DELETE
    FROM person_order
    WHERE order_date = '2022-02-24';
DELETE
    FROM menu
    WHERE pizza_name = 'sicilian pizza';
SELECT * FROM person_order;



