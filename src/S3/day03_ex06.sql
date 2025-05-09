SELECT m1.pizza_name, p1.name AS pizzeria_name_1, p2.name AS pizzeria_name_2, m1.price
FROM menu m1
JOIN menu m2 ON m2.pizza_name = m1.pizza_name AND m2.price = m1.price AND m2.pizzeria_id < m1.pizzeria_id
JOIN pizzeria p1 ON m1.pizzeria_id = p1.id
JOIN pizzeria p2 ON m2.pizzeria_id = p2.id
ORDER BY m1.pizza_name;