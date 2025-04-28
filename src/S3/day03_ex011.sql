INSERT INTO menu
SELECT COUNT(*) + 1, (SELECT id FROM pizzeria WHERE name = 'Dominos'),
       'sicilian pizza', 900
    FROM menu;

UPDATE menu
SET price = price * 0.9
    WHERE pizza_name = 'sicilian pizza';

-- DELETE
--     FROM menu
--     WHERE pizza_name = 'sicilian pizza';