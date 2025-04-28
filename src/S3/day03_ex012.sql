-- insert greek pizza to menu
INSERT INTO menu
SELECT COUNT(*) + 1, (SELECT id FROM pizzeria WHERE name = 'Dominos'), 'greek pizza', 800 FROM menu;

-- insert order from every person
INSERT INTO person_order
SELECT((SELECT MAX(id) FROM person_order) + i), i, (SELECT id FROM menu WHERE pizza_name = 'greek pizza'), '2022-02-25'
    FROM GENERATE_SERIES(1, (SELECT MAX(id) FROM person), 1) AS i;
SELECT * FROM person_order;

-- delete order from every person
-- DELETE
--     FROM person_order
--     WHERE order_date = '2022-02-25';

-- delete greek pizza from menu
-- DELETE FROM menu
-- WHERE pizza_name = 'greek pizza';
-- SELECT * FROM person_order;
