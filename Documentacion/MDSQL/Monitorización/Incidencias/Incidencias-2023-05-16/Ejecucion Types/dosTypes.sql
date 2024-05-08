
CREATE OR REPLACE TYPE SMD_DD.O_ASIS_SAL_JUSTIFICANTES_ANT_S AS OBJECT
(
    JUSTIFICANTESANTERIORES       VARCHAR2(3),
    CODERROR                      VARCHAR2(10),
    DESERROR                      VARCHAR2(1000)
,CONSTRUCTOR FUNCTION O_ASIS_SAL_JUSTIFICANTES_ANT_S(
    P_JUSTIFICANTESANTERIORES     VARCHAR2,
    P_CODERROR                    VARCHAR2,
    P_DESERROR                    VARCHAR2) RETURN SELF AS RESULT
);
/
CREATE OR REPLACE TYPE SMD_DD.O_ASIS_SAL_JUSTIFICANTES_COP_S AS OBJECT
(
    JUSTIFICANTESANTERIORE2       VARCHAR2(3),
    CODERROR2                      VARCHAR2(10),
    DESERROR2                     VARCHAR2(1000)
,CONSTRUCTOR FUNCTION O_ASIS_SAL_JUSTIFICANTES_COP_S(
    P_JUSTIFICANTESANTERIORE2     VARCHAR2,
    P_CODERROR2                    VARCHAR2,
    P_DESERROR2                    VARCHAR2) RETURN SELF AS RESULT
);
/
