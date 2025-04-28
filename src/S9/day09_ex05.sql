DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons(IN pgender varchar DEFAULT 'female')
    RETURNS table
            (
                id      bigint,
                name    varchar,
                age     integer,
                gender  varchar,
                address varchar
            )
AS
$$
    SELECT *
    FROM person
    WHERE gender = pgender;
    $$
    LANGUAGE sql;

SELECT *
    FROM fnc_persons(pgender := 'male');

SELECT *
    FROM fnc_persons();

drop function fnc_persons;