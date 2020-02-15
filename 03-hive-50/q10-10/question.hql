-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
DROP TABLE IF EXISTS t0;
CREATE TABLE t0 (
    c1 STRING,
    c2 ARRAY<CHAR(1)>, 
    c3 MAP<STRING, INT>
    )
    ROW FORMAT DELIMITED 
        FIELDS TERMINATED BY '\t'
        COLLECTION ITEMS TERMINATED BY ','
        MAP KEYS TERMINATED BY '#'
        LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'data.tsv' INTO TABLE t0;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

-- crear tabla e instruccion resultado
DROP TABLE IF EXISTS temp1;

CREATE TABLE temp1 AS
    SELECT key, count(*) FROM t0
        LATERAL VIEW explode(c3) table1 AS key, val
            GROUP BY key;

-- guardar resultado en output
INSERT OVERWRITE DIRECTORY '/tmp/output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM temp1;

-- pasar del hdfs al local 
!hadoop fs -copyToLocal /tmp/output output;  