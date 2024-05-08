num_orden_type=1
nom_objeto=O_ASIS_SAL_JUSTIFICANTES_ANT_S
cuadre_tys=S
cuadre_tyb=S
cuadre_pdc=S
cuadre_drop=N
nom_script = o_asis_sal_justificantes_ant_s.tys
tip_script = TYS
-----------------------------------------------------------
---MAPFRE DGTP - Modelo de datos ---- MDSQL v9 ------------
-----------------------------------------------------------
---Nº PETICIÓN:       RF-SD
---FECHA:             23/02/2023 12:57:04
---SOLICITADA POR:    MARIPAM
---OBJETOS AFECTADOS: O_ASIS_SAL_JUSTIFICANTES_ANT_S
---PROYECTO:          MDSQL_AGC_OBJ
---ENTORNO:           FD012
---REALIZADO POR:     MARIPAM
-----------------------------------------------------------
---TOTAL TABLAS      - CREADAS: 0, MODIFICADAS: 0, ELIMINADAS: 0
---TOTAL INDICES     - CREADOS: 0, MODIFICADOS: 0, ELIMINADOS: 0
---TOTAL VISTAS      - CREADAS: 0,                 ELIMINADAS: 0
---TOTAL VISTAS MAT. - CREADAS: 0, MODIFICADAS: 0, ELIMINADAS: 0
---TOTAL SECUENCIAS  - CREADAS: 0, MODIFICADAS: 0, ELIMINADAS: 0
---TOTAL TYPES       - CREADOS: 1,                 ELIMINADOS: 0
---TOTAL OBJETOS AFECTADOS: 1
---VARIABLES UTILIZADAS: &&USROWN
-----------------------------------------------------------
CREATE OR REPLACE TYPE &&USROWN..O_ASIS_SAL_JUSTIFICANTES_ANT_S AS OBJECT
(
    JUSTIFICANTESANTERIORES        VARCHAR2(3),
    CODERROR                       VARCHAR2(10),
    DESERROR                       VARCHAR2(1000)
,CONSTRUCTOR FUNCTION O_ASIS_SAL_JUSTIFICANTES_ANT_S(
    P_JUSTIFICANTESANTERIORES      VARCHAR2,
    P_CODERROR                     VARCHAR2,
    P_DESERROR                     VARCHAR2) RETURN SELF AS RESULT
);
/
nom_script = o_asis_sal_justificantes_ant_s.tyb
tip_script = TYB
-----------------------------------------------------------
---MAPFRE DGTP - Modelo de datos ---- MDSQL v9 ------------
-----------------------------------------------------------
---Nº PETICIÓN:       RF-SD
---FECHA:             23/02/2023 12:57:04
---SOLICITADA POR:    MARIPAM
---OBJETOS AFECTADOS: 
---PROYECTO:          MDSQL_AGC_OBJ
---ENTORNO:           FD012
---REALIZADO POR:     MARIPAM
-----------------------------------------------------------
---TOTAL TABLAS      - CREADAS: 0, MODIFICADAS: 0, ELIMINADAS: 0
---TOTAL INDICES     - CREADOS: 0, MODIFICADOS: 0, ELIMINADOS: 0
---TOTAL VISTAS      - CREADAS: 0,                 ELIMINADAS: 0
---TOTAL VISTAS MAT. - CREADAS: 0, MODIFICADAS: 0, ELIMINADAS: 0
---TOTAL SECUENCIAS  - CREADAS: 0, MODIFICADAS: 0, ELIMINADAS: 0
---TOTAL TYPES       - CREADOS: 1,                 ELIMINADOS: 0
---TOTAL OBJETOS AFECTADOS: 0
---VARIABLES UTILIZADAS: &&USROWN
-----------------------------------------------------------
CREATE OR REPLACE TYPE BODY &&USROWN..O_ASIS_SAL_JUSTIFICANTES_ANT_S AS
CONSTRUCTOR FUNCTION O_ASIS_SAL_JUSTIFICANTES_ANT_S(
    P_JUSTIFICANTESANTERIORES      VARCHAR2,
    P_CODERROR                     VARCHAR2,
    P_DESERROR                     VARCHAR2) RETURN SELF AS RESULT
    IS
    BEGIN
    SELF.JUSTIFICANTESANTERIORES         := P_JUSTIFICANTESANTERIORES;
    SELF.CODERROR                        := P_CODERROR;
    SELF.DESERROR                        := P_DESERROR;
    RETURN;
END;
END;
/
nom_script = o_asis_sal_justificantes_ant_s.pdc
tip_script = PDC
-----------------------------------------------------------
---MAPFRE DGTP - Modelo de datos ---- MDSQL v9 ------------
-----------------------------------------------------------
---Nº PETICIÓN:       RF-SD
---FECHA:             23/02/2023 12:57:04
---SOLICITADA POR:    MARIPAM
---OBJETOS AFECTADOS: O_ASIS_SAL_JUSTIFICANTES_ANT_S
---PROYECTO:          MDSQL_AGC_OBJ
---ENTORNO:           FD012
---REALIZADO POR:     MARIPAM
-----------------------------------------------------------
---TOTAL PERMISOS : 1
---TOTAL SINÓNIMOS - CREADOS: 1, ELIMINADOS: 0
---TOTAL OBJETOS AFECTADOS: 1
---VARIABLES UTILIZADAS: &&USROWN,&&USEROBJ
-----------------------------------------------------------
GRANT EXECUTE ON &&USROWN..O_ASIS_SAL_JUSTIFICANTES_ANT_S TO &&USEROBJ;
CREATE OR REPLACE SYNONYM &&USEROBJ..O_ASIS_SAL_JUSTIFICANTES_ANT_S FOR &&USROWN..O_ASIS_SAL_JUSTIFICANTES_ANT_S;
---------
num_orden_type=2
nom_objeto=O_ASIS_SAL_JUSTIFICANTES_COP_S
cuadre_tys=S
cuadre_tyb=S
cuadre_pdc=S
cuadre_drop=N
nom_script = o_asis_sal_justificantes_cop_s.tys
tip_script = TYS
-----------------------------------------------------------
---MAPFRE DGTP - Modelo de datos ---- MDSQL v9 ------------
-----------------------------------------------------------
---Nº PETICIÓN:       RF-SD
---FECHA:             23/02/2023 12:57:04
---SOLICITADA POR:    MARIPAM
---OBJETOS AFECTADOS: O_ASIS_SAL_JUSTIFICANTES_COP_S
---PROYECTO:          MDSQL_AGC_OBJ
---ENTORNO:           FD012
---REALIZADO POR:     MARIPAM
-----------------------------------------------------------
---TOTAL TABLAS      - CREADAS: 0, MODIFICADAS: 0, ELIMINADAS: 0
---TOTAL INDICES     - CREADOS: 0, MODIFICADOS: 0, ELIMINADOS: 0
---TOTAL VISTAS      - CREADAS: 0,                 ELIMINADAS: 0
---TOTAL VISTAS MAT. - CREADAS: 0, MODIFICADAS: 0, ELIMINADAS: 0
---TOTAL SECUENCIAS  - CREADAS: 0, MODIFICADAS: 0, ELIMINADAS: 0
---TOTAL TYPES       - CREADOS: 1,                 ELIMINADOS: 0
---TOTAL OBJETOS AFECTADOS: 1
---VARIABLES UTILIZADAS: &&USROWN
-----------------------------------------------------------
CREATE OR REPLACE TYPE &&USROWN..O_ASIS_SAL_JUSTIFICANTES_COP_S AS OBJECT
(
    JUSTIFICANTESANTERIORE2        VARCHAR2(3),
    CODERROR2                      VARCHAR2(10),
    DESERROR2                      VARCHAR2(1000)
,CONSTRUCTOR FUNCTION O_ASIS_SAL_JUSTIFICANTES_COP_S(
    P_JUSTIFICANTESANTERIORE2      VARCHAR2,
    P_CODERROR2                    VARCHAR2,
    P_DESERROR2                    VARCHAR2) RETURN SELF AS RESULT
);
/
nom_script = o_asis_sal_justificantes_cop_s.tyb
tip_script = TYB
-----------------------------------------------------------
---MAPFRE DGTP - Modelo de datos ---- MDSQL v9 ------------
-----------------------------------------------------------
---Nº PETICIÓN:       RF-SD
---FECHA:             23/02/2023 12:57:04
---SOLICITADA POR:    MARIPAM
---OBJETOS AFECTADOS: 
---PROYECTO:          MDSQL_AGC_OBJ
---ENTORNO:           FD012
---REALIZADO POR:     MARIPAM
-----------------------------------------------------------
---TOTAL TABLAS      - CREADAS: 0, MODIFICADAS: 0, ELIMINADAS: 0
---TOTAL INDICES     - CREADOS: 0, MODIFICADOS: 0, ELIMINADOS: 0
---TOTAL VISTAS      - CREADAS: 0,                 ELIMINADAS: 0
---TOTAL VISTAS MAT. - CREADAS: 0, MODIFICADAS: 0, ELIMINADAS: 0
---TOTAL SECUENCIAS  - CREADAS: 0, MODIFICADAS: 0, ELIMINADAS: 0
---TOTAL TYPES       - CREADOS: 1,                 ELIMINADOS: 0
---TOTAL OBJETOS AFECTADOS: 0
---VARIABLES UTILIZADAS: &&USROWN
-----------------------------------------------------------
CREATE OR REPLACE TYPE BODY &&USROWN..O_ASIS_SAL_JUSTIFICANTES_COP_S AS
CONSTRUCTOR FUNCTION O_ASIS_SAL_JUSTIFICANTES_COP_S(
    P_JUSTIFICANTESANTERIORE2      VARCHAR2,
    P_CODERROR2                    VARCHAR2,
    P_DESERROR2                    VARCHAR2) RETURN SELF AS RESULT
    IS
    BEGIN
    SELF.JUSTIFICANTESANTERIORE2         := P_JUSTIFICANTESANTERIORE2;
    SELF.CODERROR2                       := P_CODERROR2;
    SELF.DESERROR2                       := P_DESERROR2;
    RETURN;
END;
END;
/
nom_script = o_asis_sal_justificantes_cop_s.pdc
tip_script = PDC
-----------------------------------------------------------
---MAPFRE DGTP - Modelo de datos ---- MDSQL v9 ------------
-----------------------------------------------------------
---Nº PETICIÓN:       RF-SD
---FECHA:             23/02/2023 12:57:04
---SOLICITADA POR:    MARIPAM
---OBJETOS AFECTADOS: O_ASIS_SAL_JUSTIFICANTES_COP_S
---PROYECTO:          MDSQL_AGC_OBJ
---ENTORNO:           FD012
---REALIZADO POR:     MARIPAM
-----------------------------------------------------------
---TOTAL PERMISOS : 1
---TOTAL SINÓNIMOS - CREADOS: 1, ELIMINADOS: 0
---TOTAL OBJETOS AFECTADOS: 1
---VARIABLES UTILIZADAS: &&USROWN,&&USEROBJ
-----------------------------------------------------------
GRANT EXECUTE ON &&USROWN..O_ASIS_SAL_JUSTIFICANTES_COP_S TO &&USEROBJ;
CREATE OR REPLACE SYNONYM &&USEROBJ..O_ASIS_SAL_JUSTIFICANTES_COP_S FOR &&USROWN..O_ASIS_SAL_JUSTIFICANTES_COP_S;
---------
------ ERRORES 
