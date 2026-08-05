SET SERVEROUTPUT ON;

DECLARE
    CURSOR C1 IS
        SELECT EID, ENAME, BASICSAL
        FROM EMP
        WHERE DEPTNO = 20
        FOR UPDATE;

    V_EID EMP.EID%TYPE;
    V_ENAME EMP.ENAME%TYPE;
    V_SAL EMP.BASICSAL%TYPE;

BEGIN
    OPEN C1;

    IF C1%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor Opened');
    END IF;

    LOOP
        FETCH C1 INTO V_EID, V_ENAME, V_SAL;

        EXIT WHEN C1%NOTFOUND;

        UPDATE EMP
        SET BASICSAL = BASICSAL * 1.05
        WHERE CURRENT OF C1;

        INSERT INTO EMP
        VALUES
        (
            V_EID,
            V_ENAME,
            V_SAL,
            V_SAL * 1.05,
        );

    END LOOP;

    CLOSE C1;

    DBMS_OUTPUT.PUT_LINE('Salary Updated And Record Inserted');

    COMMIT;
END;
/