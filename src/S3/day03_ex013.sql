-- delete order from every person
DELETE
    FROM person_order
    WHERE order_date = '2022-02-25';

-- delete greek pizza from menu
DELETE FROM menu
WHERE pizza_name = 'greek pizza';
SELECT * FROM person_order;
