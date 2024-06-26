--------------------------------------------------------
--  DDL for Table GLOSARIO
--------------------------------------------------------

  CREATE TABLE "SAPIENS"."GLOSARIO" 
   (	"COD_GLOSARIO" NUMBER(3,0), 
	"DES_GLOSARIO" VARCHAR2(150 BYTE), 
	"FEC_ALTA" DATE, 
	"COD_USR" VARCHAR2(8 BYTE), 
	"FEC_ACTU" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TBS_PERM_SAPIENS" ;
