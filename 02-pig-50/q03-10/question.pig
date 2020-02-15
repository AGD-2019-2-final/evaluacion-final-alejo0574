-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

-- Cargo los datos
datos = LOAD 'data.tsv' AS (letra:CHARARRAY, fecha:CHARARRAY, valor: INT);

-- De la bolsa de datos genero otra bolsa solo con la columna de valor 
bolsa_valor = FOREACH datos GENERATE $2 AS columna_valor;

-- De la bolsa de valores ordeno la única columna
ordenados = ORDER bolsa_valor BY $0;

-- Lilito solo los 5 primeros datos
lim5 = LIMIT ordenados 5;

-- escribe el archivo de salida
STORE lim5 INTO 'output';

