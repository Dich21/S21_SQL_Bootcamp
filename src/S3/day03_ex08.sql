INSERT INTO menu
SELECT COUNT(*) + 1, (SELECT id FROM pizzeria WHERE name = 'Dominos'),
       'sicilian pizza', 900
    FROM menu;
SELECT * FROM menu;

DELETE
    FROM menu
    WHERE pizza_name = 'sicilian pizza'
      AND pizzeria_id = (SELECT id FROM pizzeria WHERE name = 'Dominos');
SELECT * FROM menu;