create or replace FUNCTION create_script_lanza(
    script_name varchar2,
    ruta varchar2,
    usuario varchar2,
    pwd varchar2,
    bbdd varchar2) RETURN T_R_SCRIPT_LANZA
IS
    script_lanza T_R_SCRIPT_LANZA;
BEGIN
    script_lanza := T_R_SCRIPT_LANZA('', '');
    
    for reg in (SELECT 
                    nombre, txt 
                FROM SCRIPTS_LANZA 
                WHERE PLATAFORMA = 'Linux') loop

        script_lanza.nombre := reg.nombre;
        script_lanza.txt := reg.txt;
        
    end loop;	
    
    -- Reemplazar las cadenas especificadas
    script_lanza.nombre := REPLACE(script_lanza.nombre, 'script_name', script_name);
    script_lanza.txt := REPLACE(script_lanza.txt, 'usuario', usuario);
    script_lanza.txt := REPLACE(script_lanza.txt, 'pwd', pwd);
    script_lanza.txt := REPLACE(script_lanza.txt, 'bbdd', bbdd);
    script_lanza.txt := REPLACE(script_lanza.txt, 'ruta', ruta);
    script_lanza.txt := REPLACE(script_lanza.txt, 'script_name', script_name);
    
    RETURN script_lanza;
EXCEPTION
WHEN NO_DATA_FOUND THEN
    --SI EL DEPARTAMENTO NO EXISTE DEVUELVE ERROR
    RAISE_APPLICATION_ERROR(-20001,'ERROR, NO DATA');
END;