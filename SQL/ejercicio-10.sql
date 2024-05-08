--PRACTICA 5- MULTIPLOS DE 4
DECLARE
    inicio NUMBER;
    final  NUMBER;
BEGIN
    inicio := 10;
    final := 200;
    FOR i IN inicio..final LOOP
        IF MOD(i, 4) = 0 THEN
            dbms_output.put_line(i);
        END IF;
    END LOOP;
END;
/
