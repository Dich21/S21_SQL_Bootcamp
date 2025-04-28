DROP TRIGGER trg_person_insert_audit ON person;
DROP FUNCTION fnc_trg_person_insert_audit;
DROP TRIGGER trg_person_update_audit ON person;
DROP FUNCTION fnc_trg_person_update_audit;
DROP TRIGGER trg_person_delete_audit ON person;
DROP FUNCTION func_trigger_person_delete_audit;
TRUNCATE TABLE person_audit;

CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
    RETURNS TRIGGER AS
$$
BEGIN
    IF
        (tg_op = 'INSERT') THEN
        INSERT INTO person_audit
            VALUES (DEFAULT, 'I', new.*);
    ELSIF
        (tg_op = 'UPDATE') THEN
        INSERT INTO person_audit
            VALUES (default, 'U', old.*);
    ELSIF
        (tg_op = 'DELETE') THEN
        INSERT INTO person_audit
            VALUES (DEFAULT, 'D', old.*);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
    AFTER INSERT OR UPDATE OR DELETE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)
    VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;

DROP TRIGGER trg_person_audit ON person;
DROP FUNCTION fnc_trg_person_audit;