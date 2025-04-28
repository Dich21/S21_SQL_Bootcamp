SELECT p.name as name, m.pizza_name as pizza_name, m.price as price,
       round(m.price - (price * pd.discount / 100)) AS discount_price,
       pz.name AS pizzeria_name
    FROM person p
        JOIN person_discounts pd ON p.id = pd.person_id
        JOIN pizzeria pz ON pd.pizzeria_id = pz.id
        JOIN menu m ON pz.id = m.pizzeria_id
        JOIN person_order po ON m.id = po.menu_id
    WHERE p.id = po.person_id
    ORDER BY name, pizza_name;
;