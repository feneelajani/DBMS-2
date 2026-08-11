SET SERVEROUTPUT ON;

DECLARE
    CURSOR c1 IS
        SELECT * FROM CUSTOMER
        WHERE CITY LIKE 'A%';

BEGIN
    FOR rec IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Customer ID : ' || rec.CUST_ID ||
            '  Name : ' || rec.CUST_NAME ||
            '  City : ' || rec.CITY
        );
    END LOOP;
END;
/