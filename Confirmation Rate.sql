select x.user_id, round(avg(x.value) , 2) as confirmation_rate
from
(select s.user_id , c.action,
case 
    when c.action = 'confirmed' then 1
    else 0
end as value
from signups s 
left join confirmations c
on s.user_id = c.user_id) x
group by x.user_id 
