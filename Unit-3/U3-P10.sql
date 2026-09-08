DECLARE
    V_NUM NUMBER;
BEGIN
    V_NUM := 100 / 0;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error Code    : ' || SQLCODE
        );

        DBMS_OUTPUT.PUT_LINE(
            'Error Message : ' || SQLERRM
        );
END;
/
