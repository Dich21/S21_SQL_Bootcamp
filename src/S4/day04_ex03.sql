SELECT generated_date AS missng_date
    FROM v_generated_dates
    WHERE generated_date NOT IN (SELECT visit_date FROM person_visits)