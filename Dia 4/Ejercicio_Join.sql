show databases;
use dia3;
show tables;

-- Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
select codigo_oficina, ciudad from oficina;

-- Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
select ciudad, telefono from oficina where pais= "España";

-- Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
select nombre, apellido1, apellido2, email from empleado where codigo_jefe = 7;

-- Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
select puesto, nombre, apellido1, apellido2, email 
from empleado e
where e.codigo_jefe is null;


-- Consultas multitabla 

-- Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
select c.nombre_cliente, e.nombre, e.apellido1, e.apellido2
from cliente c inner join empleado e 
on e.codigo_empleado = c.codigo_empleado_rep_ventas;

-- Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
select c.nombre_cliente, e.nombre, e.apellido1, e.apellido2
from cliente c 
inner join pago p on c.codigo_cliente = p.codigo_cliente 
inner join empleado e
on c.codigo_empleado_rep_ventas = e.codigo_empleado;


-- Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
select c.nombre_cliente, e.nombre, e.apellido1, e.apellido2 
from cliente c 
inner join pago p on c.codigo_cliente = p.codigo_cliente 
inner join empleado e
on c.codigo_empleado_rep_ventas = e.codigo_empleado
inner join oficina o on  e.codigo_oficina = o.codigo_oficina;

-- Lista la dirección de las oficinas que tengan clientes en Fuenlabrada. 
-- distinct: sirve para que los datos repedtidos se pongan como unicos.
select distinct o.linea_direccion1, o.linea_direccion2
from cliente 
inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado_
inner join oficina o  on e.codigo_oficina = o.codigo_oficina
where c.ciudad = 'Fuenlabrada';

-- Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe 
-- y el nombre del jefe de sus jefe.
select empleado.nombre as nombreEmpleado , jefe.nombre as NombreJefe, jefe2.nombre as NombreJefe2
from empleado 
inner join empleado jefe on empleado.codigo_jefe = jefe.codigo_empleado
inner join empleado jefe2 on jefe.codigo_jefe = jefe2.codigo_empleado;

-- devuelve un listado con los datos de los empleados  que no 
-- tienen clientes asociados y el nombre de su jefe asociado.


-- desarrollado por Jorge Mozo / ID: 1.099.738.869