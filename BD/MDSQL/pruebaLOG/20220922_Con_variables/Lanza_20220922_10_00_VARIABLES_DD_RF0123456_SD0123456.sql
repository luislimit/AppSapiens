SET DEFINE ON
SET VERIFY	ON
SET ECHO OFF
SPOOL "c:\pruebaLOG\20220922_10_00_VARIABLES_DD_RF0123456_SD0123456_sqlplus.log"
DEFINE USROWN=usuario
@"c:\pruebaLOG\20220922_10_00_VARIABLES_DD_RF0123456_SD0123456.sql"
PROMPT -- BORRAMOS LA TABLA
DROP TABLE CLIENTES2;
SPOOL OFF
