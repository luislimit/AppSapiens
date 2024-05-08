--------------------------------------------------------
--  Constraints for Table LINEAS_SCRIPT
--------------------------------------------------------

  ALTER TABLE "SAPIENS"."LINEAS_SCRIPT" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SAPIENS"."LINEAS_SCRIPT" MODIFY ("ID_SCRIPT" NOT NULL ENABLE);
  ALTER TABLE "SAPIENS"."LINEAS_SCRIPT" ADD CONSTRAINT "LINEAS_SCRIPT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
