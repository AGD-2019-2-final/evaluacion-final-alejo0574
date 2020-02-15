-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<

datos = LOAD 'data.tsv'
                        AS (f1:CHARARRAY, f2:BAG{(f2a:CHARARRAY)}, f3:MAP[]);
bolsa_letras = FOREACH datos GENERATE FLATTEN(f2);

grupo_letras = GROUP bolsa_letras BY $0;

contar_letras = FOREACH grupo_letras GENERATE group, COUNT(bolsa_letras);

-- escribe el archivo de salida
STORE contar_letras INTO 'output' USING PigStorage ();

