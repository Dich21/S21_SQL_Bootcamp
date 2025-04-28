CREATE TABLE IF NOT EXISTS person_audit
(
    created    timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    type_event char(1)   NOT NULL DEFAULT 'I',
    row_id     bigint    NOT NULL,
    name       varchar,
    age        integer,
    gender     varchar,
    address    varchar,
    CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
    RETURNS TRIGGER AS
$$
BEGIN
    IF (tg_op = 'INSERT') THEN
        INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
            VALUES (DEFAULT, 'I', new.*);

    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
    VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

DROP TRIGGER trg_person_insert_audit ON person;
DROP FUNCTION fnc_trg_person_insert_audit;
DELETE FROM person WHERE id = 10;
DROP TABLE person_audit;




