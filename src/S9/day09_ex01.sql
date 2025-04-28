CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
    RETURNS trigger AS
$$
BEGIN
    IF (tg_op = 'UPDATE') THEN
        INSERT INTO person_audit
            VALUES (default, 'U', OLD.*);
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_update_audit
    AFTER UPDATE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

DROP TRIGGER trg_person_update_audit ON person;
DROP FUNCTION fnc_trg_person_update_audit;

