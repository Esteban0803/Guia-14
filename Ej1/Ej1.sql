/* 1 */
select * from empleados;
/* 2 */
select * from departamentos;
/* 3 */
select  d.nombre_depto from departamentos d where d.id_depto;
/* 4 */
select e.nombre, e.sal_emp 
from empleados e 
where e.id_emp;
/* 5 */
select e.comision_emp 
from empleados e 
where e.id_emp;
/* 6 */
select e.cargo_emp, e.nombre
from empleados e
where e.id_emp
and e.cargo_emp = 'Secretaria';
/* 7 */
select  e.nombre, e.cargo_emp
from empleados e
where e.id_emp
order by nombre;
/* 8 */
select  e.nombre, e.cargo_emp, e.sal_emp
from empleados e
where e.id_emp
order by sal_emp;
/* 9 */
select d.nombre_jefe_depto, d.nombre_depto
from departamentos d
where d.id_depto
and d.ciudad = 'Ciudad Real';
/* 10 */
select e.nombre, e.cargo_emp
from empleados e
where e.id_emp;
/* 11 */
select e.nombre, e.sal_emp, e.comision_emp
from empleados e
where e.id_depto = '2000'
order by sal_emp;
/* 12 */
select e.nombre, SUM(sal_emp), SUM(comision_emp)
from empleados e
where e.id_emp
group by e.nombre
order by nombre;
/* 13 */
select * from empleados where nombre like 'J%';
/* 14 */
select e.nombre, e.sal_emp, e.comision_emp, (sal_emp + comision_emp) as Salario_Total
from empleados e
where comision_emp > 1000;
/* 15 */
select e.nombre, e.sal_emp, e.comision_emp, (sal_emp + comision_emp) as Salario_Total
from empleados e
where comision_emp = 0;
/* 16 */
select e.nombre 
from empleados e
where e.comision_emp > e.sal_emp
order by nombre;
/* 17 */
select e.nombre 
from empleados e
where e.comision_emp <= (0.3 * e.sal_emp)
order by nombre;
/* 18 */
select * from empleados where nombre not like '%MA%'
order by nombre;
/* 19 */
select d.nombre_depto, d.ciudad
from departamentos d
where nombre_depto in ('Ventas', 'Investigación', 'Mantenimiento');
/* 20 */
select d.nombre_depto, d.ciudad
from departamentos d
where nombre_depto not in ('Ventas', 'Investigación', 'Mantenimiento');
/* 21 */
select e.nombre, e.cargo_emp, e.sal_emp
FROM empleados e
WHERE sal_emp = (select MAX(sal_emp) from empleados);
/* 22 */
select nombre, cargo_emp
from empleados
order by nombre desc
limit 1;
/* 23 */
select MAX(sal_emp) as Salario_Maximo, MIN(sal_emp) as Salario_Minimo, MAX(sal_emp) - MIN(sal_emp) as Diferencia
from empleados;
/* 24 */
select d.nombre_depto, AVG(e.sal_emp) as SalarioPromedio /* el AVG se utiliza para sacar el promedio en donde se utilice*/
from departamentos d
join empleados e on d.id_depto = e.id_depto
group by d.nombre_depto;
/* 25 */
select d.nombre_depto, COUNT(e.id_emp) as Numero_Empleados
from departamentos d
join empleados e on d.id_depto = e.id_depto
group by d.id_depto, d.nombre_depto
having COUNT(e.id_emp) > 3;
/* 26 */
select d.nombre_depto
from departamentos d
left join empleados e on d.id_depto = e.id_depto /* une la parte de empleados con el id_depto*/
where e.id_emp is null;
/* 27 */
select e.nombre, e.sal_emp, d.nombre_depto
from empleados e
join departamentos d on e.id_depto = d.id_depto
where e.sal_emp >= (select AVG(sal_emp) from empleados)
order by d.nombre_depto;
