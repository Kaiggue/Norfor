/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     11/06/2022 18:15:20                          */
/*==============================================================*/


/*==============================================================*/
/* Table: choferes                                              */
/*==============================================================*/
create table choferes
(
   pkChofer             int not null auto_increment,
   Nombre_chof          text,
   Apellido_chof        text,
   DNI_chof             text,
   Obs_chof             text,
   primary key (pkChofer)
);

/*==============================================================*/
/* Table: clases                                                */
/*==============================================================*/
create table clases
(
   pkClase              int not null auto_increment,
   Nom_Clase            text,
   primary key (pkClase)
);

/*==============================================================*/
/* Table: clientes                                              */
/*==============================================================*/
create table clientes
(
   pkClientes           integer not null auto_increment,
   cliente              text,
   cod_cliente          text,
   primary key (pkClientes)
);

/*==============================================================*/
/* Table: destinos                                              */
/*==============================================================*/
create table destinos
(
   pkDestino            integer not null auto_increment,
   dest                 text,
   repro                boolean,
   primary key (pkDestino)
);

/*==============================================================*/
/* Table: detalle_orden_produccion                              */
/*==============================================================*/
create table detalle_orden_produccion
(
   pkDetOrdProdu        int not null auto_increment,
   fkOrdProdu           int,
   fkTipoProdTermi      int,
   Cantidad             smallint,
   fkEscuadria          int,
   fkPaqueteSeco        int,
   primary key (pkDetOrdProdu)
);

/*==============================================================*/
/* Table: detalle_orden_salida                                  */
/*==============================================================*/
create table detalle_orden_salida
(
   pkDetOrSal           int not null auto_increment,
   fkOrdenDeSalida      int,
   fkTipoDeProducto     int,
   Cantidad             int,
   fkDetOrdProdTerm     int,
   primary key (pkDetOrSal)
);

/*==============================================================*/
/* Table: detalle_orden_secanza                                 */
/*==============================================================*/
create table detalle_orden_secanza
(
   pkDetOrSec           int not null auto_increment,
   Lado                 char(1),
   Posicion             text,
   FkPaqueteProd        int,
   PorcHumedad          decimal,
   fkOrdSecan           int,
   primary key (pkDetOrSec)
);

/*==============================================================*/
/* Table: escuadria                                             */
/*==============================================================*/
create table escuadria
(
   pkEscuadria          int not null auto_increment,
   largo                float(7),
   ancho                float(7),
   espesor              float(7),
   primary key (pkEscuadria)
);

/*==============================================================*/
/* Table: estibas                                               */
/*==============================================================*/
create table estibas
(
   pkEstiba             int not null auto_increment,
   fkesti               text,
   FSC_est              bool,
   primary key (pkEstiba)
);

/*==============================================================*/
/* Table: ingresos                                              */
/*==============================================================*/
create table ingresos
(
   pkIngreso            int not null auto_increment,
   Fecha_ing            date,
   CantRollos_ing       int,
   RollosConsum_ing     int,
   FSC_ing              bool,
   fkClase              int,
   fkEstiba             int,
   fkProveedor          int,
   fkUsuario_alta       integer,
   primary key (pkIngreso)
);

/*==============================================================*/
/* Table: operarios                                             */
/*==============================================================*/
create table operarios
(
   pkOperario           int not null auto_increment,
   Nombre               text,
   Apellido             text,
   Observaciones        text,
   primary key (pkOperario)
);

/*==============================================================*/
/* Table: ordenes_produccion                                    */
/*==============================================================*/
create table ordenes_produccion
(
   pkOrdProduccion      int not null auto_increment,
   fkOperario           int,
   EsRemanufactura      bool,
   FechaHora            timestamp,
   fkOperRespo          int,
   Observ               text,
   primary key (pkOrdProduccion)
);

/*==============================================================*/
/* Table: ordenes_salida                                        */
/*==============================================================*/
create table ordenes_salida
(
   pkOrdenDeSalida      int not null auto_increment,
   pkDestino            integer,
   pkClientes           integer,
   fkUsuario_alta       integer,
   fechaSalida          timestamp,
   fkCliente            int,
   fkDestino            int,
   primary key (pkOrdenDeSalida)
);

/*==============================================================*/
/* Table: ordenes_secanza                                       */
/*==============================================================*/
create table ordenes_secanza
(
   pkOrdSecanza         int not null auto_increment,
   fkUsuario_alta       integer,
   Fecha                timestamp,
   HoraIngreso          time,
   HoraSalida           time,
   HumInicial           decimal,
   CargaN_              int,
   Camara               text,
   fkOperarioResp       int,
   fkOperIngreso        int,
   fkOperSalida         int,
   fkOperCtrlHumPaq     int,
   HsDuracion           decimal,
   primary key (pkOrdSecanza)
);

/*==============================================================*/
/* Table: paquetes_producidos                                   */
/*==============================================================*/
create table paquetes_producidos
(
   pkPaqProd            int not null auto_increment,
   fkDetOrSec           int,
   fkTipoProd           integer,
   fkDetOrdProdu        int,
   fechahora            timestamp,
   verde                bool,
   can_tablas           smallint,
   volumen              decimal,
   primary key (pkPaqProd)
);

/*==============================================================*/
/* Table: pesajes                                               */
/*==============================================================*/
create table pesajes
(
   pkPesaje             integer not null auto_increment,
   fkTransporte         integer not null,
   fkChofer             text,
   bruto                real,
   tara                 real,
   feho_pesaje          timestamp,
   feho_destare         timestamp,
   anul                 boolean,
   manual_pesa          boolean,
   fkIngreso            integer,
   fkUsuario_alta       integer,
   primary key (pkPesaje)
);

/*==============================================================*/
/* Table: productos                                             */
/*==============================================================*/
create table productos
(
   fkDetOrSal           int,
   pkProducto           integer not null auto_increment,
   nombre_prod          text,
   primary key (pkProducto)
);

/*==============================================================*/
/* Table: proveedores                                           */
/*==============================================================*/
create table proveedores
(
   pkProveedores        integer not null auto_increment,
   nombre_prove         text,
   primary key (pkProveedores)
);

/*==============================================================*/
/* Table: sensores                                              */
/*==============================================================*/
create table sensores
(
   pkSensor             int not null auto_increment,
   Ubicacion            text,
   fkOrdSeca            int,
   Lectura              char(8),
   primary key (pkSensor)
);

/*==============================================================*/
/* Table: tablas_producidas                                     */
/*==============================================================*/
create table tablas_producidas
(
   pkIngEnPaq           int not null auto_increment,
   fkPaquete            int,
   fkIngreso            int,
   fkEscuadria          int,
   fkPaqProd            int,
   cantidad             smallint,
   feho_inicio          timestamp,
   feho_fin             timestamp,
   primary key (pkIngEnPaq)
);

/*==============================================================*/
/* Table: tipos_producto                                        */
/*==============================================================*/
create table tipos_producto
(
   pkTipoProd           integer not null auto_increment,
   t_prod               text,
   cant_tprod           boolean,
   cant_ref_tprod       real ,
   vol_ref              real,
   paq_hijo             text,
   reproceso            boolean,
   primary key (pkTipoProd)
);

/*==============================================================*/
/* Table: tipos_producto_terminado                              */
/*==============================================================*/
create table tipos_producto_terminado
(
   pkTiPrTerminado      int not null auto_increment,
   Descripcion          text,
   Observaciones        text,
   primary key (pkTiPrTerminado)
);

/*==============================================================*/
/* Table: transportes                                           */
/*==============================================================*/
create table transportes
(
   pkTransporte         integer not null auto_increment,
   transporte           text,
   pat_cam_trans        text,
   pat_acop_prod        text,
   primary key (pkTransporte)
);

/*==============================================================*/
/* Table: usuarios                                              */
/*==============================================================*/
create table usuarios
(
   pkUsuario            integer not null auto_increment,
   usuario              varchar(50),
   password             varchar(60),
   primary key (pkUsuario)
);

alter table detalle_orden_produccion add constraint FK_REFERENCE_19 foreign key (fkOrdProdu)
      references ordenes_produccion (pkOrdProduccion) on delete restrict on update restrict;

alter table detalle_orden_produccion add constraint FK_REFERENCE_20 foreign key (fkTipoProdTermi)
      references tipos_producto_terminado (pkTiPrTerminado) on delete restrict on update restrict;

alter table detalle_orden_produccion add constraint FK_REFERENCE_21 foreign key (fkEscuadria)
      references escuadria (pkEscuadria) on delete restrict on update restrict;

alter table detalle_orden_salida add constraint FK_REFERENCE_13 foreign key (fkOrdenDeSalida)
      references ordenes_salida (pkOrdenDeSalida) on delete restrict on update restrict;

alter table detalle_orden_salida add constraint FK_REFERENCE_23 foreign key (fkDetOrdProdTerm)
      references detalle_orden_produccion (pkDetOrdProdu) on delete restrict on update restrict;

alter table detalle_orden_secanza add constraint FK_REFERENCE_10 foreign key (fkOrdSecan)
      references ordenes_secanza (pkOrdSecanza) on delete restrict on update restrict;

alter table ingresos add constraint FK_REFERENCE_1 foreign key (fkEstiba)
      references estibas (pkEstiba) on delete restrict on update restrict;

alter table ingresos add constraint FK_REFERENCE_2 foreign key (fkClase)
      references clases (pkClase) on delete restrict on update restrict;

alter table ingresos add constraint FK_REFERENCE_29 foreign key (fkUsuario_alta)
      references usuarios (pkUsuario) on delete restrict on update restrict;

alter table ingresos add constraint FK_REFERENCE_5 foreign key (fkProveedor)
      references proveedores (pkProveedores) on delete restrict on update restrict;

alter table ordenes_produccion add constraint FK_REFERENCE_28 foreign key (fkOperario)
      references operarios (pkOperario) on delete restrict on update restrict;

alter table ordenes_salida add constraint FK_REFERENCE_11 foreign key (pkDestino)
      references destinos (pkDestino) on delete restrict on update restrict;

alter table ordenes_salida add constraint FK_REFERENCE_12 foreign key (pkClientes)
      references clientes (pkClientes) on delete restrict on update restrict;

alter table ordenes_salida add constraint FK_REFERENCE_31 foreign key (fkUsuario_alta)
      references usuarios (pkUsuario) on delete restrict on update restrict;

alter table ordenes_secanza add constraint FK_ORDENESD_REFERENCE_OPERARIO1 foreign key (fkOperIngreso)
      references operarios (pkOperario) on delete restrict on update restrict;

alter table ordenes_secanza add constraint FK_ORDENESD_REFERENCE_OPERARIO2 foreign key (fkOperCtrlHumPaq)
      references operarios (pkOperario) on delete restrict on update restrict;

alter table ordenes_secanza add constraint FK_ORDENESD_REFERENCE_OPERARIO3 foreign key (fkOperarioResp)
      references operarios (pkOperario) on delete restrict on update restrict;

alter table ordenes_secanza add constraint FK_ORDENESD_REFERENCE_OPERARIO4 foreign key (fkOperSalida)
      references operarios (pkOperario) on delete restrict on update restrict;

alter table ordenes_secanza add constraint FK_REFERENCE_32 foreign key (fkUsuario_alta)
      references usuarios (pkUsuario) on delete restrict on update restrict;

alter table paquetes_producidos add constraint FK_REFERENCE_27 foreign key (fkDetOrdProdu)
      references detalle_orden_produccion (pkDetOrdProdu) on delete restrict on update restrict;

alter table paquetes_producidos add constraint FK_REFERENCE_7 foreign key (fkTipoProd)
      references tipos_producto (pkTipoProd) on delete restrict on update restrict;

alter table paquetes_producidos add constraint FK_REFERENCE_9 foreign key (fkDetOrSec)
      references detalle_orden_secanza (pkDetOrSec) on delete restrict on update restrict;

alter table pesajes add constraint FK_REFERENCE_3 foreign key (fkIngreso)
      references ingresos (pkIngreso) on delete restrict on update restrict;

alter table pesajes add constraint FK_REFERENCE_30 foreign key (fkUsuario_alta)
      references usuarios (pkUsuario) on delete restrict on update restrict;

alter table pesajes add constraint FK_REFERENCE_4 foreign key (fkTransporte)
      references transportes (pkTransporte) on delete restrict on update restrict;

alter table productos add constraint FK_REFERENCE_14 foreign key (fkDetOrSal)
      references detalle_orden_salida (pkDetOrSal) on delete restrict on update restrict;

alter table sensores add constraint FK_REFERENCE_18 foreign key (fkOrdSeca)
      references ordenes_secanza (pkOrdSecanza) on delete restrict on update restrict;

alter table tablas_producidas add constraint FK_REFERENCE_15 foreign key (fkIngreso)
      references ingresos (pkIngreso) on delete restrict on update restrict;

alter table tablas_producidas add constraint FK_REFERENCE_16 foreign key (fkPaqProd)
      references paquetes_producidos (pkPaqProd) on delete restrict on update restrict;

alter table tablas_producidas add constraint FK_REFERENCE_17 foreign key (fkEscuadria)
      references escuadria (pkEscuadria) on delete restrict on update restrict;

