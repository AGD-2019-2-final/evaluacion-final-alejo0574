-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Construya una consulta que ordene la tabla por letra y valor (3ra columna).
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
DROP TABLE IF EXISTS ordenado;

CREATE TABLE ordenado AS
    
    SELECT * FROM data ORDER BY letra, valor, fecha;

-- guardar resultado en output
INSERT OVERWRITE DIRECTORY '/tmp/output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM ordenado;

-- pasar del hdfs al local 
!hadoop fs -copyToLocal /tmp/output output;    