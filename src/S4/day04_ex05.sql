CREATE VIEW v_price_with_discount AS
SELECT *
    FROM (SELECT person.name, menu.pizza_name, menu.price, ROUND((price * 0.9), 0) AS discount_price
              FROM person_order
                       JOIN person ON person_order.person_id = person.id
                       JOIN menu ON person_order.menu_id = menu.id
              ORDER BY person.name, menu.pizza_name) AS tmp;

SELECT * FROM v_price_with_discount;

