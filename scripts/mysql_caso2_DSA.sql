/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     5/26/2019 9:05:10 AM                         */
/*==============================================================*/


drop table if exists DSA_CLIENTE;

drop table if exists DSA_COLOR;

drop table if exists DSA_DETALLE_FACTURA;

drop table if exists DSA_DIRECCION;

drop table if exists DSA_FACTURA;

drop table if exists DSA_GRUPO_PRODUCTO;

drop table if exists DSA_LOCAL;

drop table if exists DSA_MARCA;

drop table if exists DSA_MODELO;

drop table if exists DSA_PRESUPUESTO;

drop table if exists DSA_PRODUCTO;

drop table if exists DSA_SUB_GRUPO_PRODUCTO;

drop table if exists DSA_TELEFONO;

drop table if exists DSA_TIPO;

drop table if exists DSA_UBICACION_GEOGRAFICA;

/*==============================================================*/
/* Table: DSA_CLIENTE                                           */
/*==============================================================*/
create table DSA_CLIENTE
(
   CEDULA               varchar(13) not null,
   NOMBRES              varchar(50),
   APELLIDOS            varchar(50),
   FECHA_CARGA          date,
   primary key (CEDULA)
);

/*==============================================================*/
/* Table: DSA_COLOR                                             */
/*==============================================================*/
create table DSA_COLOR
(
   COD_COLOR            varchar(100) not null,
   COLOR                varchar(50),
   FECHA_CARGA          date,
   primary key (COD_COLOR)
);

/*==============================================================*/
/* Table: DSA_DETALLE_FACTURA                                   */
/*==============================================================*/
create table DSA_DETALLE_FACTURA
(
   ID_DETALLE           varchar(100) not null,
   NUMERO_FACTURA       varchar(100),
   CANTIDAD             numeric(2,0),
   PRECIO               double,
   COD_PRODUCTO         varchar(100),
   FECHA_CARGA          date,
   primary key (ID_DETALLE)
);

/*==============================================================*/
/* Table: DSA_DIRECCION                                         */
/*==============================================================*/
create table DSA_DIRECCION
(
   COD_DIRECCION        varchar(100) not null,
   DIRECCION            varchar(100),
   CALLE_PRINCIPAL      varchar(100),
   NUMERO               varchar(50),
   CALLE_SECUNDARIA     varchar(100),
   COD_TIPO             varchar(100),
   CEDULA               varchar(100),
   FECHA_CARGA          date,
   primary key (COD_DIRECCION)
);

/*==============================================================*/
/* Table: DSA_FACTURA                                           */
/*==============================================================*/
create table DSA_FACTURA
(
   NUMERO_FACTURA       varchar(100) not null,
   CEDULA               varchar(13),
   FECHA_EMISION        timestamp,
   AUTORIZACION         varchar(50),
   MONTO                double,
   IVA                  double,
   DESCUENTO            double,
   COD_LOCAL            varchar(50),
   FECHA_CARGA          date,
   primary key (NUMERO_FACTURA)
);

/*==============================================================*/
/* Table: DSA_GRUPO_PRODUCTO                                    */
/*==============================================================*/
create table DSA_GRUPO_PRODUCTO
(
   COD_GRUPO            varchar(100) not null,
   GRUPO                varchar(50),
   COD_SUBGRUPO         varchar(100),
   FECHA_CARGA          date,
   primary key (COD_GRUPO)
);

/*==============================================================*/
/* Table: DSA_LOCAL                                             */
/*==============================================================*/
create table DSA_LOCAL
(
   COD_LOCAL            varchar(100) not null,
   COD_UBICACION        varchar(100),
   LOCAL                varchar(100),
   FECHA_CARGA          date,
   primary key (COD_LOCAL)
);

/*==============================================================*/
/* Table: DSA_MARCA                                             */
/*==============================================================*/
create table DSA_MARCA
(
   COD_MARCA            varchar(100) not null,
   MARCA                varchar(50),
   FECHA_CARGA          date,
   primary key (COD_MARCA)
);

/*==============================================================*/
/* Table: DSA_MODELO                                            */
/*==============================================================*/
create table DSA_MODELO
(
   COD_MODELO           varchar(100) not null,
   MODELO               varchar(100),
   FECHA_CARGA          date,
   primary key (COD_MODELO)
);

/*==============================================================*/
/* Table: DSA_PRESUPUESTO                                       */
/*==============================================================*/
create table DSA_PRESUPUESTO
(
   ID_PRESUPUESTO       bigint not null,
   COD_SUBGRUPO         varchar(100),
   COD_LOCAL            varchar(100),
   MONTO                double,
   FECHA                date,
   FECHA_CARGA          date,
   primary key (ID_PRESUPUESTO)
);

/*==============================================================*/
/* Table: DSA_PRODUCTO                                          */
/*==============================================================*/
create table DSA_PRODUCTO
(
   COD_PRODUCTO         varchar(100) not null,
   DESCRIPCION_PRODUCTO varchar(100),
   PRECIO               double,
   COD_MARCA            varchar(100),
   COD_MODELO           varchar(100),
   COD_COLOR            varchar(100),
   COD_SUBGRUPO         varchar(100),
   COD_GRUPO            varchar(100),
   FECHA_CARGA          date,
   primary key (COD_PRODUCTO)
);

/*==============================================================*/
/* Table: DSA_SUB_GRUPO_PRODUCTO                                */
/*==============================================================*/
create table DSA_SUB_GRUPO_PRODUCTO
(
   COD_SUBGRUPO         varchar(100) not null,
   SUBGRUPO                varchar(50),
   FECHA_CARGA          date,
   primary key (COD_SUBGRUPO)
);

/*==============================================================*/
/* Table: DSA_TELEFONO                                          */
/*==============================================================*/
create table DSA_TELEFONO
(
   COD_TELEFONO         varchar(100) not null,
   NUMERO_TELEFONO      varchar(50),
   COD_TIPO             varchar(100),
   CEDULA               varchar(100),
   FECHA_CARGA          date,
   primary key (COD_TELEFONO)
);

/*==============================================================*/
/* Table: DSA_TIPO                                              */
/*==============================================================*/
create table DSA_TIPO
(
   COD_TIPO             varchar(100) not null,
   TIPO                 varchar(50),
   FECHA_CARGA          date,
   primary key (COD_TIPO)
);

/*==============================================================*/
/* Table: DSA_UBICACION_GEOGRAFICA                              */
/*==============================================================*/
create table DSA_UBICACION_GEOGRAFICA
(
   COD_UBICACION        varchar(100) not null,
   UBICACION            varchar(50),
   COD_PADRE_UBICACION  varchar(100),
   FECHA_CARGA          date,
   primary key (COD_UBICACION)
);

