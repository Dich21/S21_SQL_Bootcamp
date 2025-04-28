CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT '14')
    RETURNS setof integer AS
$$
WITH RECURSIVE fib(a, b) AS (values (0, 1)
                             UNION ALL
                             SELECT b, a + b
                             FROM fib
                             WHERE b < pstop)
SELECT a
FROM fib
$$ LANGUAGE sql;

-- Test the function
SELECT *
FROM fnc_fibonacci(100);
SELECT *
FROM fnc_fibonacci();

-- Drop the function
DROP FUNCTION IF EXISTS fnc_fibonacci(integer)