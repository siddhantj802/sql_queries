with cte as (
  select count(user_id) as total
  from users
)
select * from 
(select distinct(contest_id) , round(count(user_id)*100 / total , 2) as percentage 
from register
join cte
group by contest_id
) x 
order by x.percentage desc, contest_id asc 
