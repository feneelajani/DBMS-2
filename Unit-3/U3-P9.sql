DECLARE
    V_EMPNO EMP.EMPNO%TYPE := &empno;
    V_COMM  EMP.COMM%TYPE;

    NULL_COMMISSION EXCEPTION;
BEGIN
    SELECT COMM
    INTO V_COMM
    FROM EMP
    WHERE EMPNO = V_EMPNO;

    IF V_COMM IS NULL THEN
        RAISE NULL_COMMISSION;
    END IF;

    DBMS_OUTPUT.PUT_LINE(
        'Commission = ' || V_COMM
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Employee does not exist.'
        );

    WHEN NULL_COMMISSION THEN
        DBMS_OUTPUT.PUT_LINE(
            'Commission is NULL for this employee.'
        );
END;
/
