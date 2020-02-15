-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

-- Cargo los datos
datos = LOAD 'data.tsv' AS (letra:CHARARRAY, fecha:CHARARRAY, valor: INT);

-- De la bolsa de datos genero otra bolsa solo con la columna de letras a contar 
bolsa_letras = FOREACH datos GENERATE $0 AS columna_letras;

-- Agrupo las letras en una nueva bolsa en forma clave valor donde la clave es la letra y el 
-- valor es una bolsa con los valores que se repiten de la letra
grupo_letras = GROUP bolsa_letras BY columna_letras;

-- cuento las palabras del grupo de letras 
contar_letras = FOREACH grupo_letras GENERATE group, COUNT(bolsa_letras);

-- escribe el archivo de salida
STORE contar_letras INTO 'output';