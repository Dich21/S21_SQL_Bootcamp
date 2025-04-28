SELECT missing_date::date
FROM generate_series('01-01-2022', '01-10-2022', interval '1 day') as  missing_date
left join (select visit_date
           from person_visits
           where person_id = 1 or person_id = 2
           group by visit_date) as select_days on missing_date = visit_date
where visit_date is null
