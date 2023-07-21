select
    round(count(player_id) /  (select count(distinct player_id) from activity), 2) as fraction
from (
    select
        player_id,
        event_date,
        row_number() over (partition by player_id order by event_date asc) as login_rank,
        lead(event_date) over (partition by player_id order by event_date asc) as next_login
    from
        activity
) login_table
where 
 login_table.login_rank = 1 and
 login_table.next_login is not null and
 datediff(login_table.next_login, login_table.event_date) = 1
