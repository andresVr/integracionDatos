/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     6/7/2019 3:24:30 AM                          */
/*==============================================================*/

drop table if exists FAC_CABECERA_FACTURA;

drop table if exists FAC_CABECERA_MENSUAL;

drop table if exists FAC_DETALLE_FACTURA;

drop table if exists FAC_DETALLE_FACTURA_MENSUAL;

drop table if exists FAC_PRESUPUESTO_MENSUAL;

drop table if exists FAC_VENTA_ACUMULADA;

drop table if exists DIM_DIRECCION;

drop table if exists DIM_TELEFONO;

drop table if exists DIM_CLIENTE;

drop table if exists DIM_DOCUMENTO;

drop table if exists DIM_FECHA;

drop table if exists DIM_LOCAL;

drop table if exists DIM_PRODUCTO;

drop table if exists DIM_SUBGRUPO;

drop table if exists DIM_UBICACION_GEOGRAFICA;


/*==============================================================*/
/* Table: DIM_CLIENTE                                           */
/*==============================================================*/
create table DIM_CLIENTE
(
   ID_CLIENTE           bigint not null auto_increment comment 'Secuencial de la dimensión Cliente',
   CEDULA               varchar(13) comment 'documento de identificación cliente',
   NOMBRES              varchar(50) comment 'Nombres del Cliente',
   APELLIDOS            varchar(50) comment 'Apellidos del Cliente',
   FECHA_CARGA          datetime comment 'fecha de Carga DW del Cliente',
   primary key (ID_CLIENTE)
);

alter table DIM_CLIENTE comment 'dimensión que permite almacenar los clientes del transaccion';

/*==============================================================*/
/* Table: DIM_DIRECCION                                         */
/*==============================================================*/
create table DIM_DIRECCION
(
   ID_DIRECCION         bigint not null auto_increment comment 'secuencial de la dimension direccion',
   ID_CLIENTE           bigint comment 'Secuencial de la dimensión Cliente',
   COD_DIRECCION        varchar(100) comment 'codigo transaccional de la direccion, se utiliza como clave alterna unica',
   DIRECCION            varchar(100) comment 'direccion del cliente',
   CALLE_PRINCIPAL      varchar(100) comment 'calle principal de la direccion del cliente',
   NUMERO               varchar(50) comment 'numero de casa o departamento ',
   CALLE_SECUNDARIA     varchar(100) comment 'calle secundaria de la direccion del cliente',
   COD_TIPO             longtext comment 'referencia codigo tipo',
   TIPO                 varchar(100) comment 'referencia tipo',
   FECHA_CARGA          datetime comment 'fecha de carga de los registros',
   primary key (ID_DIRECCION)
);

alter table DIM_DIRECCION comment 'dimensión que permite almacenar los las direcciones de los c';

/*==============================================================*/
/* Table: DIM_DOCUMENTO                                         */
/*==============================================================*/
create table DIM_DOCUMENTO
(
   ID_DOCUMENTO         bigint not null auto_increment comment 'secuencial dimension documento',
   ID_FECHA             bigint comment 'secuencial dimension fecha',
   NUMERO_FACTURA       varchar(100) comment 'numero de documento de la venta',
   AUTORIZACION         varchar(100) comment 'almacena la autorizacion del SRI del documento',
   FECHA_CARGA          datetime comment 'fecha d carga del registro al dtwh',
   primary key (ID_DOCUMENTO)
);

alter table DIM_DOCUMENTO comment 'dimension degenerada que almacena los datos de los documento';

/*==============================================================*/
/* Table: DIM_FECHA                                             */
/*==============================================================*/
create table DIM_FECHA
(
   ID_FECHA             bigint not null auto_increment comment 'secuencial dimension fecha',
   FECHA                date comment 'fecha',
   ANIO                 int comment 'año fecha',
   MES                  int comment 'mes fecha',
   DIA                  int comment 'dia fecha',
   FECHA_CARGA          datetime comment 'fecha de carga del registro en el dtwh',
   primary key (ID_FECHA)
);

alter table DIM_FECHA comment 'Dimension que permite almacenar el tiempo y todos sus nivele';

/*==============================================================*/
/* Table: DIM_LOCAL                                             */
/*==============================================================*/
create table DIM_LOCAL
(
   ID_LOCAL             bigint not null auto_increment comment 'secuencial dimension local',
   ID_UBICACION         bigint comment 'secuencial de la dimension ubicacion',
   COD_LOCAL            varchar(100) comment 'codigo de la tabla transaccional local, se idetifica como clave alterna unica',
   LOCAL                varchar(100) comment 'referencia al o nombre o descripcion del local',
   FECHA_CARGA          datetime comment 'fecha de carga del registro al datawarehouse',
   primary key (ID_LOCAL)
);

alter table DIM_LOCAL comment 'dimensión que permite almacenar los locales de la empresa.
                              ';

/*==============================================================*/
/* Table: DIM_PRODUCTO                                          */
/*==============================================================*/
create table DIM_PRODUCTO
(
   ID_PRODUCTO          bigint not null auto_increment comment 'secuencial de la dimensió producto',
   ID_SUBGRUPO          bigint,
   COD_PRODUCTO         varchar(100),
   DESCRIPCION_PRODUCTO varchar(100),
   PRECIO               numeric(4,2),
   COD_MARCA            varchar(100),
   MARCA                varchar(100),
   COD_MODELO           varchar(100),
   MODELO               varchar(100),
   COD_COLOR            varchar(100),
   COLOR                varchar(100),
   COD_GRUPO            varchar(100),
   GRUPO                varchar(100),
   FECHA_CARGA          datetime,
   primary key (ID_PRODUCTO)
);

alter table DIM_PRODUCTO comment 'dimensión que permite almacenar los productos del transaccio';

/*==============================================================*/
/* Table: DIM_SUBGRUPO                                          */
/*==============================================================*/
create table DIM_SUBGRUPO
(
   ID_SUBGRUPO          bigint not null auto_increment comment 'secuencial dimension subgrupo',
   COD_SUBGRUPO         varchar(100) comment 'codigo transaccional de la tabla grupo_producto',
   SUBGRUPO             varchar(100) comment 'nombre o descripcion subgrupo',
   FECHA_CARGA          datetime comment 'fecha de carga del registro en el dtwh',
   primary key (ID_SUBGRUPO)
);

alter table DIM_SUBGRUPO comment 'dimensión que permite almacenar los grupos de los productos ';

/*==============================================================*/
/* Table: DIM_TELEFONO                                          */
/*==============================================================*/
create table DIM_TELEFONO
(
   ID_TELEFONO          bigint not null auto_increment comment 'secuencial dimension telefono',
   ID_CLIENTE           bigint comment 'Secuencial de la dimensión Cliente',
   COD_TELEFONO         varchar(100) comment 'clave alterna unica proveniente del modelo transaccional',
   NUMERO_TELEFONO      varchar(50) comment 'numero de telefono del cliente',
   COD_TIPO             varchar(100) comment 'codigo de la referencia tipo',
   TIPO                 varchar(100) comment 'referencia tipo',
   FECHA_CARGA          datetime comment 'fecha carga del registro',
   primary key (ID_TELEFONO)
);

alter table DIM_TELEFONO comment 'tabla de dimension que permite almacenar los telefonos asoci';

/*==============================================================*/
/* Table: DIM_UBICACION_GEOGRAFICA                              */
/*==============================================================*/
create table DIM_UBICACION_GEOGRAFICA
(
   ID_UBICACION         bigint not null auto_increment comment 'secuencial de la dimension ubicacion',
   COD_UBICACION_PROVINCIA varchar(100) comment 'codigo inec provincia',
   UBICACION_PROVINCIA  varchar(100) comment 'nombre provincia',
   COD_UBICACION_CANTON varchar(100) comment 'codigo inec canton',
   UBICACION_CANTON     varchar(100) comment 'nombre o descripcion canton
            ',
   COD_UBICACION_PARROQUIA varchar(100) comment 'codigo inec parroquia',
   UBICACION_PARROQUIA  varchar(100) comment 'nombre o descripcion parroquia',
   FECHA_CARGA          datetime comment 'fecha de carga del registro en el dtwh',
   primary key (ID_UBICACION)
);

alter table DIM_UBICACION_GEOGRAFICA comment 'dimensión que permite almacenar los datos de la ubicacion ge';

/*==============================================================*/
/* Table: FAC_CABECERA_FACTURA                                  */
/*==============================================================*/
create table FAC_CABECERA_FACTURA
(
   ID_CLIENTE           bigint not null comment 'secuencial de la tabla cliente',
   ID_LOCAL             bigint not null comment 'secuencial dimension Local',
   ID_UBICACION         bigint not null comment 'secuencial dimension ubicacion',
   ID_FECHA             bigint not null comment 'secuencial dimension fecha',
   ID_DOCUMENTO         bigint not null comment 'secuencial de la dimension documento',
   MONTO                double comment 'monto total de la factura por cliente',
   IVA                  double comment 'valor del impuesto al valor agregado del documento de la venta',
   DESCUENTO            double comment 'descuento de la venta',
   FECHA_CARGA          datetime comment 'fecha de carga del registro a la base del warehouse',
   primary key (ID_CLIENTE, ID_LOCAL, ID_UBICACION, ID_FECHA, ID_DOCUMENTO)
);

alter table FAC_CABECERA_FACTURA comment 'tabla de hechos que permite almacenar  la cabecera de las fa';

/*==============================================================*/
/* Table: FAC_CABECERA_MENSUAL                                  */
/*==============================================================*/
create table FAC_CABECERA_MENSUAL
(
   ID_CLIENTE           bigint not null comment 'secuencial de la dimension cliente',
   ID_LOCAL             bigint not null comment 'secuencial de la dimension local',
   ID_UBICACION         bigint not null comment 'secuencial de la dimension ubicacion',
   ID_FECHA             bigint not null comment 'secuencial de la dimension fecha
            ',
   MONTO                double,
   FECHA_CARGA          datetime,
   primary key (ID_CLIENTE, ID_LOCAL, ID_UBICACION, ID_FECHA)
);

alter table FAC_CABECERA_MENSUAL comment 'tabla de hechos que permite almacenar  la cabecera de las fa';

/*==============================================================*/
/* Table: FAC_DETALLE_FACTURA                                   */
/*==============================================================*/
create table FAC_DETALLE_FACTURA
(
   ID_PRODUCTO          bigint not null comment 'secuencial de la dimensió producto',
   ID_DOCUMENTO         bigint not null comment 'secuencial de la dimnesion documento',
   ID_CLIENTE           bigint not null comment 'Secuencial de la dimensión Cliente',
   ID_FECHA             bigint not null comment 'secuencial de la dimension fecha
            ',
   ID_LOCAL             bigint not null comment 'secuencial de la dimnesion local',
   ID_UBICACION         bigint not null comment 'secuencial de la dimension ubicacion
            ',
   ID_SUBGRUPO          bigint not null comment 'secuencial del subgrupo',
   CANTIDAD             double comment 'cantidad por producto por factura',
   PRECIO               double comment 'precio de cada articulo del detalle de la factura',
   FECHA_CARGA          datetime comment 'fecha de carga del dato en el dtwh',
   primary key (ID_PRODUCTO, ID_DOCUMENTO, ID_CLIENTE, ID_FECHA, ID_LOCAL, ID_UBICACION, ID_SUBGRUPO)
);

alter table FAC_DETALLE_FACTURA comment 'tabla de hechos permite almacenar el detalle de los producto';

/*==============================================================*/
/* Table: FAC_DETALLE_FACTURA_MENSUAL                           */
/*==============================================================*/
create table FAC_DETALLE_FACTURA_MENSUAL
(
   ID_PRODUCTO          bigint not null comment 'secuencial de la dimensió producto',
   ID_FECHA             bigint not null,
   ID_LOCAL             bigint not null,
   ID_UBICACION         bigint not null,
   ID_SUBGRUPO          bigint not null,
   CANTIDAD             double,
   FECHA_CARGA          datetime,
   primary key (ID_PRODUCTO, ID_FECHA, ID_LOCAL, ID_UBICACION, ID_SUBGRUPO)
);

alter table FAC_DETALLE_FACTURA_MENSUAL comment 'tabla de hechos permite almacenar el detalle de los producto';

/*==============================================================*/
/* Table: FAC_PRESUPUESTO_MENSUAL                               */
/*==============================================================*/
create table FAC_PRESUPUESTO_MENSUAL
(
   ID_LOCAL             bigint not null comment 'secuencial dimension local
            ',
   ID_UBICACION         bigint not null comment 'secuencial dimension ubicacion',
   ID_FECHA             bigint not null comment 'secuencial dimension fecha',
   ID_SUBGRUPO          bigint not null comment 'secuencial dimension subgrupo',
   MONTO                double comment 'monto del presupuesto por subgrupo',
   FECHA_CARGA          datetime,
   primary key (ID_LOCAL, ID_UBICACION, ID_FECHA, ID_SUBGRUPO)
);

alter table FAC_PRESUPUESTO_MENSUAL comment 'tabla de hechos que permite almacenar el detalle del presupu';

/*==============================================================*/
/* Table: FAC_VENTA_ACUMULADA                                   */
/*==============================================================*/
create table FAC_VENTA_ACUMULADA
(
   ID_LOCAL             bigint not null comment 'secuencial de la dimension local',
   ID_FECHA             bigint not null comment 'secuencial dimension fecha',
   ID_UBICACION         bigint not null comment 'secuencial dimension ubicacion',
   ID_PRODUCTO          bigint not null comment 'secuencial de la dimensió producto',
   ID_SUBGRUPO          bigint not null comment 'secuencial de la dimension subgrupo',
   VALOR                double comment 'valor venta del mes',
   VALOR_MES_1          double comment 'valor de la venta del mes anterior',
   YTD                  double comment 'valor de la venta del anio',
   YTD_1                double comment 'valor de la venta del anio anterior',
   MTD                  double comment 'valor de la venta del mes a la fecha',
   MT_1                 double comment 'ventas del mes a la fecha del mes anterior',
   FECHA_CARGA          datetime comment 'fecha de carga del registro en el dtwh',
   primary key (ID_LOCAL, ID_FECHA, ID_UBICACION, ID_PRODUCTO, ID_SUBGRUPO)
);

alter table FAC_VENTA_ACUMULADA comment 'tabla de hechos que responde a los resumenes de ytd y ytd -1';

alter table DIM_DIRECCION add constraint FK_DIM_CLIENTE_DIM_DIRECCION foreign key (ID_CLIENTE)
      references DIM_CLIENTE (ID_CLIENTE) on delete restrict on update restrict;

alter table DIM_DOCUMENTO add constraint FK_DIM_FECHA_DIM_DOCUMENTO foreign key (ID_FECHA)
      references DIM_FECHA (ID_FECHA) on delete restrict on update restrict;

alter table DIM_LOCAL add constraint FK_DIM_UBICACION_DIM_LOCAL foreign key (ID_UBICACION)
      references DIM_UBICACION_GEOGRAFICA (ID_UBICACION) on delete restrict on update restrict;

alter table DIM_PRODUCTO add constraint FK_DIM_GRUPO_DIM_PRODUCTO foreign key (ID_SUBGRUPO)
      references DIM_SUBGRUPO (ID_SUBGRUPO) on delete restrict on update restrict;

alter table DIM_TELEFONO add constraint FK_DIM_CLIENTE_DIM_TELEFONO foreign key (ID_CLIENTE)
      references DIM_CLIENTE (ID_CLIENTE) on delete restrict on update restrict;

alter table FAC_CABECERA_FACTURA add constraint FK_DIM_CLIENTE_FAC_CABECERA_FACTURA foreign key (ID_CLIENTE)
      references DIM_CLIENTE (ID_CLIENTE) on delete restrict on update restrict;

alter table FAC_CABECERA_FACTURA add constraint FK_DIM_DOCUMENTO_FAC_CABECERA_FACTURA foreign key (ID_DOCUMENTO)
      references DIM_DOCUMENTO (ID_DOCUMENTO) on delete restrict on update restrict;

alter table FAC_CABECERA_FACTURA add constraint FK_DIM_FECHA_FAC_CABECERA_FACTURA foreign key (ID_FECHA)
      references DIM_FECHA (ID_FECHA) on delete restrict on update restrict;

alter table FAC_CABECERA_FACTURA add constraint FK_DIM_LOCAL_FAC_CABECERA_FACTURA foreign key (ID_LOCAL)
      references DIM_LOCAL (ID_LOCAL) on delete restrict on update restrict;

alter table FAC_CABECERA_FACTURA add constraint FK_DIM_UBICACION_GEOGRAFICA_FAC_CABECERA_FACTURA foreign key (ID_UBICACION)
      references DIM_UBICACION_GEOGRAFICA (ID_UBICACION) on delete restrict on update restrict;

alter table FAC_CABECERA_MENSUAL add constraint FK_DIM_CLIENTE_FAC_CABECERA_MENSUAL foreign key (ID_CLIENTE)
      references DIM_CLIENTE (ID_CLIENTE) on delete restrict on update restrict;

alter table FAC_CABECERA_MENSUAL add constraint FK_DIM_FECHA_FAC_CABECERA_MENSUAL foreign key (ID_FECHA)
      references DIM_FECHA (ID_FECHA) on delete restrict on update restrict;

alter table FAC_CABECERA_MENSUAL add constraint FK_DIM_LOCAL_FAC_CABECERA_MENSUAL foreign key (ID_LOCAL)
      references DIM_LOCAL (ID_LOCAL) on delete restrict on update restrict;

alter table FAC_CABECERA_MENSUAL add constraint FK_DIM_UBICACION_FAC_CABECERA_MENSUAL foreign key (ID_UBICACION)
      references DIM_UBICACION_GEOGRAFICA (ID_UBICACION) on delete restrict on update restrict;

alter table FAC_DETALLE_FACTURA add constraint FK_DIM_CLIENTE_FAC_DETALLE_FACTURA foreign key (ID_CLIENTE)
      references DIM_CLIENTE (ID_CLIENTE) on delete restrict on update restrict;

alter table FAC_DETALLE_FACTURA add constraint FK_DIM_DOCUMENTO_FAC_DETALLE_FACTURA foreign key (ID_DOCUMENTO)
      references DIM_DOCUMENTO (ID_DOCUMENTO) on delete restrict on update restrict;

alter table FAC_DETALLE_FACTURA add constraint FK_DIM_FECHA_FAC_DETALLE_FACTURA foreign key (ID_FECHA)
      references DIM_FECHA (ID_FECHA) on delete restrict on update restrict;

alter table FAC_DETALLE_FACTURA add constraint FK_DIM_GRUPO_FAC_DETALLE_FACTURA foreign key (ID_SUBGRUPO)
      references DIM_SUBGRUPO (ID_SUBGRUPO) on delete restrict on update restrict;

alter table FAC_DETALLE_FACTURA add constraint FK_DIM_LOCAL_FAC_DETALLE_FACTURA foreign key (ID_LOCAL)
      references DIM_LOCAL (ID_LOCAL) on delete restrict on update restrict;

alter table FAC_DETALLE_FACTURA add constraint FK_DIM_PRODUCTO_FAC_DETALLE_FACTURA foreign key (ID_PRODUCTO)
      references DIM_PRODUCTO (ID_PRODUCTO) on delete restrict on update restrict;

alter table FAC_DETALLE_FACTURA add constraint FK_DIM_UBICACION_FAC_DETALLE_FACTURA foreign key (ID_UBICACION)
      references DIM_UBICACION_GEOGRAFICA (ID_UBICACION) on delete restrict on update restrict;

alter table FAC_DETALLE_FACTURA_MENSUAL add constraint FK_DIM_FECHA_FAC_DETALLE_FACTURA_MENSUAL foreign key (ID_FECHA)
      references DIM_FECHA (ID_FECHA) on delete restrict on update restrict;

alter table FAC_DETALLE_FACTURA_MENSUAL add constraint FK_DIM_GRUPO_FAC_DETALLE_FACTURA_MENSUAL foreign key (ID_SUBGRUPO)
      references DIM_SUBGRUPO (ID_SUBGRUPO) on delete restrict on update restrict;

alter table FAC_DETALLE_FACTURA_MENSUAL add constraint FK_DIM_LOCAL_FAC_DETALLE_FACTURA_MENSUAL foreign key (ID_LOCAL)
      references DIM_LOCAL (ID_LOCAL) on delete restrict on update restrict;

alter table FAC_DETALLE_FACTURA_MENSUAL add constraint FK_DIM_PRODUCTO_FAC_DETALLE_FACTURA_MENSUAL foreign key (ID_PRODUCTO)
      references DIM_PRODUCTO (ID_PRODUCTO) on delete restrict on update restrict;

alter table FAC_DETALLE_FACTURA_MENSUAL add constraint FK_DIM_UBICACION_FAC_DETALLE_FACTURA_MENSUAL foreign key (ID_UBICACION)
      references DIM_UBICACION_GEOGRAFICA (ID_UBICACION) on delete restrict on update restrict;

alter table FAC_PRESUPUESTO_MENSUAL add constraint FK_DIM_FECHA_FAC_PRESUPUESTO_MENSUAL foreign key (ID_FECHA)
      references DIM_FECHA (ID_FECHA) on delete restrict on update restrict;

alter table FAC_PRESUPUESTO_MENSUAL add constraint FK_DIM_GRUPO_FAC_PRESUPUESTO_MENSUAL foreign key (ID_SUBGRUPO)
      references DIM_SUBGRUPO (ID_SUBGRUPO) on delete restrict on update restrict;

alter table FAC_PRESUPUESTO_MENSUAL add constraint FK_DIM_LOCAL_FAC_PRESUPUESTO_MENSUAL foreign key (ID_LOCAL)
      references DIM_LOCAL (ID_LOCAL) on delete restrict on update restrict;

alter table FAC_PRESUPUESTO_MENSUAL add constraint FK_DIM_UBICACION_FAC_PRESUPUESTO_MENSUAL foreign key (ID_UBICACION)
      references DIM_UBICACION_GEOGRAFICA (ID_UBICACION) on delete restrict on update restrict;

alter table FAC_VENTA_ACUMULADA add constraint FK_DIM_FECHA_FAC_VENTA_ACUMULADA foreign key (ID_FECHA)
      references DIM_FECHA (ID_FECHA) on delete restrict on update restrict;

alter table FAC_VENTA_ACUMULADA add constraint FK_DIM_GRUPO_FAC_VENTA_ACUMULADA foreign key (ID_SUBGRUPO)
      references DIM_SUBGRUPO (ID_SUBGRUPO) on delete restrict on update restrict;

alter table FAC_VENTA_ACUMULADA add constraint FK_DIM_LOCAL_FAC_VENTA_ACUMULADA foreign key (ID_LOCAL)
      references DIM_LOCAL (ID_LOCAL) on delete restrict on update restrict;

alter table FAC_VENTA_ACUMULADA add constraint FK_DIM_PRODUCTO_FAC_VENTA_ACUMULADA foreign key (ID_PRODUCTO)
      references DIM_PRODUCTO (ID_PRODUCTO) on delete restrict on update restrict;

alter table FAC_VENTA_ACUMULADA add constraint FK_DIM_UBICACION_FAC_VENTA_ACUMULADA foreign key (ID_UBICACION)
      references DIM_UBICACION_GEOGRAFICA (ID_UBICACION) on delete restrict on update restrict;

CREATE UNIQUE INDEX idx_DIM_CLIENTE_lookup ON datawarehouse.DIM_CLIENTE(CEDULA);
CREATE UNIQUE INDEX idx_DIM_TELEFONO_lookup ON datawarehouse.DIM_TELEFONO(COD_TELEFONO);
CREATE UNIQUE INDEX idx_DIM_DIRECCION_lookup ON datawarehouse.DIM_DIRECCION(COD_DIRECCION);
CREATE UNIQUE INDEX idx_DIM_SUBGRUPO_lookup ON datawarehouse.DIM_SUBGRUPO(COD_SUBGRUPO);
CREATE UNIQUE INDEX idx_DIM_PRODUCTO_lookup ON datawarehouse.DIM_PRODUCTO(COD_PRODUCTO);
CREATE UNIQUE INDEX idx_DIM_LOCAL_lookup ON datawarehouse.DIM_LOCAL(COD_LOCAL);
CREATE UNIQUE INDEX idx_DIM_UBICACION_lookup ON datawarehouse.DIM_UBICACION_GEOGRAFICA(COD_UBICACION_PARROQUIA);
CREATE UNIQUE INDEX idx_DIM_FECHA_lookup ON datawarehouse.DIM_FECHA(FECHA);
CREATE UNIQUE INDEX idx_DIM_DOCUMENTO_lookup ON datawarehouse.DIM_DOCUMENTO(NUMERO_FACTURA);