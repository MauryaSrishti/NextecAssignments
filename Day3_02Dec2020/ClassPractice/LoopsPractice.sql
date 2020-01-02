SET serveroutput ON;

--simple loop
DECLARE
    x NUMBER:=10;
BEGIN
    LOOP
        dbms_output.put_line(x);
        
        EXIT WHEN x<=1;
        x:=x-1;
    END LOOP;
    
END;    

declare
    x number:=10;
begin
    while x>=1
    loop
        dbms_output.put_line(x);
        x:=x-1;
    end loop;
end;    

--for loop
begin
    for i in 1..10
    loop
        DBMS_OUTPUT.PUT_LINE (i);
    end loop;
end;    

-- REVERSE for loop
begin
    for i in REVERSE 1..10
    loop
        DBMS_OUTPUT.PUT_LINE (i);
    end loop;
end;

--DISPLAY FIRST 10 EMPLOYEE NAME AND SALARY
DECLARE
    VNAME VARCHAR2(20);
    VSAL employees.salary%type;
BEGIN
    FOR i IN REVERSE 100..109
    LOOP
        SELECT last_name, salary
        INTO VNAME, VSAL
        FROM employees
        WHERE employee_id = i;
        
        DBMS_OUTPUT.PUT_LINE(VNAME||'  '||VSAL);
    END LOOP;
END;    
