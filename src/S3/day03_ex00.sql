SELECT pizza_name, price, pizzeria.name AS pizzeria_name, person_visits.visit_date AS visit_date
    FROM menu
             JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
             JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
             JOIN person ON person_visits.person_id = person.id
    WHERE person.name = 'Kate'
      AND price BETWEEN 800 AND 1000
    ORDER BY pizza_name, price, pizzeria_name, visit_date
