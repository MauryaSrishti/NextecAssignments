--settings
SET serverout ON;
SET verify OFF;

--bind Variable
VAR g_age NUMBER;

--PL/SQL block thataccepts age and prints it
DECLARE
    v_age NUMBER:=&age;
BEGIN
    dbms_output.put_line('Age is '||v_age);
    :g_age:=v_age;
END;    

--PL/SQL Block that displays salary and name of employee for the input employee_id
DECLARE
    VNAME VARCHAR2(20);
    VSAL NUMBER;
BEGIN
    SELECT last_name, salary*12
    INTO VNAME, VSAL
    FROM employees
    WHERE employee_id = &empid;
    
    DBMS_OUTPUT.PUT_LINE('Name is :'||VNAME);
    DBMS_OUTPUT.PUT_LINE('Annual Salary is :'||VSAL);
END;

--PL/SQL Block that returns name and Salary for the input department_id
DECLARE
    VNAME VARCHAR2(20);
    VSAL NUMBER;
BEGIN
    SELECT last_name, salary*12
    INTO VNAME, VSAL
    FROM employees
    WHERE department_id = &deptid;
    
    DBMS_OUTPUT.PUT_LINE('Name is :'||VNAME);
    DBMS_OUTPUT.PUT_LINE('Annual Salary is :'||VSAL);
    
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No Employees in this department');
    WHEN too_many_rows THEN
        dbms_output.put_line('More than one employee');    
END;

--scope of variable
DECLARE
    x NUMBER:=5;
BEGIN
    
        DECLARE
            y NUMBER:=6;
            
        BEGIN
            dbms_output.put_line('x :'||x);
            DBMS_OUTPUT.PUT_LINE('y :'||y);
        END;
        DBMS_OUTPUT.PUT_LINE('x :'||x);
        
END;        

--scope of variable
DECLARE
    x NUMBER:=5;
BEGIN
    
        DECLARE
            x NUMBER:=6;
            
        BEGIN
            dbms_output.put_line('x :'||x);
            DBMS_OUTPUT.PUT_LINE('x :'||x);
        END;
        DBMS_OUTPUT.PUT_LINE('x :'||x);
        
END; 

--Scope of variable
<<a>>
DECLARE
    x NUMBER:=5;
BEGIN
    <<b>>
    DECLARE
        x NUMBER:=6;
        
    BEGIN
        dbms_output.put_line('outer x :'||a.x);
        DBMS_OUTPUT.PUT_LINE('inner x :'||b.x);
    END;
    DBMS_OUTPUT.PUT_LINE('x :'||x);
        
END;