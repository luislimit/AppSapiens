--------------------------------------------------------
--  DDL for Table SCRIPT
--------------------------------------------------------

  CREATE TABLE "SAPIENS"."SCRIPT" 
   (	"ID" NUMBER, 
	"NOMBRE" VARCHAR2(50 BYTE), 
	"RUTA" VARCHAR2(500 BYTE), 
	"TIPO" VARCHAR2(20 BYTE), 
	"COD_ESTADO" NUMBER, 
	"DES_ESTADO" VARCHAR2(20 BYTE), 
	"NUM_ORDEN" NUMBER, 
	"NOM_SCRIPT_LANZA" VARCHAR2(100 BYTE), 
	"TXT_SCRIPT_LANZA" VARCHAR2(4000 BYTE), 
	"NOM_SCRIPT_LOG" VARCHAR2(50 BYTE), 
	"ID_PROCESO" NUMBER, 
	"TXT_COMENTARIO" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SAPIENS"."SCRIPT"."ID" IS 'CLAVE PRINCIPAL';
   COMMENT ON COLUMN "SAPIENS"."SCRIPT"."NOMBRE" IS 'NOMBRE DEL SCRIPT';
   COMMENT ON COLUMN "SAPIENS"."SCRIPT"."RUTA" IS 'RUTA PADRE DEL SCRIPT';
