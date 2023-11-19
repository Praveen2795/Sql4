with cte as (
  (select * from Matches)
  union all
  (select away_team_id as home_team_id, home_team_id as away_team_id, away_team_goals as home_team_goals, home_team_goals as away_team_goals from Matches)
),
cte1 as (
select
  home_team_id,
  count(home_team_id) as matches_played,
  sum(case
    when (home_team_goals) > (away_team_goals) then 3
    when (home_team_goals) = (away_team_goals) then 1
    else 0
  end) as points,
  sum(home_team_goals) as goal_for,
  sum(away_team_goals) as goal_against,
  sum(home_team_goals) - sum(away_team_goals) as goal_diff
from
  cte
group by
  home_team_id)

select Teams.team_name ,cte1.matches_played, cte1.points, cte1.goal_for, cte1.goal_against, cte1.goal_diff
from cte1
inner join Teams
on Teams.team_id = cte1.home_team_id
order by points desc, goal_diff desc, team_name

