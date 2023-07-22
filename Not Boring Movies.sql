select x.odd_ids as id , x.movie,x.description,x.rating
from
(select movie, description, rating,
case 
    when id%2 <> 0 then id
    end as odd_ids
from cinema
where description <> 'boring' 
)x
where x.odd_ids is not null
order by x.rating desc

#see the extended comment
