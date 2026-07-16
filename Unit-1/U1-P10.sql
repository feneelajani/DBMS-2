SET SERVEROUTPUT ON;

DECLARE
    emp_id EMP.EID%TYPE := &EID;
BEGIN
    DELETE FROM EMP
    WHERE EID = emp_id;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Employee record deleted successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee ID not found.');
    END IF;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/