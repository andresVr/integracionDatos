create schema control;
create schema datawarehouse;
select * from datawarehouse.DSA_PRODUCTO;
select * from datawarehouse.DSA_MARCA;
select * from datawarehouse.DSA_SUB_GRUPO_PRODUCTO;
select * from datawarehouse.DSA_CLIENTE;
select * from datawarehouse.DSA_TELEFONO;
select * from datawarehouse.DSA_FACTURA;
select * from datawarehouse.DSA_DETALLE_FACTURA;
select * from datawarehouse.DSA_SUB_GRUPO_PRODUCTO;
select * from datawarehouse.DSA_TIPODSA_SUB_GRUPO_PRODUCTO;
select * from datawarehouse.DSA_DIRECCION;
select * from datawarehouse.DSA_PRESUPUESTO;
select * from datawarehouse.DSA_LOCAL;
select MIN(FECHA_EMISION) from datawarehouse.DSA_FACTURA;
select * from datawarehouse.DSA_UBICACION_GEOGRAFICA provincia where provincia.COD_PADRE_UBICACION is null;
SELECT * FROM datawarehouse.DIM_CLIENTE;
SELECT * FROM datawarehouse.DIM_PRODUCTO;
SELECT * FROM datawarehouse.DIM_TELEFONO;
SELECT * FROM datawarehouse.DIM_DIRECCION;
SELECT * FROM datawarehouse.DIM_SUBGRUPO;
SELECT * FROM datawarehouse.DIM_PRODUCTO;
SELECT * FROM datawarehouse.DIM_DOCUMENTO;
SELECT * FROM datawarehouse.DIM_UBICACION_GEOGRAFICA;
SELECT * FROM datawarehouse.DIM_LOCAL;
SELECT * FROM datawarehouse.DIM_FECHA;
SELECT * FROM control.ETL_FECHA_CARGA;
SELECT * FROM datawarehouse.FAC_CABECERA_FACTURA;
SELECT * FROM datawarehouse.FAC_DETALLE_FACTURA;
SELECT * FROM datawarehouse.FAC_PRESUPUESTO_MENSUAL;

SELECT * FROM datawarehouse.DIM_DOCUMENTO 
WHERE ID_FECHA BETWEEN (Select ID_FECHA_INICIO from control.ETL_FECHA_CARGA order by ID_ETL_FECHA_CARGA DESC LIMIT 1
) AND (Select ID_FECHA_FIN from control.ETL_FECHA_CARGA order by ID_ETL_FECHA_CARGA DESC LIMIT 1);

Select ID_FECHA_INICIO from control.ETL_FECHA_CARGA order by ID_ETL_FECHA_CARGA DESC LIMIT 1;

select COUNT(*) FROM datawarehouse.FAC_CABECERA_FACTURA;
select COUNT(*) FROM datawarehouse.FAC_CABECERA_FACTURA;
select SUM(MONTO) FROM datawarehouse.FAC_CABECERA_FACTURA WHERE ID_FECHA BETWEEN 20171201 AND 20171231;
select SUM(MONTO) from datawarehouse.DSA_FACTURA WHERE FECHA_EMISION between '2017-12-01' AND '2017-12-31';
select SUM(MONTO) from datawarehouse.FAC_CABECERA_MENSUAL WHERE ID_FECHA = 20171201;

select COUNT(*) FROM datawarehouse.FAC_DETALLE_FACTURA;
select * FROM datawarehouse.FAC_DETALLE_FACTURA;

SELECT * FROM datawarehouse.FAC_DETALLE_FACTURA_MENSUAL;
SELECT * FROM datawarehouse.FAC_CABECERA_MENSUAL;

select SUM(CANTIDAD) FROM datawarehouse.FAC_DETALLE_FACTURA WHERE ID_FECHA BETWEEN 20171201 AND 20171231;
select SUM(CANTIDAD) FROM datawarehouse.FAC_DETALLE_FACTURA_MENSUAL WHERE ID_FECHA = 20171230;
select * FROM datawarehouse.FAC_CABECERA_MENSUAL;
select * FROM datawarehouse.FAC_CABECERA_MENSUAL;
select * FROM datawarehouse.FAC_DETALLE_FACTURA;
select count(*) FROM datawarehouse.FAC_DETALLE_FACTURA_MENSUAL;
select * FROM datawarehouse.FAC_PRESUPUESTO_MENSUAL;

SELECT * FROM datawarehouse.DIM_DOCUMENTO;

SELECT distinct F.CEDULA from datawarehouse.DSA_FACTURA F
right join datawarehouse.DIM_CLIENTE C on F.CEDULA=C.CEDULA; 

SELECT COUNT(CEDULA) FROM datawarehouse.DIM_CLIENTE;
SELECT COUNT(distinct CEDULA) FROM datawarehouse.DSA_FACTURA;


select * from datawarehouse.DIM_DOCUMENTO;



select * from DSA_TELEFONO;


select provincia.COD_UBICACION, provincia.UBICACION, 
canton.COD_UBICACION,canton.UBICACION, parroquia.COD_UBICACION, parroquia.UBICACION
 from datawarehouse.DSA_UBICACION_GEOGRAFICA provincia
inner join datawarehouse.DSA_UBICACION_GEOGRAFICA canton on  canton.COD_PADRE_UBICACION = provincia.COD_UBICACION
inner join datawarehouse.DSA_UBICACION_GEOGRAFICA parroquia on  parroquia.COD_PADRE_UBICACION = canton.COD_UBICACION ;
/*where provincia.COD_PADRE_UBICACION is null;*/

select * from datawarehouse.DSA_UBICACION_GEOGRAFICA;
select * from control.ETL_FECHA_CARGA;
select * from control.TMP_FECHA_CARGA ORDER BY MODULO ASC;
DELETE from control.TMP_FECHA_CARGA WHERE MODULO = 'VENTAS';

SELECT MIN(FECHA_INICIO) FROM control.TMP_FECHA_CARGA;
SELECT MIN(FECHA_FIN) FROM control.TMP_FECHA_CARGA;

select FORSAT from control.ETL_FECHA_CARGA WHERE MODULO='VENTAS';

UPDATE control.ETL_FECHA_CARGA SET FECHA_INICIO = (
SELECT MIN(FECHA_INICIO) FROM control.TMP_FECHA_CARGA
) WHERE MODULO = 'VENTAS';

