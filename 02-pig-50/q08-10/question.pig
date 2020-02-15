-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

datos = LOAD 'data.tsv' AS (f1:CHARARRAY, f2:BAG{(f2a:CHARARRAY)}, f3:MAP[]);

temp1 = FOREACH datos GENERATE FLATTEN(f2) AS f0, FLATTEN(f3) AS (f1:CHARARRAY, f2:CHARARRAY);
temp2 = FOREACH temp1 GENERATE $0, $1;
temp3 = ORDER temp2 BY $0, $1;
temp4 = GROUP temp3 BY ($0, $1);

contador = FOREACH temp4 GENERATE group, COUNT(temp3);

-- escribe el archivo de salida
STORE contador INTO 'output' USING PigStorage ();