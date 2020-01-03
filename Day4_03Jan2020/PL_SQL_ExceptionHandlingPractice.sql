SET serveroutput ON;
SET verify OFF;
--NAmed System Defined Exception
DECLARE
    vname employees.last_name%TYPE;
    vsal employees.salary%TYPE;
BEGIN
    SELECT last_name, salary
    INTO vname, vsal
    FROM employees
    WHERE employee_id IN (&empid);
    
    dbms_output.put_line(vname||' '||vsal);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No Employees!');
    WHEN TOO_MANY_ROWS THEN
        dbms_output.put_line('More Than One Row!');
END;

--NAmed Syatem Defined Exception
DECLARE
    vname employees.last_name%TYPE;
    vsal employees.salary%TYPE;
BEGIN
    SELECT last_name, salary
    INTO vname, vsal
    FROM employees
    WHERE employee_id = &empid;
EXCEPTION
    /*WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No Employees!');*/
    WHEN OTHERS THEN
        dbms_output.put_line('Error...');
END;

--Unnamed System defined exceptions
DECLARE
    emp_exist EXCEPTION;
    PRAGMA EXCEPTION_INIT(emp_exist, -02292);
BEGIN
    delete from departments
    where department_id = &empid;
EXCEPTION
    WHEN emp_exist THEN
        dbms_output.put_line('Cannot remove department since employees exist');
END;        

--Age must be between 21 and 60 else raise exception using named User defined Exception.
DECLARE
    v_age NUMBER := &age;
    invalid_age EXCEPTION;
BEGIN
    IF v_age NOT BETWEEN 21 AND 60 THEN
        RAISE invalid_age;
    ELSE
        dbms_output.put_line('Congrats you are eligible!');
    END IF;
EXCEPTION
    when invalid_age THEN
        dbms_output.put_line('age must be between 21 and 60');
END;

--Age must be between 21 and 60 else raise exception using Unnamed User defined Exception.
DECLARE
    v_age NUMBER := &age;
BEGIN
    IF v_age NOT BETWEEN 21 AND 60 THEN
        RAISE_APPLICATION_ERROR(-20111, 'Age must be 21-60');
    ELSE
        dbms_output.put_line('Congrats you are eligible!');
    END IF;
END;

