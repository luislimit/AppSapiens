--------------------------------------------------------
--  DDL for Function CREATE_SCRIPT_LANZA
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SAPIENS"."CREATE_SCRIPT_LANZA" (
    script_name varchar2,
    ruta varchar2,
    nom_esquema varchar2) RETURN T_R_SCRIPT_LANZA
IS
    script_lanza T_R_SCRIPT_LANZA;
    v_plataforma VARCHAR2(500);
BEGIN
    -- Se crea una instancia de T_R_SCRIPT_LANZA
    script_lanza := T_R_SCRIPT_LANZA('', '');

    for reg in (SELECT 
                    nombre, txt 
                FROM SCRIPTS_LANZA 
                WHERE TIPO = 'SQL') loop

        script_lanza.nombre := reg.nombre;
        script_lanza.txt := reg.txt;

    end loop;	

    -- Reemplazar las cadenas especificadas
    script_lanza.nombre := REPLACE(script_lanza.nombre, 'script_name', script_name);
    script_lanza.txt := REPLACE(script_lanza.txt, '[ruta]', ruta);
    script_lanza.txt := REPLACE(script_lanza.txt, '[script]', script_name);
    script_lanza.txt := REPLACE(script_lanza.txt, '[usr]', nom_esquema);
    
    RETURN script_lanza;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Si no hay datos, devuelve error
        RAISE_APPLICATION_ERROR(-20001,'ERROR, NO DATA');
END;

/
