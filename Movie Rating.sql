(select x.name as results 
from
(select u.name , count(*) as total
from movierating mr
join users u 
on mr.user_id = u.user_id
group by mr.user_id

) x
order by x.total desc , x.name
Limit 1
)
union all

(select y.title
from (
select m.title , avg(rating) as rating
from movierating mr
join movies m 
on mr.movie_id = m.movie_id 
where extract(month from mr.created_at) = 2
group by m.title
) y
order by y.rating desc , y.title
limit 1
)
