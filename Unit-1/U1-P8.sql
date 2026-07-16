CREATE TABLE EMP
(
    EID NUMBER(5) PRIMARY KEY,
    EName VARCHAR2(30),
    DeptNo NUMBER(3),
    DeptName VARCHAR2(20),
    Gender VARCHAR2(10),
    Age NUMBER(3),
    BasicSal NUMBER(10,2)
);

INSERT INTO EMP VALUES (101,'Rahul',10,'Sales','Male',25,20000);

INSERT INTO EMP VALUES (102,'Priya',20,'HR','Female',28,25000);

INSERT INTO EMP VALUES (103,'Amit',30,'IT','Male',30,30000);

COMMIT;

DECLARE
    v_eid EMP.EID%TYPE;
    v_basic EMP.BasicSal%TYPE;
    v_hra NUMBER;
    v_da NUMBER;
    v_medical NUMBER := 500;
    v_pf NUMBER;
    v_gross NUMBER;
BEGIN
    v_eid := &EID;

    SELECT BasicSal
    INTO v_basic
    FROM EMP
    WHERE EID = v_eid;

    v_hra := v_basic * 0.15;
    v_da := v_basic * 0.50;
    v_pf := v_basic * 0.10;

    v_gross := v_basic + v_da + v_hra + v_medical - v_pf;

    DBMS_OUTPUT.PUT_LINE('Employee ID    : ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('Basic Salary   : ' || v_basic);
    DBMS_OUTPUT.PUT_LINE('HRA            : ' || v_hra);
    DBMS_OUTPUT.PUT_LINE('DA             : ' || v_da);
    DBMS_OUTPUT.PUT_LINE('Medical        : ' || v_medical);
    DBMS_OUTPUT.PUT_LINE('PF             : ' || v_pf);
    DBMS_OUTPUT.PUT_LINE('Gross Salary   : ' || v_gross);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee ID Not Found.');
END;
/