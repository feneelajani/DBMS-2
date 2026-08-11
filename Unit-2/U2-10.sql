SET SERVEROUTPUT ON;

BEGIN
    UPDATE EMP
    SET BASICSAL = BASICSAL - 5000
    WHERE EID = 7073;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Record Updated Successfully.');
        DBMS_OUTPUT.PUT_LINE('Rows Updated : ' || SQL%ROWCOUNT);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee Record Not Found.');
    END IF;
END;
/