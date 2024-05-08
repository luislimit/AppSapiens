--------------------------------------------------------
--  Ref Constraints for Table LINEAS_SCRIPT
--------------------------------------------------------

  ALTER TABLE "SAPIENS"."LINEAS_SCRIPT" ADD CONSTRAINT "LINEAS_SCRIPT_SCRIPT_FK" FOREIGN KEY ("ID_SCRIPT")
	  REFERENCES "SAPIENS"."SCRIPT" ("ID") ENABLE;
