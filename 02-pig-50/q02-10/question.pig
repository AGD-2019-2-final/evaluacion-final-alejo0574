-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 

-- Cargo los datos
datos = LOAD 'data.tsv' AS (letra:CHARARRAY, fecha:CHARARRAY, valor: INT);

-- De la bolsa de datos ordeno por la primera y tercera columna 
ordenados = ORDER datos BY $0, $2;

-- escribe el archivo de salida
STORE ordenados INTO 'output';

