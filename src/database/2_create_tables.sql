/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     23/03/2024 0:09:15                           */
/*==============================================================*/


drop index ENCUENTRA1_FK;

drop index PERTENECE1_FK;

drop index PERTENECE2_FK;

drop index ES1_FK;

drop index ESTA1_FK;

drop index AMBIENTE_PK;

drop table AMBIENTE;

drop index EDIFICIO_PK;

drop table EDIFICIO;

drop index ESTADO_AMBIENTE_PK;

drop table ESTADO_AMBIENTE;

drop index FACULTAD_PK;

drop table FACULTAD;

drop index PISO_PK;

drop table PISO;

drop index TIPO_AMBIENTE_PK;

drop table TIPO_AMBIENTE;

/*==============================================================*/
/* Table: AMBIENTE                                              */
/*==============================================================*/
create table AMBIENTE (
   COD_AMBIENTE         SERIAL               not null,
   COD_FACULTAD         INT4                 not null,
   COD_ESTADO_AMBIENTE  INT4                 not null,
   COD_PISO             INT4                 not null,
   COD_TIPO_AMBIENTE    INT4                 not null,
   COD_EDIFICIO         INT4                 not null,
   NOMBRE_AMB           CHAR(20)             not null,
   CAPACIDAD_AMB        INT4                 not null,
   UBICACION_AMB        CHAR(100)            not null,
   DESCRIPCION_AMB      CHAR(255)            not null,
   constraint PK_AMBIENTE primary key (COD_AMBIENTE)
);

/*==============================================================*/
/* Index: AMBIENTE_PK                                           */
/*==============================================================*/
create unique index AMBIENTE_PK on AMBIENTE (
COD_AMBIENTE
);

/*==============================================================*/
/* Index: ESTA1_FK                                              */
/*==============================================================*/
create  index ESTA1_FK on AMBIENTE (
COD_ESTADO_AMBIENTE
);

/*==============================================================*/
/* Index: ES1_FK                                                */
/*==============================================================*/
create  index ES1_FK on AMBIENTE (
COD_TIPO_AMBIENTE
);

/*==============================================================*/
/* Index: PERTENECE2_FK                                         */
/*==============================================================*/
create  index PERTENECE2_FK on AMBIENTE (
COD_FACULTAD
);

/*==============================================================*/
/* Index: PERTENECE1_FK                                         */
/*==============================================================*/
create  index PERTENECE1_FK on AMBIENTE (
COD_EDIFICIO
);

/*==============================================================*/
/* Index: ENCUENTRA1_FK                                         */
/*==============================================================*/
create  index ENCUENTRA1_FK on AMBIENTE (
COD_PISO
);

/*==============================================================*/
/* Table: EDIFICIO                                              */
/*==============================================================*/
create table EDIFICIO (
   COD_EDIFICIO         SERIAL               not null,
   NOMBRE_EDI           CHAR(20)             not null,
   constraint PK_EDIFICIO primary key (COD_EDIFICIO)
);

/*==============================================================*/
/* Index: EDIFICIO_PK                                           */
/*==============================================================*/
create unique index EDIFICIO_PK on EDIFICIO (
COD_EDIFICIO
);

/*==============================================================*/
/* Table: ESTADO_AMBIENTE                                       */
/*==============================================================*/
create table ESTADO_AMBIENTE (
   COD_ESTADO_AMBIENTE  SERIAL               not null,
   NOMBRE_EA            CHAR(15)             not null,
   constraint PK_ESTADO_AMBIENTE primary key (COD_ESTADO_AMBIENTE)
);

/*==============================================================*/
/* Index: ESTADO_AMBIENTE_PK                                    */
/*==============================================================*/
create unique index ESTADO_AMBIENTE_PK on ESTADO_AMBIENTE (
COD_ESTADO_AMBIENTE
);

/*==============================================================*/
/* Table: FACULTAD                                              */
/*==============================================================*/
create table FACULTAD (
   COD_FACULTAD         SERIAL               not null,
   NOMBRE_FAC           CHAR(50)             not null,
   constraint PK_FACULTAD primary key (COD_FACULTAD)
);

/*==============================================================*/
/* Index: FACULTAD_PK                                           */
/*==============================================================*/
create unique index FACULTAD_PK on FACULTAD (
COD_FACULTAD
);

/*==============================================================*/
/* Table: PISO                                                  */
/*==============================================================*/
create table PISO (
   COD_PISO             SERIAL               not null,
   NOMBRE_PIS           CHAR(20)             not null,
   constraint PK_PISO primary key (COD_PISO)
);

/*==============================================================*/
/* Index: PISO_PK                                               */
/*==============================================================*/
create unique index PISO_PK on PISO (
COD_PISO
);

/*==============================================================*/
/* Table: TIPO_AMBIENTE                                         */
/*==============================================================*/
create table TIPO_AMBIENTE (
   COD_TIPO_AMBIENTE    SERIAL               not null,
   NOMBRE_TA            CHAR(25)             not null,
   constraint PK_TIPO_AMBIENTE primary key (COD_TIPO_AMBIENTE)
);

/*==============================================================*/
/* Index: TIPO_AMBIENTE_PK                                      */
/*==============================================================*/
create unique index TIPO_AMBIENTE_PK on TIPO_AMBIENTE (
COD_TIPO_AMBIENTE
);

alter table AMBIENTE
   add constraint FK_AMBIENTE_ENCUENTRA_PISO foreign key (COD_PISO)
      references PISO (COD_PISO)
      on delete restrict on update restrict;

alter table AMBIENTE
   add constraint FK_AMBIENTE_ES1_TIPO_AMB foreign key (COD_TIPO_AMBIENTE)
      references TIPO_AMBIENTE (COD_TIPO_AMBIENTE)
      on delete restrict on update restrict;

alter table AMBIENTE
   add constraint FK_AMBIENTE_ESTA1_ESTADO_A foreign key (COD_ESTADO_AMBIENTE)
      references ESTADO_AMBIENTE (COD_ESTADO_AMBIENTE)
      on delete restrict on update restrict;

alter table AMBIENTE
   add constraint FK_AMBIENTE_PERTENECE_EDIFICIO foreign key (COD_EDIFICIO)
      references EDIFICIO (COD_EDIFICIO)
      on delete restrict on update restrict;

alter table AMBIENTE
   add constraint FK_AMBIENTE_PERTENECE_FACULTAD foreign key (COD_FACULTAD)
      references FACULTAD (COD_FACULTAD)
      on delete restrict on update restrict;

