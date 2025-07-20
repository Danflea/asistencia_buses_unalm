CREATE TEMPORARY TABLE alumnos_temp (
    codigo VARCHAR(20),
    foto_url TEXT
);

LOAD DATA INFILE 'imagen_nombre.csv'
INTO TABLE alumnos_temp
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(codigo, foto_url);


UPDATE alumnos a
JOIN alumnos_temp t ON a.codigo = t.codigo
SET a.foto_url = t.foto_url;
