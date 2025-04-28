CREATE OR REPLACE FUNCTION func_trigger_person_delete_audit()
    RETURNS TRIGGER AS
$$
BEGIN
    IF (tg_op = 'DELETE') THEN
        INSERT INTO person_audit
            VALUES (DEFAULT, 'D', old.*);
        RETURN old;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit
    BEFORE DELETE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION func_trigger_person_delete_audit();

DELETE FROM person WHERE id = 10;

DROP TRIGGER trg_person_delete_audit ON person;
DROP FUNCTION func_trigger_person_delete_audit;