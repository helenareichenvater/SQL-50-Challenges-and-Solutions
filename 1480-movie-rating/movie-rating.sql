# Write your MySQL query statement below
with mostratings as
(
    select
    u.name
    from users as u
        join movierating as mr
            on mr.user_id = u.user_id
    group by u.name
    order by count(mr.rating) desc, u.name asc
    limit 1
),

highestavgrating as
(
    select
    m.title
    from movies as m
        join movierating as mr
            on mr.movie_id = m.movie_id
    where mr.created_at between '2020-02-01' and '2020-02-29'
    group by m.title
    order by avg(mr.rating) desc, m.title asc
    limit 1

)

select name as results
from mostratings
union all
select title
from highestavgrating
;