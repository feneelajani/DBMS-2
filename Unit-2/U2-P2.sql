CREATE TABLE EMP_UPDATE
(
    EID NUMBER,
    OLD_SAL NUMBER,
    NEW_SAL NUMBER,
    UPDATE_DATE DATE
);

BEGIN
    UPDATE EMP
    SET BASICSAL = BASICSAL * 1.05
    WHERE DEPTNO = 20;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found in Department 20');
    ELSE
        INSERT INTO EMP_UPDATE
        SELECT EID,
               BASICSAL/1.05,
               BASICSAL,
               SYSDATE
        FROM EMP
        WHERE DEPTNO = 20;

        DBMS_OUTPUT.PUT_LINE('Salary updated successfully.');
    END IF;

    COMMIT;
END;
/