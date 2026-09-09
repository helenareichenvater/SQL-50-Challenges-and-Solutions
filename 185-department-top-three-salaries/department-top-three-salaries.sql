# Write your MySQL query statement below
with top_employee as (
select 
    d.Id,
    e.salary,
    e.name as employee,
    e.departmentId,
    d.name as department,
    dense_rank() over(partition by e.departmentid order by e.salary desc) as salary_rank
        from
            employee as e
        left join
            department as d
                on e.departmentId = d.id
)
select
    department,
    employee,
    Salary
from top_employee
where salary_rank <=3
order by department, salary desc
;