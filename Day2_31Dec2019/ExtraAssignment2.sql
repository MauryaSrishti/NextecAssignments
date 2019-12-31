select last_name, hire_date, to_char(hire_date, 'Day') day from employees
order by to_char(hire_date - 1, 'd')
/
