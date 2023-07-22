
select distinct(y.person_name)
from
(select 
last_value(x.person_name) over(order by x.c_sum
              range between unbounded preceding AND unbounded following) as person_name
from
(select *, 
sum(weight) over(order by turn) as c_sum
from queue
order by turn
) x
where x.c_sum <= 1000
) y
