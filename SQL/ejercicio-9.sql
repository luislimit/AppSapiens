--PRACTICA4- ASTERISCOS
DECLARE
    nombre     VARCHAR2(100);
    asteriscos VARCHAR2(100);
BEGIN
    nombre := 'ALBERTO';
    FOR i IN 1..length(nombre) LOOP
        asteriscos := asteriscos || '*';
    END LOOP;

    dbms_output.put_line(nombre
                         || '-->'
                         || asteriscos);
END;
/