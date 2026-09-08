DECLARE
    V_NAME EMP.ENAME%TYPE;
    V_SAL  EMP.SAL%TYPE;
BEGIN
    SELECT ENAME, SAL
    INTO V_NAME, V_SAL
    FROM EMP
    WHERE EMPNO = 9999;

    DBMS_OUTPUT.PUT_LINE('Employee: ' || V_NAME);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || V_SAL);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: No employee found with EMPNO 9999.'
        );
END;
/
