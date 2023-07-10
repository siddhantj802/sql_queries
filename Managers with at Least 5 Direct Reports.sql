select distinct(x.name)

from 
( select emp1.id , emp1.name , emp2.managerId,
row_number() over(partition by managerId order by id) as rn
from employee emp1
join employee emp2 
on emp1.id = emp2.managerId
) x 

where x.rn >= 5
