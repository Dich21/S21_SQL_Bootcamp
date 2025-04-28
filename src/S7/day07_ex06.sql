SELECT p.name, COUNT(pizzeria_id) AS count_of_orders,
       round(AVG(price), 2) AS avarage_price, MAX(price) AS max_price, MIN(price) AS min_price
    FROM pizzeria p
        JOIN menu m ON p.id = m.pizzeria_id
        JOIN person_order po ON m.id = po.menu_id
    GROUP BY p.name
    ORDER BY p.name