/* 1 */
select nombre from producto;
/* 2 */
select nombre, precio from producto;
/* 3 */
select * from producto;
/* 4 */
select nombre, ROUND(precio) as precio_redondeado from producto;
/* 5 */
select * from producto p
left outer join fabricante f
on p.codigo_fabricante = f.codigo;
/* 6 */
select distinct codigo_fabricante from producto;
/* 7 */
select nombre 
from fabricante
order by nombre;
/* 8 */
select nombre 
from producto
order by nombre;

select nombre 
from producto
order by nombre desc;
/* 9 */
select * from fabricante limit 5;
/* 10 */
select nombre, precio
from producto
order by precio desc
limit 1;
/* 11 */
select nombre, precio
from producto
order by precio
limit 1;
/* 12 */
select nombre from producto where precio <= 120;
/* 13 */
select precio from producto where precio between 60 and 200;
/* 14 */
select * from producto where codigo_fabricante in (1, 3, 5);
/* 15 */
select * from producto where nombre like '%Portátil%';

/* Consultas Multitabla */
/* 1 */
select p.codigo, p.nombre, p.codigo_fabricante, f.nombre
from producto p
join fabricante f on p.codigo_fabricante = f.codigo;
/* 2 */
select p.nombre, p.precio, f.nombre
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
order by f.nombre;
/* 3 */
select p.nombre, p.precio, f.nombre
from producto p 
join fabricante f on p.codigo_fabricante = f.codigo
order by precio desc
limit 1;
/* 4 */
select f.nombre, p.nombre
from fabricante f, producto p 
where f.nombre = 'Lenovo'
order by f.nombre;
/* 5 */
select p.* 
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = 'Crucial' 
and p.precio > 200;
/* 6 */
select p.* 
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre in ('Asus', 'Hewlett-Packard');
/* 7 */
select p.precio, p.nombre, f.nombre 
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
where p.precio > 200
order by p.precio;

select f.nombre, p.precio, p.nombre
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
where p.precio > 200
order by f.nombre;

/* Consultas Multitabla */
/* 1 */
select f.codigo, f.nombre, p.nombre
from fabricante f
left join producto p on f.codigo = p.codigo_fabricante;
/* 2 */
select f.codigo, f.nombre
from fabricante f
right join producto p on f.codigo = p.codigo_fabricante
where p.codigo_fabricante is null;

/* Con operadores básicos de comparación */
/* 1 */
select p.* 
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
and f.nombre = 'Lenovo';
/* 2 */
select * from producto
where precio = (
  select MAX(precio)
  from producto
  where codigo_fabricante = (
    select codigo
    from fabricante
    where nombre = 'Lenovo'));
/* 3 */
select nombre
from producto
where codigo_fabricante = (
select codigo
from fabricante
where nombre = 'Lenovo')
order by precio desc
limit 1;
/* 4 */
select nombre
from producto
where codigo_fabricante = (
select codigo
from fabricante
where nombre = 'Asus')
AND precio > (
  SELECT AVG(precio)
  FROM producto
  WHERE codigo_fabricante = (
    SELECT codigo
    FROM fabricante
    WHERE nombre = 'Asus'));

/* Subconsultas con IN y NOT IN */
/* 1 */
select nombre
from fabricante
where codigo in (
  select distinct codigo_fabricante
  from producto);
/* 2 */
select nombre
from fabricante
where codigo not in(
  select distinct codigo_fabricante
  from producto);

/* Subconsultas (En la cláusula HAVING) */
/* 1 */
select nombre
from fabricante
group by nombre
having COUNT(*) = (
  select COUNT(*)
  from producto
  where codigo_fabricante = (
    select codigo
    from fabricante
    where nombre = 'Lenovo'))
and nombre <> 'Lenovo';