--#########--#######
--###EJERCICIO 1 ###
--##################

-- CREACION DE LA BASE DE DATOS
CREATE DATABASE tienda;

-- Usar base de datos "tienda"
use tienda;

-- crear tabla  fabricante 
create table fabricante (
id int auto_increment primary key,
nombre varchar (100)
);

-- Mostrar tablas 
SHOW tables; 

-- Crear tabla de producto 
create  table producto( 
id int auto_increment primary key,
nombre varchar (100),
precio decimal (10,2),
id_fabricante int,
foreign key (id_fabricante) references fabricante(id)

);