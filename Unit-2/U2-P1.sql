DECLARE
BEGIN
    UPDATE EMP
    SET BASICSAL = BASICSAL * 1.10
    WHERE DEPTNO = 10;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Salary updated successfully.');
        DBMS_OUTPUT.PUT_LINE('Total Records Updated: ' || SQL%ROWCOUNT);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No employee found in Department 10.');
    END IF;

    COMMIT;
END;
/