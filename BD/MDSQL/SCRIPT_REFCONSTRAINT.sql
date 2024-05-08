--------------------------------------------------------
--  Ref Constraints for Table SCRIPT
--------------------------------------------------------

  ALTER TABLE "SAPIENS"."SCRIPT" ADD CONSTRAINT "SCRIPT_PROCESO_FK" FOREIGN KEY ("ID_PROCESO")
	  REFERENCES "SAPIENS"."PROCESO" ("ID_PROCESO") ENABLE;
