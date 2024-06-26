--------------------------------------------------------
--  DDL for Table CAMPO_GLOSARIO
--------------------------------------------------------

  CREATE TABLE "SAPIENS"."CAMPO_GLOSARIO" 
   (	"NOM_COLUMNA" VARCHAR2(30 BYTE), 
	"TIP_DATO" VARCHAR2(40 BYTE), 
	"NUM_LONGITUD" NUMBER, 
	"NUM_DECIMAL" NUMBER, 
	"COD_GLOSARIO" NUMBER, 
	"MCA_EXCEPTION" VARCHAR2(1 BYTE), 
	"TXT_COMENTARIOS" VARCHAR2(4000 BYTE), 
	"TXT_EXCEPTION" VARCHAR2(200 BYTE), 
	"COD_USR" VARCHAR2(8 BYTE), 
	"FEC_ACTU" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TBS_PERM_SAPIENS" ;
