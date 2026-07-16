DECLARE 
    N NUMBER;
    I NUMBER;
BEGIN
    N:=&N;
    I:=1;
    LOOP
        EXIT WHEN I>N;
        DBMS_OUTPUT.PUT_LINE(I);
        I:=I+1;
        END LOOP;
END;
/ 