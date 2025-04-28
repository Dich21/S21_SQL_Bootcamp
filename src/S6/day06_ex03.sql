CREATE UNIQUE INDEX IF NOT EXISTS idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);;

set ENABLE_SEQSCAN to off;
EXPLAIN ANALYSE
select person_id, pizzeria_id
from person_discounts