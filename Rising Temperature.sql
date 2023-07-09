 with cte as (
   select id, temperature, extract(day from recordDate) as day,
  lag(temperature) over(order by recordDate) as prev_day_temp ,
  lag(recordDate) over(order by recordDate)as prev_day, recordDate
  from weather
  
)
select id 
from cte
where temperature > prev_day_temp and datediff(recordDate,prev_day ) = 1;
 
