-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
-- archivo de datos de local al hdfs
!hdfs dfs -copyFromLocal data.tsv  /tmp/data.tsv;

-- Creacion de la tabla principal
DROP TABLE IF EXISTS data;

CREATE TABLE data (
    letra   STRING,
    fecha   DATE,
    valor   INT
)

ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t';

-- cargar los datos
LOAD DATA INPATH '/tmp/data.tsv' OVERWRITE
INTO TABLE data;



-- crear tabla e instruccion resultado
DROP TABLE IF EXISTS temp1;

CREATE TABLE temp1 AS

    SELECT DISTINCT valor FROM data LIMIT 5;

CREATE TABLE temp2 AS

    SELECT * FROM temp1 SORT BY valor ASC; 

-- guardar resultado en output
INSERT OVERWRITE DIRECTORY '/tmp/output'
SELECT * FROM temp2;

-- pasar del hdfs al local 
!hadoop fs -copyToLocal /tmp/output output;   