set serveroutput on;

--Composite types
 DECLARE
    TYPE emp_record_type IS RECORD(
        last_name varchar2(25),
        job_id varchar2(10),
        salary number(8,2));
        
        emp_record_var emp_record_type;
        
BEGIN
    select last_name, job_id, salary
    INTO emp_record_var
    from employees
    where employee_id = &empid;
    
    DBMS_OUTPUT.PUT_LINE(emp_record_var.last_name||' '||emp_record_var.job_id||' '||emp_record_var.salary);
    
END;

--dynamic record fields
 DECLARE
    emp_record_var employees%ROWTYPE;
        
BEGIN
    select *
    INTO emp_record_var
    from employees
    where employee_id = &empid;
    
    DBMS_OUTPUT.PUT_LINE(emp_record_var.last_name||' '||emp_record_var.job_id||' '||emp_record_var.salary);
    
END;

--table type
declare
    type num_tab_type is table of employees.last_name%type
    index by binary_integer;
    
    num_tab num_tab_type;
begin
    for i in 100..109
    loop
        select last_name
        Into num_tab(i)
        from employees
        where employee_id = i;
    end loop;
    
    for i in num_tab.first..num_tab.last
    loop
        dbms_output.put_line(num_tab(i));
    end loop;    
end;    

--table type
declare
    TYPE emp_record_type IS RECORD(
        last_name employees.last_name%type,
        salary employees.salary%type);
        
    type num_tab IS TABLE OF emp_record_type
    index by binary_integer;
    
    num_tab_var num_tab;
begin
    for i in 100..109 
    loop 
        select last_name, salary
        INTO num_tab_var(i)
        from employees
        where employee_id = i;
        DBMS_OUTPUT.PUT_LINE(num_tab_var(i).last_name||' '||num_tab_var(i).salary);
    end loop;    
end;    