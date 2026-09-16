with mostrequests as
    (
        select
            requester_id as id,
            count(requester_id) as cnt
        from 
            requestaccepted
        group by requester_id
    )
    ,
mostaccepts as
    (
        select
            accepter_id as id,
            count(accepter_id) as cnt
        from
            requestaccepted
        group by accepter_id
    )
    ,
allfriends as
    (
        select
        id,
        cnt
        from mostrequests
        union all
        select
        id,
        cnt
        from mostaccepts        
    )    
select
    id,
    sum(cnt) as num
from
    allfriends
group by
    id
order by
    num desc
limit 1