select emp.name , bo.bonus
from employee emp
left join bonus bo
on emp.empId = bo.empId
 where bo.bonus < 1000 or bo.bonus is null
