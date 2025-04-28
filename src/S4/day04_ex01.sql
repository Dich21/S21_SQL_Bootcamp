SELECT *
    FROM v_persons_male
UNION
SELECT *
    FROM v_persons_female
ORDER BY name;