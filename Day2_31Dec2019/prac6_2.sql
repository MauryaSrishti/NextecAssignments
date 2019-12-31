select e.last_name employee, e.employee_id "emp#", m.last_name manager, m.manager_id "mgr#"
from employees e
left outer join employees m on e.manager_id = m.employee_id
/
