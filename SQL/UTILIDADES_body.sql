--------------------------------------------------------
-- Archivo creado  - lunes-septiembre-27-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body UTILIDADES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "SYS"."UTILIDADES" AS

  PROCEDURE CREATE_USER(
        p_user_name IN NVARCHAR2,
        p_user_password IN NVARCHAR2,
        p_resultado      IN OUT NOCOPY INTEGER,
        p_lista_errores  IN OUT NOCOPY t_t_error) 
    IS
        user_name NVARCHAR2(20)  	:= p_user_name;
        pwd NVARCHAR2(20) 		:= p_user_password;
        li_count       INTEGER	:= 0;
        lv_stmt   VARCHAR2 (1000);
    
    BEGIN
  
        p_resultado := C_RESULTADO_OK;
        
        lv_stmt := 'ALTER session SET "_ORACLE_SCRIPT"=true';
        DBMS_OUTPUT.put_line(lv_stmt);

        EXECUTE IMMEDIATE ( lv_stmt ); 
        
        SELECT COUNT (1)
     	INTO li_count
     	FROM dba_users
        WHERE username = UPPER ( user_name );
        
        IF li_count != 0
        THEN
            lv_stmt := 'DROP USER '|| user_name || ' CASCADE';   
            DBMS_OUTPUT.put_line(lv_stmt);
            EXECUTE IMMEDIATE ( lv_stmt );
        END IF;
        
        lv_stmt := 'CREATE USER ' || user_name || ' IDENTIFIED BY ' || pwd || ' TEMPORARY TABLESPACE temp quota 100M on SYSTEM';
        DBMS_OUTPUT.put_line(lv_stmt);

        EXECUTE IMMEDIATE ( lv_stmt ); 
        
        lv_stmt := 'ALTER USER ' || user_name || ' ACCOUNT UNLOCK';
        DBMS_OUTPUT.put_line(lv_stmt);
        
        EXECUTE IMMEDIATE ( lv_stmt );
    
        lv_stmt := 'ALTER USER ' || user_name || ' quota unlimited on users';
        DBMS_OUTPUT.put_line(lv_stmt);
        
        EXECUTE IMMEDIATE ( lv_stmt );
        
        lv_stmt := 'GRANT RESOURCE, CONNECT TO ' || user_name;
        DBMS_OUTPUT.put_line(lv_stmt);
        
        EXECUTE IMMEDIATE ( lv_stmt );
    
        lv_stmt := 'GRANT CREATE SESSION,
                    ALTER SESSION,
                    CREATE ANY TABLE,
                    CREATE DATABASE LINK,
                    CREATE MATERIALIZED VIEW,
                    CREATE SYNONYM,
                    CREATE TABLE,
                    CREATE VIEW,
                    CREATE SEQUENCE,
                    CREATE PROCEDURE,
                    CREATE VIEW,
                    CREATE TRIGGER
                    TO ' || user_name;
    
        DBMS_OUTPUT.put_line(lv_stmt);
        
        EXECUTE IMMEDIATE ( lv_stmt ); 
        
        COMMIT;
      
        EXCEPTION
            WHEN OTHERS THEN
                p_resultado := C_RESULTADO_NOK;
    
                p_lista_errores(1).txt_error := substr('CREATE_USER: ' ||
                                                     sqlerrm,
                                                     1,
                                                     200);
  END CREATE_USER;
  
  PROCEDURE DELETE_USER(
        p_user_name IN NVARCHAR2,
        p_resultado      IN OUT NOCOPY INTEGER,
        p_lista_errores  IN OUT NOCOPY t_t_error) 
    IS
        user_name NVARCHAR2(20)  	:= p_user_name;
        li_count       INTEGER	:= 0;
        lv_stmt   VARCHAR2 (1000);
    
    BEGIN
  
        p_resultado := C_RESULTADO_OK;
        
        lv_stmt := 'ALTER session SET "_ORACLE_SCRIPT"=true';
        DBMS_OUTPUT.put_line(lv_stmt);

        EXECUTE IMMEDIATE ( lv_stmt ); 
        
        SELECT COUNT (1)
     	INTO li_count
     	FROM dba_users
        WHERE username = UPPER ( user_name );
        
        IF li_count != 0
        THEN
            lv_stmt := 'DROP USER '|| user_name || ' CASCADE';
            DBMS_OUTPUT.put_line(lv_stmt);
            EXECUTE IMMEDIATE ( lv_stmt );
            COMMIT;
        END IF;
      
        EXCEPTION
            WHEN OTHERS THEN
                p_resultado := C_RESULTADO_NOK;
    
                p_lista_errores(1).txt_error := substr('CREATE_USER: ' ||
                                                     sqlerrm,
                                                     1,
                                                     200);

  END DELETE_USER;
  
END UTILIDADES;

/
