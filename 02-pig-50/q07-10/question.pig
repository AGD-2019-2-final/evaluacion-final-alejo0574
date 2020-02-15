-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
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

size1 = FOREACH datos GENERATE f1, SIZE(f2), SIZE(f3);

ordenado = ORDER size1 BY $0, $1, $2;

-- escribe el archivo de salida
STORE ordenado INTO 'output' USING PigStorage (',');