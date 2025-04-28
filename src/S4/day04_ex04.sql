CREATE VIEW v_symmetric_union AS
WITH R AS (SELECT pv.person_id
               FROM person_visits pv
               WHERE visit_date = '2022-01-02'),
     s AS (SELECT pv.person_id
               FROM person_visits pv
               WHERE visit_date = '2022-01-06')
        (SELECT person_id FROM R EXCEPT SELECT person_id FROM S)
UNION ALL
(SELECT person_id FROM S EXCEPT SELECT person_id FROM R);

DROP VIEW v_symmetric_union;

