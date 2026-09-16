# Write your MySQL query statement below
select * from (
    select
        visited_on,
        sum(sum(amount)) over(order by visited_on rows between 6 preceding and current row) as amount,
        round(avg(sum(amount))over(order by visited_on asc rows between 6 preceding and current row) 
        ,2) as average_amount
    from customer
    group by visited_on
) as q
where 
    datediff(visited_on,
                (select
                    min(visited_on)
                        from customer)) >= 6
order by visited_on asc;