SELECT p.name, COALESCE(SUM(t.count), 0) AS total_count
    FROM ((SELECT name, COUNT(pizzeria_id) AS count
               FROM pizzeria
                   JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
               GROUP BY name)
          UNION ALL
          (SELECT name, COUNT(pizzeria_id) AS count
               FROM pizzeria
                   JOIN menu ON pizzeria.id = menu.pizzeria_id
                   JOIN person_order ON menu.id = person_order.menu_id
               GROUP BY name)) AS t
        FULL JOIN pizzeria p ON t.name = p.name
    GROUP BY p.name
    ORDER BY total_count DESC, name;
