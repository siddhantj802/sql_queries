select distinct(num) as consecutiveNums
from
(select * , 
lead(num ,1) over(order by id) as nxt ,
lead(num , 2) over(order by id) as nxttonxt
from Logs 
order by id ) x
where x.num = x.nxt and x.num = x.nxttonxt

# see the extended comment
