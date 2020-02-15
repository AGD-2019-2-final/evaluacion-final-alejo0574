-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
datos = LOAD 'data.tsv'
                        AS (f1:CHARARRAY, 
                        f2:BAG{(f2a:CHARARRAY)}, 
                        f3:MAP[]);
                        
bolsa_map = FOREACH datos GENERATE FLATTEN(f3) AS (f1:CHARARRAY, f2:CHARARRAY);
bolsa = FOREACH bolsa_map GENERATE $0;
grupo = GROUP bolsa BY $0;
contar = FOREACH grupo GENERATE group, COUNT(bolsa);

-- escribe el archivo de salida
STORE contar INTO 'output' USING PigStorage (',');