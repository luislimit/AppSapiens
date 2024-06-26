--------------------------------------------------------
--  DDL for Table MODELO
--------------------------------------------------------

  CREATE TABLE "SAPIENS"."MODELO" 
   (	"COD_PROYECTO" VARCHAR2(30 BYTE), 
	"NOM_MODELO" VARCHAR2(100 BYTE), 
	"NOM_ESQUEMA" VARCHAR2(30 BYTE), 
	"NOM_BBDD" VARCHAR2(30 BYTE), 
	"COD_GRUPO_BDS" VARCHAR2(50 BYTE), 
	"NOM_CARPETA_ADJ" VARCHAR2(100 BYTE), 
	"COD_NORMA" NUMBER(2,0), 
	"DES_NORMA" VARCHAR2(50 BYTE), 
	"NOM_APN_CMDB" VARCHAR2(200 BYTE), 
	"COD_GLOSARIO" NUMBER(3,0), 
	"DES_GLOSARIO" VARCHAR2(150 BYTE), 
	"COD_HERRAMIENTA" VARCHAR2(20 BYTE), 
	"OBS_MODELO" VARCHAR2(200 BYTE), 
	"COD_USR" VARCHAR2(30 BYTE), 
	"FEC_ACTU" DATE, 
	"COD_CAPA_USROWN" VARCHAR2(10 BYTE), 
	"MCA_VARIABLES" VARCHAR2(1 BYTE), 
	"MCA_GRANT_ALL" VARCHAR2(1 BYTE), 
	"MCA_GRANT_PUBLIC" VARCHAR2(1 BYTE), 
	"MCA_INH" VARCHAR2(1 BYTE), 
	"MCA_HIS" VARCHAR2(1 BYTE), 
	"MCA_PDC" VARCHAR2(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TBS_PERM_SAPIENS" ;
