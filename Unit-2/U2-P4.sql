
SET SERVEROUTPUT ON;
DECLARE
    CURSOR C1 IS
        SELECT ENAME, BASICSAL
        FROM (
            SELECT ENAME, BASICSAL
            FROM EMP
            ORDER BY BASICSAL DESC
        )
        WHERE ROWNUM <= 3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('TOP 3 HIGHEST PAID EMPLOYEES');

    FOR I IN C1 LOOP
        DBMS_OUTPUT.PUT_LINE('NAME : ' || I.ENAME ||
                             '  SALARY : ' || I.BASICSAL);
    END LOOP;
END;
/