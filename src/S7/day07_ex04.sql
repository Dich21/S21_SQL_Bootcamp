-- ошибка в задании, больше трех раз никто не посещал (максимум 3)
SELECT name, COUNT(person_id) AS count_visits
    FROM person
        JOIN person_visits ON person.id = person_visits.person_id
    GROUP BY name
    HAVING COUNT(person_id) > 3