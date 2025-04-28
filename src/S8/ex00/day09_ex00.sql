-- 1
begin;
update pizzeria set rating = 5 where name = 'Pizza Hut';
select * from pizzeria where name = 'Pizza Hut';
-- 2
select * from pizzeria where name = 'Pizza Hut';
-- 1
commit;
-- 2
select * from pizzeria where name = 'Pizza Hut';