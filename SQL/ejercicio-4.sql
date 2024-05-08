-- Práctica 4
DECLARE
    maximo     NUMBER;
    minimo     NUMBER;
    diferencia NUMBER;
BEGIN
    SELECT
        MAX(salary),
        MIN(salary)
    INTO
        maximo,
        minimo
    FROM
        employees;

    dbms_output.put_line('EL SALARIO MÁXIMO ES:' || maximo);
    dbms_output.put_line('EL SALARIO MÍNIMO ES:' || minimo);
    diferencia := maximo - minimo;
    dbms_output.put_line('LA DIFERENCIA ES:' || diferencia);
END;
/