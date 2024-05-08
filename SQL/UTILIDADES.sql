--------------------------------------------------------
-- Archivo creado  - lunes-septiembre-27-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package UTILIDADES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "SYS"."UTILIDADES" AS 
    -- Constantes
	C_RESULTADO_OK CONSTANT NUMBER(1) := 1;

	C_RESULTADO_NOK CONSTANT NUMBER(1) := 0;

	C_RESULTADO_AVISO CONSTANT NUMBER(1) := 2;
    
    TYPE t_r_error IS RECORD(txt_error VARCHAR2(200));

	TYPE t_t_error IS TABLE OF t_r_error INDEX BY BINARY_INTEGER;

    /* TODO enter package declarations (types, exceptions, methods etc) here */
    PROCEDURE CREATE_USER(
        p_user_name IN NVARCHAR2,
        p_user_password IN NVARCHAR2,
        p_resultado      IN OUT NOCOPY INTEGER,
        p_lista_errores  IN OUT NOCOPY t_t_error);
        
    PROCEDURE DELETE_USER(
        p_user_name IN NVARCHAR2,
        p_resultado      IN OUT NOCOPY INTEGER,
        p_lista_errores  IN OUT NOCOPY t_t_error);

END UTILIDADES;

/
