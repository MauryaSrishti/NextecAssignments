select last_name as "Employee", salary as "MonthlySalary" from employees
where salary between 5000 and 12000 AND department_id in (20, 50)
/
