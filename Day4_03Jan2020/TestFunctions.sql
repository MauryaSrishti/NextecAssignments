SET serveroutput ON;
SET verify OFF;

--create function to add two numbers
CREATE OR REPLACE FUNCTION TakeSal(empid number) RETURN NUMBER
IS
    SAL NUMBER;
BEGIN
    SELECT (salary + salary*NVL(commission_pct, 0))
    INTO SAL
    FROM employees
    WHERE employee_id = empid;
    return(SAL);
END TakeSal;    
/

DECLARE
    demo NUMBER;
BEGIN
    demo:=TakeSal(&empid);
    dbms_output.put_line(demo);
END;
