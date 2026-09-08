DECLARE
    V_NAME EMP.ENAME%TYPE;
    V_SAL  EMP.SAL%TYPE;
BEGIN
    SELECT ENAME, SAL
    INTO V_NAME, V_SAL
    FROM EMP
    WHERE AGE = 50;

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || V_NAME);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || V_SAL);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee with age 50 found.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('More than one employee is 50 years old.');
END;
/
