select
    (select name
    from person
    where person.id = person_order.person_id) as name
from person_order
where person_order.order_date = '2022-01-07' and  person_order.menu_id in (13, 14, 18)