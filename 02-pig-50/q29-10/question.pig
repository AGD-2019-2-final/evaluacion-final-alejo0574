-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código en Pig para manipulación de fechas que genere la siguiente 
-- salida.
-- 
--    1971-07-08,jul,07,7
--    1974-05-23,may,05,5
--    1973-04-22,abr,04,4
--    1975-01-29,ene,01,1
--    1974-07-03,jul,07,7
--    1974-10-18,oct,10,10
--    1970-10-05,oct,10,10
--    1969-02-24,feb,02,2
--    1974-10-17,oct,10,10
--    1975-02-28,feb,02,2
--    1969-12-07,dic,12,12
--    1973-12-24,dic,12,12
--    1970-08-27,ago,08,8
--    1972-12-12,dic,12,12
--    1970-07-01,jul,07,7
--    1974-02-11,feb,02,2
--    1973-04-01,abr,04,4
--    1973-04-29,abr,04,4
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
temp1 = FOREACH u GENERATE ToString(ToDate(birthday,'yyyy-MM-dd'),'yyyy-MM-dd'), LOWER(ToString(ToDate(birthday,'yyyy-MM-dd'),'MMM')),ToString(ToDate(birthday,'yyyy-MM-dd'),'MM'), ToString(ToDate(birthday,'yyyy-MM-dd'),'M');
temp2 = FOREACH temp1 GENERATE $0, (
    CASE $1
        WHEN 'apr' THEN 'abr'
        WHEN 'jan' THEN 'ene'
        WHEN 'dec' THEN 'dic'
        WHEN 'aug' THEN 'ago'
        WHEN 'feb' THEN 'feb'
        WHEN 'jul' THEN 'jul'
        WHEN 'oct' THEN 'oct'
        WHEN 'may' THEN 'may'
    END
),$2,$3;

-- escribe el archivo de salida
STORE temp2 INTO 'output' USING PigStorage(',');