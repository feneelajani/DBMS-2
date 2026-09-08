DECLARE
    V_NUM NUMBER := 50;
    V_DEN NUMBER := 0;
    V_RESULT NUMBER;
BEGIN
    V_RESULT := V_NUM / V_DEN;

    DBMS_OUTPUT.PUT_LINE('Result = ' || V_RESULT);

EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: Division by zero is not allowed.');
END;
/
