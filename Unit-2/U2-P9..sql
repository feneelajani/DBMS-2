DECLARE
    CURSOR c1 IS
        SELECT *
        FROM CUSTOMER
        ORDER BY CUST_NAME;

    v_customer CUSTOMER%ROWTYPE;

BEGIN
    OPEN c1;

    LOOP
        FETCH c1 INTO v_customer;
        EXIT WHEN c1%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Customer ID : ' || v_customer.CUST_ID ||
            '  Name : ' || v_customer.CUST_NAME ||
            '  City : ' || v_customer.CITY
        );
    END LOOP;

    CLOSE c1;
END;
/