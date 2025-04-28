SELECT address, p.name, COUNT(person_id) AS count_of_orders
    FROM person
        JOIN person_order ON person.id = person_order.person_id
        JOIN menu ON person_order.menu_id = menu.id
        JOIN pizzeria p ON menu.pizzeria_id = p.id
    GROUP BY address, p.name
    ORDER BY address, name;