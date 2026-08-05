-- 4) Write a PL/SQL block using a cursor FOR loop to display the name and the basic salary of the top 3 highest paid employees. (Use Cursor For Loop) 

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