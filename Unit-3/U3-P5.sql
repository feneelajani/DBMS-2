DECLARE
    V_DEPTNO EMP.DEPTNO%TYPE := &dept_no;

    NO_DEPT_FOUND EXCEPTION;

    CURSOR C_EMP IS
        SELECT *
        FROM EMP
        WHERE DEPTNO = V_DEPTNO;

    V_COUNT NUMBER := 0;
BEGIN
    FOR E IN C_EMP LOOP

        INSERT INTO EMP_BACKUP
        VALUES
        (
            E.EMPNO,
            E.ENAME,
            E.JOB,
            E.MGR,
            E.HIREDATE,
            E.SAL,
            E.COMM,
            E.DEPTNO
        );

        V_COUNT := V_COUNT + 1;
    END LOOP;

    IF V_COUNT = 0 THEN
        RAISE NO_DEPT_FOUND;
    END IF;

    DBMS_OUTPUT.PUT_LINE(
        V_COUNT || ' employee record(s) inserted into EMP_BACKUP.'
    );

EXCEPTION
    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'No employees found for department ' || V_DEPTNO
        );
END;
/
