# Write your MySQL query statement below
delete id1
from person as id1
inner join person as id2
    on id1.email = id2.email
where id1.id > id2.id
;