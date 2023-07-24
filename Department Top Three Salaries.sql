select x.dept as department , x.name as employee , x.salary
from
(select e.* , d.name as dept , 
dense_rank() over(partition by departmentId order by salary desc) as rnk
from employee e
join department d
on e.departmentId = d.id
order by salary desc
) x
where rnk <= 3


