select employee_id, last_name, salary, round(salary * 1.5) as "New Salary", round(salary * 1.5 - salary) "Increase"
from employees
/
