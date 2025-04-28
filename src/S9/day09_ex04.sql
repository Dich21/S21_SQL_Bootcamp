CREATE OR REPLACE FUNCTION fnc_persons_female()
    RETURNS TABLE
            (
                id      bigint,
                name    varchar,
                age     integer,
                gender  varchar,
                address varchar
            )
AS
$$
SELECT * FROM v_persons_female

$$ LANGUAGE sql;

CREATE OR REPLACE FUNCTION fnc_persons_male()
    RETURNS TABLE
            (
                id      bigint,
                name    varchar,
                age     integer,
                gender  varchar,
                address varchar
            )
AS
$$
SELECT * FROM v_persons_male

$$ LANGUAGE sql;


-- select check
SELECT *
    FROM fnc_persons_male();

SELECT *
    FROM fnc_persons_female();

-- drop
DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();
