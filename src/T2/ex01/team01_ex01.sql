insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

with rate_in_usd as (
    select b.user_id, c.id, c.name, b.money, (
        select currency.rate_to_usd from currency
        where currency.id = b.currency_id and currency.updated < b.updated
        order by currency.updated desc
        limit 1
        ) as past_rate,
        (select currency.rate_to_usd from currency
        where currency.id = b.currency_id and currency.updated > b.updated
        order by currency.updated
        limit 1
        ) as future_rate
    from currency c
    join balance b on c.id = b.currency_id
    group by b.money, b.user_id, c.id, c.name, b.currency_id, b.updated
    order by user_id, id
)

select coalesce(u.name, 'not defined') as name,
       coalesce(u.lastname, 'not defined') as lastname,
       rate_in_usd.name as currency_name,
       rate_in_usd.money * coalesce(rate_in_usd.past_rate, rate_in_usd.future_rate) as currency_in_usd
from rate_in_usd
left    join "user" u on rate_in_usd.user_id = u.id
order by name desc, lastname, currency_name;


