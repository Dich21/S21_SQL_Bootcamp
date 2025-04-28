create table if not exists nodes
(
    id     serial primary key,
    point1 varchar(1) not null,
    point2 varchar(1) not null,
    cost   int        not null
);

insert into nodes (point1, point2, cost)
select point1, point2, cost
from (
    values
        ('a', 'b', 10),
        ('b', 'a', 10),
        ('a', 'c', 15),
        ('c', 'a', 15),
        ('a', 'd', 20),
        ('d', 'a', 20),
        ('b', 'c', 35),
        ('c', 'b', 35),
        ('b', 'd', 25),
        ('d', 'b', 25),
        ('c', 'd', 30),
        ('d', 'c', 30)
) as edge (point1, point2, cost)
where not exists (
    select 1
    from nodes n
)
order by point1, point2, cost;

WITH RECURSIVE all_paths AS (
    SELECT
        'a'::varchar(1) AS start_city, 'a'::varchar(1) AS current_city,
        ARRAY['a'] AS path, 0 AS total_cost
    UNION ALL
    SELECT
        start_city, n.point2, path || n.point2, total_cost + n.cost
    FROM all_paths
    JOIN nodes n ON all_paths.current_city = n.point1
    WHERE n.point2 <> ALL(path) AND cardinality(path) < 4
)
SELECT
    total_cost + (SELECT cost FROM nodes WHERE point1 = all_paths.current_city AND point2 = 'a') AS total_cost,
    ARRAY_APPEND(path, 'a') AS tour
FROM all_paths
WHERE cardinality(path) = 4
  AND total_cost + (SELECT cost FROM nodes WHERE point1 = all_paths.current_city AND point2 = 'a') =
      (SELECT MIN(total_cost + (SELECT cost FROM nodes WHERE point1 = ap.current_city AND point2 = 'a'))
       FROM all_paths ap
       WHERE cardinality(ap.path) = 4)
ORDER BY tour, total_cost;
