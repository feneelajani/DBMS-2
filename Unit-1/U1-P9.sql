CREATE TABLE EMP (
    EID NUMBER(5) PRIMARY KEY,
    EName VARCHAR2(50),
    DeptNo NUMBER(3),
    DeptName VARCHAR2(30),
    Gender VARCHAR2(10),
    Age NUMBER(3),
    BasicSal NUMBER(10,2)
);
INSERT INTO EMP VALUES (7094, 'Fenil', 10, 'Computer', 'Male', 20, 30000);
INSERT INTO EMP VALUES (7011, 'Ram', 10, 'Computer', 'Male', 18 , 19000);
COMMIT;
   
SET SERVEROUTPUT ON;
DECLARE
    emp_id EMP.EID%TYPE := &EID;
    basic EMP.BasicSal%TYPE;
    hra NUMBER(10,2);
    da NUMBER(10,2);
    medical NUMBER(10,2);
    pf NUMBER(10,2);
    gross_salary NUMBER(10,2);
BEGIN
    -- Fetch Basic Salary
    SELECT BasicSal
    INTO basic
    FROM EMP
    WHERE EID = emp_id;
    -- Calculate Salary Components
    hra := basic * 0.15;
    da := basic * 0.50;
    medical := 500;
    pf := basic * 0.10;

    -- Calculate Gross Salary
    gross_salary := basic + da + hra + medical - pf;

    -- Display Output
    DBMS_OUTPUT.PUT_LINE('Basic Salary : ' || basic);
    DBMS_OUTPUT.PUT_LINE('HRA          : ' || hra);
    DBMS_OUTPUT.PUT_LINE('DA           : ' || da);
    DBMS_OUTPUT.PUT_LINE('Medical      : ' || medical);
    DBMS_OUTPUT.PUT_LINE('PF           : ' || pf);
    DBMS_OUTPUT.PUT_LINE('Gross Salary : ' || gross_salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee ID not found.');
END;
/
