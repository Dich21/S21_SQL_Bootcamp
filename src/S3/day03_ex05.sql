SELECT DISTINCT pizzeria.name
    FROM pizzeria
             JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
             JOIN person ON person_visits.person_id = person.id
             JOIN person_order ON person.id = person_order.person_id
    WHERE person.name = 'Andrey'
      AND pizzeria_id NOT IN (SELECT pizzeria_id
                                  FROM pizzeria
                                           JOIN menu ON pizzeria.id = menu.pizzeria_id
                                           JOIN person_order ON menu.id = person_order.menu_id
                                  WHERE person_order.person_id = person.id)
