select * from producto, fabricante;
/*
ORDER BY
Order By: Ordena los productos o fabricantes segun como se lo planteemos
*/

select *
From fabricante
Order by nombre;
/*Ordena de manera ascendente por nombre*/

select *
From fabricante
Order by nombre desc;
/*Ordena de manera descendente*/

select *
From fabricante
Order by nombre, codigo;
/*Ordena de manera ascendete por nombre y luego por codigo*/

select f.nombre, p.nombre, p.precio
from fabricante f, producto p
where f.codigo = p.codigo_fabricante
order by f.nombre, p.nombre;
/*Ordena de manera ascander la columna nombre de  Fabricante y Producto*/

select f.nombre, p.nombre, p.precio
from fabricante f, producto p
where f.codigo = p.codigo_fabricante
order by p.nombre, f.nombre;
/*Ordena de manera ascander la columna nombre de  Producto y Fabricante*/

/*
GROUP BY
Group By: Permite agrupar resultados
*/

select f.nombre
from fabricante f, producto p
where f.codigo = p.codigo_fabricante
group by f.nombre;
/*Me trae el nombre de los fabricantes que tienen productos*/

select f.nombre, count(*)
from fabricante f, producto p
where f.codigo = p.codigo_fabricante
group by f.nombre;
/*Me trae el nombre de los fabricantes que tienen productos y nos dira cuantos productos tienen a la venta*/

/*
HAVING
Having: Dar la posibilas de introducir criterios a los agrupamientos hechos
*/

select f.nombre
from fabricante f, producto p
where f.codigo = p.codigo_fabricante
group by f.nombre
having count(*) > 1;
/*Me trae el nombre de los fabricantes que tengan mas de un producto a la venta*/

select f.nombre
from fabricante f, producto p
where f.codigo = p.codigo_fabricante
group by f.nombre
having count(*) > 1 and f.nombre <>'Lenovo'; 
/*Me trae el nombre de los fabricantes que tengan mas de un producto a la venta
pero excluyendo a Lenovo*/

select f.nombre, count(*), SUM(precio) 
from fabricante f, producto p
where f.codigo = p.codigo_fabricante
group by f.nombre
having SUM(precio) > 300; 
/*Trae a los fabricante, los agrupa y suma los precios de los productos.
having SUM(precio) > 300; con esa parte del codigo aclaramos que 
queremos los precios que sean mayores a 300*/