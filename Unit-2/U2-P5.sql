
DECLARE
    CURSOR c_emp(p_dept NUMBER) IS
        SELECT ename, sal
        FROM emp
        WHERE deptno = p_dept;

    v_total NUMBER;

BEGIN
    FOR d IN (SELECT DISTINCT deptno FROM emp ORDER BY deptno) LOOP

        DBMS_OUTPUT.PUT_LINE('Department No : ' || d.deptno);

        v_total := 0;

        FOR e IN c_emp(d.deptno) LOOP
            DBMS_OUTPUT.PUT_LINE('Employee Name : ' || e.ename ||
                                 '  Basic Salary : ' || e.sal);

            v_total := v_total + e.sal;
        END LOOP;

        DBMS_OUTPUT.PUT_LINE('Department Wise Total Gross Salary : ' || v_total);
        DBMS_OUTPUT.PUT_LINE('-------------------------------------');

    END LOOP;
END;
/