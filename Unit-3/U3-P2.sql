DECLARE
    V_NAME   RESULT.SNAME%TYPE := '&student_name';
    V_RESULT RESULT.RESULT%TYPE;
BEGIN
    SELECT RESULT
    INTO V_RESULT
    FROM RESULT
    WHERE SNAME = V_NAME;

    DBMS_OUTPUT.PUT_LINE('Student Name: ' || V_NAME);
    DBMS_OUTPUT.PUT_LINE('Result: ' || V_RESULT);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student does not exist.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('More than one student found.');
END;
/
