select employee_id, last_name  from employees
where department_id IN (select department_id from employees
where last_name LIKE '%u%')
/
