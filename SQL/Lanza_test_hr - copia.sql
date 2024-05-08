SET DEFINE ON
SET VERIFY ON
SET ECHO OFF
SPOOL "C:\workspaceEsoluzion\AppSapiens\SQL/test_hr - copia.sql.log"
DEFINE DAT_SMD_LD_U64K=DAT_SMD_LD_U64K
DEFINE IND_SMD_LD_U64K=IND_SMD_LD_U64K
DEFINE USROWN=HR
@"C:\workspaceEsoluzion\AppSapiens\SQL/test_hr - copia.sql"
SPOOL OFF
EXIT
