with last_rate_to_usd as (
    select id, name as currency_name, rate_to_usd as last_rate
    from currency
    where updated = (select max(updated) from currency)
    )

select
    coalesce(u.name, 'not defined') as name,
    coalesce(u.lastname, 'not defined') as lastname,
    b.type as type,
    SUM(coalesce(b.money, 1)) as volume,
    coalesce(currency_name, 'not defined'),
    coalesce(last_rate, 1) as last_rate_to_usd,
    sum(coalesce(b.money, 1)) * coalesce(last_rate, 1) as total_volume_in_usd
from balance b
    full join "user" u on b.user_id = u.id
    left join last_rate_to_usd lr on b.currency_id = lr.id
group by u.name, u.lastname, type, currency_name, last_rate, u.id
order by name desc, lastname, type;