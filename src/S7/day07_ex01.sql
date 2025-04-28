SELECT p.name, COUNT(person_visits.person_id) AS count_of_visits
    FROM person p
        JOIN person_visits ON p.id = person_visits.person_id
    GROUP BY p.name
    ORDER BY count_of_visits DESC, p.name
    LIMIT 4;
