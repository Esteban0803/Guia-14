/*
Teoria:
Lenguaje Definicion de Datos (DDL) permite crear y definir nuevas bases de datos, campos e indices 
CREATE: Crear "Schema", "Table", Campos e Indices
ALTER: Modificar las tablas para añadir o modificar los campos 
DROP: Eliminar un esquema, tabla, etc.
SELECT: Consulta una base de datos que sigue una serie de criterios
INSERT: Carga un lote de datos en la base de datos
UPDATE: Modifica los valores de los campos registrados 
ELIMINATE: Elimina los registros de manera permanente de la base de datos
DROP DATABASE IF EXISTS tienda;

PRIMARY KEY: Al asignarle esto a un codigo es para que el mismo no se pueda repetir o usar lo mismo en distintas ocaciones
EJ: codigo INT UNSIGNED PRIMARY KEY
    INSERT INTO fabricante VALUES(1, 'Asus'); Vamos a poder crear un valor que se llame 1 Asus y se va a registrar
	INSERT INTO fabricante VALUES(1, 'Samsung'); Este ya no se va a registrar que el numero 1 ya se encuentra registrado
    
FOREING KAY: Sirve para conectar tablas entre si
EJ: codigo INT UNSIGNED PRIMARY KEY
    nombre VARCHAR(100) NOT NULL
    precio DOUBLE NOT NULL
    codigo_fabricante INT UNSIGNED NOT NULL, FOREING KEY (codigo_fabricante) REFERENCES fabricante(codigo) 
    
*/
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE DATABASE tienda;
USE tienda;
CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL, FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);
SELECT * FROM fabricante;
SELECT * FROM fabricante WHERE codigo = 10;

SELECT nombre FROM fabricante WHERE codigo = 2;

SELECT * FROM fabricante WHERE nombre = 'Samsung';

SELECT codigo, nombre FROM fabricante WHERE codigo = 8;

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO fabricante VALUES (10,'Teby');
INSERT INTO fabricante VALUES (11,'Teby');

SELECT COUNT(*) FROM fabricante; 
SELECT COUNT(*) FROM fabricante WHERE nombre = 'Teby';
/*
Count trae la cantidad de "Codigos" que hay ingresados
si le especificas el nombre del "Codigos", te dira cuantos "Codigos" hay con ese nombre
*/
SELECT MAX(codigo) FROM fabricante;
SELECT MIN(codigo) FROM fabricante;
/*
Selecciona el valor maximo y minimo de "Codigos"
*/
SELECT * FROM fabricante WHERE nombre LIKE '%by%';
SELECT * FROM fabricante WHERE nombre LIKE '%by';
SELECT * FROM fabricante WHERE nombre LIKE 'S%';
/*
Trae los "Codigos" que se espeficiquen
EJ:'%by%' trae los "codigos" que tengan los atributos "by"
   '%by' trae los "codigos" que terminan en "by"
   'S%' trae los "codigos" que empiezan en "S"
*/
select * from fabricante where codigo between 2 and 10;
/*
trae los fabricantes que hay entre los codigos 2 y 10
*/
/*
SELECT * FROM fabricante, producto;
UPDATE producto 
	SET nombre = 'Giu';
    WHERE codigo = 10;
*/
DELETE FROM producto WHERE codigo = 11;
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);
