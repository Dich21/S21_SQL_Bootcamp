WITH DateSeries AS (SELECT missing_date::date
                        FROM GENERATE_SERIES('01-01-2022', '01-10-2022', INTERVAL '1 day') AS missing_date),
     VisitDate AS (SELECT visit_date
                       FROM person_visits
                       WHERE person_id = 1
                          OR person_id = 2
                       GROUP BY visit_date)
SELECT DateSeries.missing_date
    FROM DateSeries
             LEFT JOIN VisitDate AS select_days ON missing_date = visit_date
    WHERE visit_date IS NULL
