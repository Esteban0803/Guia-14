select * from producto, fabricante;

Select f.nombre, p.nombre, p.precio
from fabricante f, producto p 
where f.codigo = p.codigo_fabricante;

Select f.nombre, p.nombre, p.precio
from fabricante f, producto p 
where f.codigo = p.codigo_fabricante
and f.codigo = 7; /* trae solo al fabricante de codigo 7*/

Select f.nombre, f.codigo
from fabricante f, producto p 
where f.codigo = p.codigo_fabricante
and f.codigo = 7; /*solo trae el nombre y codigo del fabricante 7*/

Select p.nombre, p.codigo, p.precio
from fabricante f, producto p 
where f.codigo = p.codigo_fabricante
and f.codigo = 7; /*solo trae el nombre, codigo y precio del producto 7*/

Select p.nombre, p.codigo, p.precio
from fabricante f, producto p 
where f.codigo = p.codigo_fabricante
and f.codigo = 'Lenovo'; /*trae la informacion del fabricante Lenovo*/

Select p.nombre, p.codigo, p.precio
from fabricante f, producto p 
where f.codigo = p.codigo_fabricante
and f.codigo = 'Lenovo' 
and p.precio > 450; /*trae la informacion del fabricante Lenovo que solo tenga un precio inferior a 450*/

