drop index ADMINISTRADOR_PK;

drop table ADMINISTRADOR;

drop index TIENE1_FK;

drop index ESTA2_FK;

drop index HUBICA1_FK;

drop index AJUSTE_AMBIENTE_PK;

drop table AJUSTE_AMBIENTE;

drop index ENCUENTRA1_FK;

drop index PERTENECE1_FK;

drop index PERTENECE2_FK;

drop index ES1_FK;

drop index ESTA1_FK;

drop index AMBIENTE_PK;

drop table AMBIENTE;

drop index BLOQUE_PK;

drop table BLOQUE;

drop index HABILITA_FK;

drop index CONTIENE_FK;

drop index DETALLE_PERIODO_PK;

drop table DETALLE_PERIODO;

drop index DIA_PK;

drop table DIA;

drop index EDIFICACION_PK;

drop table EDIFICACION;

drop index ESTADO_AMBIENTE_PK;

drop table ESTADO_AMBIENTE;

drop index FACULTAD_PK;

drop table FACULTAD;

drop index ES_FK;

drop index FINAL_PK;

drop table FINAL;

drop index PERIODO_PK;

drop table PERIODO;

drop index PISO_PK;

drop table PISO;

drop index REALIZA1_FK;

drop index ES7_FK;

drop index REPORTE_PK;

drop table REPORTE;

drop index TIENE2_FK;

drop index ESTA3_FK;

drop index HUBICA2_FK;

drop index REALIZA_FK;

drop index RESERVA_PK;

drop table RESERVA;

drop index TIPO_AMBIENTE_PK;

drop table TIPO_AMBIENTE;

drop index TIPO_FINAL_PK;

drop table TIPO_FINAL;

drop index TIPO_REPORTE_PK;

drop table TIPO_REPORTE;

drop index ES5_FK;

drop index ES3_FK;

drop index USUARIO_PK;

drop table USUARIO;

/*==============================================================*/
/* Table: ADMINISTRADOR                                         */
/*==============================================================*/
create table ADMINISTRADOR (
   COD_USUARIO          INT4                 not null,
   ALIAS_ADM            CHAR(25)             not null,
   constraint PK_ADMINISTRADOR primary key (COD_USUARIO)
);

/*==============================================================*/
/* Index: ADMINISTRADOR_PK                                      */
/*==============================================================*/
create unique index ADMINISTRADOR_PK on ADMINISTRADOR (
COD_USUARIO
);

/*==============================================================*/
/* Table: AJUSTE_AMBIENTE                                       */
/*==============================================================*/
create table AJUSTE_AMBIENTE (
   COD_DIA              INT4                 not null,
   COD_BLOQUE           INT4                 not null,
   COD_AMBIENTE         INT4                 not null,
   COD_AJUSTE_AMBIENTE  SERIAL               not null,
   constraint PK_AJUSTE_AMBIENTE primary key (COD_DIA, COD_BLOQUE, COD_AMBIENTE, COD_AJUSTE_AMBIENTE)
);

/*==============================================================*/
/* Index: AJUSTE_AMBIENTE_PK                                    */
/*==============================================================*/
create unique index AJUSTE_AMBIENTE_PK on AJUSTE_AMBIENTE (
COD_DIA,
COD_BLOQUE,
COD_AMBIENTE,
COD_AJUSTE_AMBIENTE
);

/*==============================================================*/
/* Index: HUBICA1_FK                                            */
/*==============================================================*/
create  index HUBICA1_FK on AJUSTE_AMBIENTE (
COD_DIA
);

/*==============================================================*/
/* Index: ESTA2_FK                                              */
/*==============================================================*/
create  index ESTA2_FK on AJUSTE_AMBIENTE (
COD_BLOQUE
);

/*==============================================================*/
/* Index: TIENE1_FK                                             */
/*==============================================================*/
create  index TIENE1_FK on AJUSTE_AMBIENTE (
COD_AMBIENTE
);

/*==============================================================*/
/* Table: AMBIENTE                                              */
/*==============================================================*/
create table AMBIENTE (
   COD_AMBIENTE         SERIAL               not null,
   COD_FACULTAD         INT4                 not null,
   COD_ESTADO_AMBIENTE  INT4                 not null,
   COD_PISO             INT4                 not null,
   COD_TIPO_AMBIENTE    INT4                 not null,
   COD_EDIFICACION      INT4                 not null,
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
COD_EDIFICACION
);

/*==============================================================*/
/* Index: ENCUENTRA1_FK                                         */
/*==============================================================*/
create  index ENCUENTRA1_FK on AMBIENTE (
COD_PISO
);

/*==============================================================*/
/* Table: BLOQUE                                                */
/*==============================================================*/
create table BLOQUE (
   COD_BLOQUE           SERIAL               not null,
   NOMBRE_BLO           CHAR(1)              not null,
   HORA_INICIO_BLO      TIME                 not null,
   HORA_FIN_BLO         TIME                 not null,
   constraint PK_BLOQUE primary key (COD_BLOQUE)
);

/*==============================================================*/
/* Index: BLOQUE_PK                                             */
/*==============================================================*/
create unique index BLOQUE_PK on BLOQUE (
COD_BLOQUE
);

/*==============================================================*/
/* Table: DETALLE_PERIODO                                       */
/*==============================================================*/
create table DETALLE_PERIODO (
   COD_PERIODO          INT4                 not null,
   COD_TIPO_FINAL       INT4                 not null,
   COD_DETALLE_DP       SERIAL               not null,
   FECHA_INICIO_DP      DATE                 not null,
   FECHA_FIN_DP         DATE                 not null,
   constraint PK_DETALLE_PERIODO primary key (COD_PERIODO, COD_TIPO_FINAL, COD_DETALLE_DP)
);

/*==============================================================*/
/* Index: DETALLE_PERIODO_PK                                    */
/*==============================================================*/
create unique index DETALLE_PERIODO_PK on DETALLE_PERIODO (
COD_PERIODO,
COD_TIPO_FINAL,
COD_DETALLE_DP
);

/*==============================================================*/
/* Index: CONTIENE_FK                                           */
/*==============================================================*/
create  index CONTIENE_FK on DETALLE_PERIODO (
COD_PERIODO
);

/*==============================================================*/
/* Index: HABILITA_FK                                           */
/*==============================================================*/
create  index HABILITA_FK on DETALLE_PERIODO (
COD_TIPO_FINAL
);

/*==============================================================*/
/* Table: DIA                                                   */
/*==============================================================*/
create table DIA (
   COD_DIA              SERIAL               not null,
   NOMBRE_DIA           CHAR(10)             not null,
   constraint PK_DIA primary key (COD_DIA)
);

/*==============================================================*/
/* Index: DIA_PK                                                */
/*==============================================================*/
create unique index DIA_PK on DIA (
COD_DIA
);

/*==============================================================*/
/* Table: EDIFICACION                                           */
/*==============================================================*/
create table EDIFICACION (
   COD_EDIFICACION      SERIAL               not null,
   NOMBRE_EDI           CHAR(20)             not null,
   constraint PK_EDIFICACION primary key (COD_EDIFICACION)
);

/*==============================================================*/
/* Index: EDIFICACION_PK                                        */
/*==============================================================*/
create unique index EDIFICACION_PK on EDIFICACION (
COD_EDIFICACION
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
/* Table: FINAL                                                 */
/*==============================================================*/
create table FINAL (
   COD_USUARIO          INT4                 not null,
   COD_TIPO_FINAL       INT4                 not null,
   CODIGO_SIS_FIN       CHAR(50)             not null,
   constraint PK_FINAL primary key (COD_USUARIO)
);

/*==============================================================*/
/* Index: FINAL_PK                                              */
/*==============================================================*/
create unique index FINAL_PK on FINAL (
COD_USUARIO
);

/*==============================================================*/
/* Index: ES_FK                                                 */
/*==============================================================*/
create  index ES_FK on FINAL (
COD_TIPO_FINAL
);

/*==============================================================*/
/* Table: PERIODO                                               */
/*==============================================================*/
create table PERIODO (
   COD_PERIODO          SERIAL               not null,
   FECHA_INICIO_PER     DATE                 not null,
   FECHA_FIN_PER        DATE                 not null,
   constraint PK_PERIODO primary key (COD_PERIODO)
);

/*==============================================================*/
/* Index: PERIODO_PK                                            */
/*==============================================================*/
create unique index PERIODO_PK on PERIODO (
COD_PERIODO
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
/* Table: REPORTE                                               */
/*==============================================================*/
create table REPORTE (
   COD_REPORTE          SERIAL               not null,
   COD_TIPO_REPORTE     INT4                 not null,
   COD_USUARIO          INT4                 not null,
   TITULO_REP           CHAR(30)             not null,
   DETALLE_REP          CHAR(200)            not null,
   constraint PK_REPORTE primary key (COD_REPORTE)
);

/*==============================================================*/
/* Index: REPORTE_PK                                            */
/*==============================================================*/
create unique index REPORTE_PK on REPORTE (
COD_REPORTE
);

/*==============================================================*/
/* Index: ES7_FK                                                */
/*==============================================================*/
create  index ES7_FK on REPORTE (
COD_TIPO_REPORTE
);

/*==============================================================*/
/* Index: REALIZA1_FK                                           */
/*==============================================================*/
create  index REALIZA1_FK on REPORTE (
COD_USUARIO
);

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA (
   COD_USUARIO          INT4                 not null,
   COD_DIA              INT4                 not null,
   COD_BLOQUE           INT4                 not null,
   COD_AMBIENTE         INT4                 not null,
   COD_RESERVA          SERIAL               not null,
   FECHA_RES            DATE                 not null,
   constraint PK_RESERVA primary key (COD_USUARIO, COD_DIA, COD_BLOQUE, COD_AMBIENTE, COD_RESERVA)
);

/*==============================================================*/
/* Index: RESERVA_PK                                            */
/*==============================================================*/
create unique index RESERVA_PK on RESERVA (
COD_USUARIO,
COD_DIA,
COD_BLOQUE,
COD_AMBIENTE,
COD_RESERVA
);

/*==============================================================*/
/* Index: REALIZA_FK                                            */
/*==============================================================*/
create  index REALIZA_FK on RESERVA (
COD_USUARIO
);

/*==============================================================*/
/* Index: HUBICA2_FK                                            */
/*==============================================================*/
create  index HUBICA2_FK on RESERVA (
COD_DIA
);

/*==============================================================*/
/* Index: ESTA3_FK                                              */
/*==============================================================*/
create  index ESTA3_FK on RESERVA (
COD_BLOQUE
);

/*==============================================================*/
/* Index: TIENE2_FK                                             */
/*==============================================================*/
create  index TIENE2_FK on RESERVA (
COD_AMBIENTE
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

/*==============================================================*/
/* Table: TIPO_FINAL                                            */
/*==============================================================*/
create table TIPO_FINAL (
   COD_TIPO_FINAL       SERIAL               not null,
   NOMBRE_TF            CHAR(15)             not null,
   constraint PK_TIPO_FINAL primary key (COD_TIPO_FINAL)
);

/*==============================================================*/
/* Index: TIPO_FINAL_PK                                         */
/*==============================================================*/
create unique index TIPO_FINAL_PK on TIPO_FINAL (
COD_TIPO_FINAL
);

/*==============================================================*/
/* Table: TIPO_REPORTE                                          */
/*==============================================================*/
create table TIPO_REPORTE (
   COD_TIPO_REPORTE     SERIAL               not null,
   NOMBRE_TR            CHAR(20)             not null,
   constraint PK_TIPO_REPORTE primary key (COD_TIPO_REPORTE)
);

/*==============================================================*/
/* Index: TIPO_REPORTE_PK                                       */
/*==============================================================*/
create unique index TIPO_REPORTE_PK on TIPO_REPORTE (
COD_TIPO_REPORTE
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   COD_USUARIO          SERIAL               not null,
   ADM_COD_USUARIO      INT4                 null,
   FIN_COD_USUARIO      INT4                 null,
   NOMBRE_USU           CHAR(50)             not null,
   CONTRASENIA_USU      CHAR(150)            not null,
   constraint PK_USUARIO primary key (COD_USUARIO)
);

/*==============================================================*/
/* Index: USUARIO_PK                                            */
/*==============================================================*/
create unique index USUARIO_PK on USUARIO (
COD_USUARIO
);

/*==============================================================*/
/* Index: ES3_FK                                                */
/*==============================================================*/
create  index ES3_FK on USUARIO (
FIN_COD_USUARIO
);

/*==============================================================*/
/* Index: ES5_FK                                                */
/*==============================================================*/
create  index ES5_FK on USUARIO (
ADM_COD_USUARIO
);

alter table ADMINISTRADOR
   add constraint FK_ADMINIST_ES6_USUARIO foreign key (COD_USUARIO)
      references USUARIO (COD_USUARIO)
      on delete restrict on update restrict;

alter table AJUSTE_AMBIENTE
   add constraint FK_AJUSTE_A_ESTA2_BLOQUE foreign key (COD_BLOQUE)
      references BLOQUE (COD_BLOQUE)
      on delete restrict on update restrict;

alter table AJUSTE_AMBIENTE
   add constraint FK_AJUSTE_A_HUBICA1_DIA foreign key (COD_DIA)
      references DIA (COD_DIA)
      on delete restrict on update restrict;

alter table AJUSTE_AMBIENTE
   add constraint FK_AJUSTE_A_TIENE1_AMBIENTE foreign key (COD_AMBIENTE)
      references AMBIENTE (COD_AMBIENTE)
      on delete restrict on update restrict;

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
   add constraint FK_AMBIENTE_PERTENECE_EDIFICAC foreign key (COD_EDIFICACION)
      references EDIFICACION (COD_EDIFICACION)
      on delete restrict on update restrict;

alter table AMBIENTE
   add constraint FK_AMBIENTE_PERTENECE_FACULTAD foreign key (COD_FACULTAD)
      references FACULTAD (COD_FACULTAD)
      on delete restrict on update restrict;

alter table DETALLE_PERIODO
   add constraint FK_DETALLE__CONTIENE_PERIODO foreign key (COD_PERIODO)
      references PERIODO (COD_PERIODO)
      on delete restrict on update restrict;

alter table DETALLE_PERIODO
   add constraint FK_DETALLE__HABILITA_TIPO_FIN foreign key (COD_TIPO_FINAL)
      references TIPO_FINAL (COD_TIPO_FINAL)
      on delete restrict on update restrict;

alter table FINAL
   add constraint FK_FINAL_ES_TIPO_FIN foreign key (COD_TIPO_FINAL)
      references TIPO_FINAL (COD_TIPO_FINAL)
      on delete restrict on update restrict;

alter table FINAL
   add constraint FK_FINAL_ES4_USUARIO foreign key (COD_USUARIO)
      references USUARIO (COD_USUARIO)
      on delete restrict on update restrict;

alter table REPORTE
   add constraint FK_REPORTE_ES7_TIPO_REP foreign key (COD_TIPO_REPORTE)
      references TIPO_REPORTE (COD_TIPO_REPORTE)
      on delete restrict on update restrict;

alter table REPORTE
   add constraint FK_REPORTE_REALIZA1_ADMINIST foreign key (COD_USUARIO)
      references ADMINISTRADOR (COD_USUARIO)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_ESTA3_BLOQUE foreign key (COD_BLOQUE)
      references BLOQUE (COD_BLOQUE)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_HUBICA2_DIA foreign key (COD_DIA)
      references DIA (COD_DIA)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_REALIZA_FINAL foreign key (COD_USUARIO)
      references FINAL (COD_USUARIO)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_TIENE2_AMBIENTE foreign key (COD_AMBIENTE)
      references AMBIENTE (COD_AMBIENTE)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_ES3_FINAL foreign key (FIN_COD_USUARIO)
      references FINAL (COD_USUARIO)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_ES5_ADMINIST foreign key (ADM_COD_USUARIO)
      references ADMINISTRADOR (COD_USUARIO)
      on delete restrict on update restrict;
