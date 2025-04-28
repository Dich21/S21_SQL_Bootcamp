CREATE VIEW v_generated_dates AS
SELECT GENERATE_SERIES('2022-01-01'::date, '2022-01-31'::date, '1 day'::interval)::date AS generated_date;
ORDER BY generated_date;
SELECT * FROM v_generated_dates;

DROP VIEW IF EXISTS v_generated_dates;

