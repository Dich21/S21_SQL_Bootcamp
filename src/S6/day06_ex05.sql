COMMENT ON TABLE person_discounts IS 'Table of discounts for each person';
COMMENT ON COLUMN person_discounts.id IS 'Unique identifier for the discount';
COMMENT ON COLUMN person_discounts.person_id IS 'Identifier of the person who has the discount';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Identifier of the pizzeria where the discount is valid';
COMMENT ON COLUMN person_discounts.discount IS 'Discount value (in percent) for the person';

SELECT count(*) = 5 as check FROM pg_description WHERE objoid = 'person_discounts'::regclass