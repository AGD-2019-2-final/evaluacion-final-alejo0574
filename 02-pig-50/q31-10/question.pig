-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
temp1 = FOREACH u GENERATE SUBSTRING(birthday, 0, 4) AS anio;
temp2 = GROUP temp1 BY anio;
contar = FOREACH temp2 GENERATE group, COUNT(temp1);

-- escribe el archivo de salida
STORE contar INTO 'output' USING PigStorage(',');