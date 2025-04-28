select menu.pizza_name, pizzeria.name as pizzeria_name
from person_order
join menu on person_order.menu_id = menu.id
join pizzeria on menu.pizzeria_id = pizzeria.id
join person on person_order.person_id = person.id
where person.name = 'Denis' or person.name = 'Anna'
order by pizza_name, pizzeria_name

