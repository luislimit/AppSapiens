--PRACTICA2- FRASE AL REVES
DECLARE
    frase          VARCHAR2(100);
    limite         NUMBER;
    contador       NUMBER;
    frase_al_reves VARCHAR2(100);
BEGIN
    frase := 'ESTO ES UNA PRUEBA DE FRASE';
    limite := length(frase);
    WHILE limite > 0 LOOP
        frase_al_reves := frase_al_reves
                          || substr(frase, limite, 1);
        limite := limite - 1;
    END LOOP;

    dbms_output.put_line(frase_al_reves);
END;
/