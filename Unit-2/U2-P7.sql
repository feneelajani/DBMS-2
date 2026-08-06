CREATE TABLE CUSTOMER (
    CUSTOMER_ID NUMBER(5) PRIMARY KEY,
    CUSTOMER_NAME VARCHAR2(30),
    CITY VARCHAR2(30)
);

INSERT INTO CUSTOMER VALUES (101, 'Rahul', 'Ahmedabad');
INSERT INTO CUSTOMER VALUES (102, 'Priya', 'Rajkot');
INSERT INTO CUSTOMER VALUES (103, 'Amit', 'Surat');
INSERT INTO CUSTOMER VALUES (104, 'Neha', 'Vadodara');
INSERT INTO CUSTOMER VALUES (105, 'Karan', 'Jamnagar');

COMMIT;

DECLARE
   
    CURSOR c_customer IS
        SELECT customer_id, customer_name, city
        FROM customer;

    
    v_customer_id   customer.customer_id%TYPE;
    v_customer_name customer.customer_name%TYPE;
    v_city          customer.city%TYPE;

BEGIN
    
    OPEN c_customer;

    
    LOOP
        FETCH c_customer
        INTO v_customer_id, v_customer_name, v_city;

        
        EXIT WHEN c_customer%NOTFOUND;

        
        DBMS_OUTPUT.PUT_LINE(
            'Customer ID: ' || v_customer_id ||
            ', Name: ' || v_customer_name ||
            ', City: ' || v_city
        );
    END LOOP;

    
    CLOSE c_customer;
END;
/