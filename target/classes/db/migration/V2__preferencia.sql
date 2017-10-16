ALTER TABLE pessoa ADD COLUMN (cor varchar(200));

UPDATE pessoa SET COR = 'azul' WHERE cor is null;
