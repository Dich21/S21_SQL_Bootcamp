CREATE UNIQUE INDEX IF NOT EXISTS idx_1 ON pizzeria (rating);

SET ENABLE_SEQSCAN TO off;
EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name, MAX(rating)
    OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
    FROM menu m
             INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
    ORDER BY 1, 2;

DROP INDEX idx_1;
SET ENABLE_SEQSCAN TO on;
EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name, MAX(rating)
    OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
    FROM menu m
             INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
    ORDER BY 1, 2;

drop index idx_menu_pizzeria_id;
drop index idx_menu_unique;
