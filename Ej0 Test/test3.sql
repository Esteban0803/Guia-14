select * from producto, fabricante;

select * 
from producto p
inner join fabricante f
on p.codigo_fabricante = f.codigo;
/*Inner Join: Da como resultado los valores que tiene interseccion en ambas tablas
osea, nos muestra los valores que estan en ambas tablas. Muestra los productos que tengan fabricante
por eso "Teby" no se muestra, ya que no tiene productos*/

select * 
from producto p
left outer join fabricante f
on p.codigo_fabricante = f.codigo;
/*Left Outer Join: Muestra las intersecciones que hay entre ambas tablas.
Parecido al Inner Join, pero con la diferencia que "Teby" no se muestra porque no 
tiene un producto con el cual ser emparejado*/

select * 
from producto p
right outer join fabricante f
on p.codigo_fabricante = f.codigo;
/*Right Outer Join: Trae todos los fabricantes y producctos y 
da los valores solicitados junto con la interseccion de la otra tabla*/

select * 
from producto p
where exists (select f.codigo
				from fabricante 
                where f.codigo = p.codigo_fabricante);
/*Send Join (exists): Permite saber si un "Producto" existe para un "Fabricante" Una vinculacion entre Producto y Fabricante*/

select * 
from producto p
where not exists (select f.codigo
				from fabricante 
                where f.codigo = p.codigo_fabricante);
/*Send Join (not exists)Lo contrario al anterior, trae los productos que no tengan fabricante*/

select * 
from fabricante f
where not exists (select p.codigo_fabricante
				from producto p
                where p.codigo_fabricante = f.codigo); 
/*Trae fabricante que no tengas productos*/

select *
from producto p
cross join fabricante f;
/*Cross Join: Une TODOS los productos con TODOS los fabricantes*/