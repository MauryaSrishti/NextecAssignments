SET serveroutput ON;
SET verify OFF;

--create function to add two numbers
CREATE OR REPLACE FUNCTION MyAdd(x number, y number) RETURN NUMBER
IS
BEGIN
    return(x + y);
END MyAdd;    

DECLARE
    demo NUMBER;
BEGIN
    demo:=MyAdd(&num1, &num2);
    dbms_output.put_line(demo);
END;    