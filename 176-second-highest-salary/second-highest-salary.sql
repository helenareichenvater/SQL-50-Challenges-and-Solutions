# Write your MySQL query statement below
select
(
    select distinct salary
        from
            (
            select
                salary,
                    dense_rank() over(order by salary desc) as salary_rank
    from employee
) as salaryrankings
where salary_rank = 2
) as SecondHighestSalary
;