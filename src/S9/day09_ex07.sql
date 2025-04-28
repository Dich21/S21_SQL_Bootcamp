CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[])
RETURNS numeric AS $$
    declare
        min_value numeric;
    begin
        min_value := arr[1];
        for i in 2..array_length(arr,1) loop
            if (arr[i] < min_value) then
                min_value := arr[i];
            end if;
        end loop;
        return min_value;
    end;
    $$ LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);

DROP FUNCTION IF EXISTS func_minimum(numeric[]);


