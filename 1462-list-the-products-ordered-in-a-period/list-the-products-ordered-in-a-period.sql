# Write your MySQL query statement below
select
p.product_name,
sum(o.unit) as unit
from products as p
    inner join orders as o
    on o.product_id = p.product_id
where
    o.order_date like '2020-02%'
group by
    p.product_name
having
    sum(o.unit) >= 100
;