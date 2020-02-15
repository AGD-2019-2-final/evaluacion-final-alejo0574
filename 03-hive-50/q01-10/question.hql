-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra. 
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
    fecha   STRING,
    valor   INT
)

ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t';

-- cargar los datos
LOAD DATA INPATH '/tmp/data.tsv' OVERWRITE
INTO TABLE data;


-- crear tabla e instruccion resultado
DROP TABLE IF EXISTS contador;

CREATE TABLE contador
AS
    SELECT
        letra, count(1) AS count
    FROM
        data
    GROUP BY
        letra
    ORDER BY
        letra;


-- guardar resultado en output
INSERT OVERWRITE DIRECTORY '/tmp/output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM contador;

-- pasar del hdfs al local 
!hadoop fs -copyToLocal /tmp/output output;