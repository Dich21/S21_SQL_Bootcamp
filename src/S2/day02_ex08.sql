SELECT name
    FROM person
             JOIN person_order ON person.id = person_order.person_id
             JOIN menu ON person_order.menu_id = menu.id
    WHERE menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
      AND person.gender = 'male'
      AND (person.address = 'Moscow' OR address = 'Samara')
    ORDER BY name DESC

