select job_id, ROUND(MAX(salary)) MAXIMUM, ROUND(MIN(SALARY)) MINIMUM, ROUND(SUM(SALARY)) SUM, ROUND(AVG(SALARY)) AVERAGE
from employees
group by job_id
/
