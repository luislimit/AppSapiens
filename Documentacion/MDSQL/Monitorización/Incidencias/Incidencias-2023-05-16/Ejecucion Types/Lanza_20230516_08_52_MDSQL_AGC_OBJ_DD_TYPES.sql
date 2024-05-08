SET DEFINE ON
SET VERIFY  ON
SET ECHO OFF
SPOOL "C:\MDSQL_JAVA\scripts\types SMD_DD\Lanza_20230516_08_52_MDSQL_AGC_OBJ_DD_TYPES.log"
DEFINE USROWN=SMD_DD
@"C:\MDSQL_JAVA\scripts\types SMD_DD\o_asis_sal_justificantes_ant_s.tys"
@"C:\MDSQL_JAVA\scripts\types SMD_DD\o_asis_sal_justificantes_ant_s.tyb"
DEFINE USEROBJ=SMD_LN
@"C:\MDSQL_JAVA\scripts\types SMD_DD\o_asis_sal_justificantes_ant_s.pdc"
@"C:\MDSQL_JAVA\scripts\types SMD_DD\o_asis_sal_justificantes_cop_s.tys"
@"C:\MDSQL_JAVA\scripts\types SMD_DD\o_asis_sal_justificantes_cop_s.tyb"
DEFINE USEROBJ=SMD_LN
@"C:\MDSQL_JAVA\scripts\types SMD_DD\o_asis_sal_justificantes_cop_s.pdc"
SPOOL OFF
exit
