with cte1 as (select *, sum(salary) over(partition by experience order by salary) as cum_sum
from candidates)

select 'Senior' as experience, count(employee_id) as accepted_candidates
from cte1 
where experience = 'Senior'
and 
cum_sum <= 70000 
union all
select 'Junior' as experience, count(employee_id) as accepted_candidates
from cte1
where experience = 'Junior'
and 
cum_sum <= 70000-(select ifnull(max(cum_sum),0) 
                  from cte1 
                  where experience = 'Senior'
                  and cum_sum <= 70000)




