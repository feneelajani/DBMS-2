-- -- 6) Write a program using a cursor to insert the records of employees in the EMP_BACKUP table for given DEPT_NO, also raise a user-defined exception NO_DEPT_FOUND when no records are found for entered DEPT_NO. 

-- CREATE TABLE EMP
-- (
--     	EID NUMBER(4),
--     	ENAME VARCHAR2(10),
--     	DEPNO NUMBER(5),
--     	DEPNAME VARCHAR2(10),
--     	GENDER CHAR(1),
--     	AGE NUMBER(3),
--     	BASICSAL NUMBER(7,2)
-- );

-- insert into EMP values (7071 , 'Harsh' , 10 , 'Sales' , 'M' , 23 , 50000);
-- insert into EMP values(7073 , 'Jill' , 20 , 'Marketing' , 'M' , 24 , 60000);

-- CREATE TABLE EMP_BACKUP AS
-- SELECT * FROM EMP WHERE 1 = 2;

-- PL/SQL Program

DECLARE
	
    CURSOR C1 IS
        SELECT * FROM EMP WHERE DEPNO = &DEPNO;
    R C1%ROWTYPE;

    NO_DEPT_FOUND EXCEPTION;
    CNT NUMBER := 0;

BEGIN
    OPEN C1;

    LOOP
        FETCH C1 INTO R;
        EXIT WHEN C1%NOTFOUND;

        INSERT INTO EMP_BACKUP
        VALUES
        (
            R.EID,
            R.ENAME,
            R.DEPNO,
            R.DEPNAME,
            R.GENDER,
            R.AGE,
            R.BASICSAL
        );

        CNT := CNT + 1;
    END LOOP;

    CLOSE C1;

    IF CNT = 0 THEN
        RAISE NO_DEPT_FOUND;
    ELSE
        DBMS_OUTPUT.PUT_LINE(CNT || ' Record inserted successfully.');
    END IF;

EXCEPTION
    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No records found for the given DEPTNO.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/