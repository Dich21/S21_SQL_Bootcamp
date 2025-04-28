INSERT INTO menu
SELECT COUNT(*) + 1, (SELECT id FROM pizzeria WHERE name = 'Dominos'), 'greek pizza', 800 FROM menu
SELECT * FROM menu;

DELETE FROM menu
WHERE pizza_name = 'greek pizza' AND pizzeria_id = (SELECT id FROM pizzeria WHERE name = 'Dominos');