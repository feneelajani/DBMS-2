DECLARE
    V_NUM NUMBER;
BEGIN
    V_NUM := TO_NUMBER('ABC');

    DBMS_OUTPUT.PUT_LINE('Number = ' || V_NUM);

EXCEPTION
    WHEN INVALID_NUMBER THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: Invalid number format.');
END;
/
