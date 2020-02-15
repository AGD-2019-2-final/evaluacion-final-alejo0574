-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.csv` escriba una consulta en Pig que genere la 
-- siguiente salida:
-- 
--   Vivian@Hamilton
--   Karen@Holcomb
--   Cody@Garrett
--   Roth@Fry
--   Zoe@Conway
--   Gretchen@Kinney
--   Driscoll@Klein
--   Karyn@Diaz
--   Merritt@Guy
--   Kylan@Sexton
--   Jordan@Estes
--   Hope@Coffey
--   Vivian@Crane
--   Clio@Noel
--   Hope@Silva
--   Ayanna@Jarvis
--   Chanda@Boyer
--   Chadwick@Knight
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--

datos = LOAD 'data.csv' USING PigStorage(',')
                    AS (
                        num:INT,
                        nombre:CHARARRAY,
                        apellido:CHARARRAY,
                        fecha:CHARARRAY,
                        color:CHARARRAY,
                        valor:INT
                        );
                        
concat = FOREACH datos GENERATE CONCAT(nombre,'@',apellido); 

-- escribe el archivo de salida
STORE concat INTO 'output';