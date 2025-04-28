SELECT pizzaria_name
    FROM (SELECT pizzeria.name AS pizzaria_name, COUNT(DISTINCT person.gender) AS person_gender
              FROM person_order
                       JOIN person ON person_order.person_id = person.id
                       JOIN menu ON person_order.menu_id = menu.id
                       JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
              GROUP BY pizzaria_name
              HAVING COUNT(DISTINCT person.gender) = 1)
    ORDER BY pizzaria_name;
