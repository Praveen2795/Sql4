with cte1 as (select requester_id
from RequestAccepted
union all
select accepter_id
from RequestAccepted)

select requester_id as id, count(requester_id) as num
from cte1
group by requester_id
order by num desc
limit 1
