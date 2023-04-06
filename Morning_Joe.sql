

with cte as (SELECT 
d.*,
case
when regexp_extract(post_evar78, r"premium_experiment:variant1-v4") = "premium_experiment:variant1-v4"  then "premium_experiment:variant1-v4"
when regexp_extract(post_evar78, r"premium_experiment:control-v4") = "premium_experiment:control-v4" then "premium_experiment:control-v4" else null end as Experiments
FROM `nbcu-ds-sandbox-a-001.Shunchao_Sandbox.AB_Testing_draft_03` d
where lower(Binge_Details) like "%morning%joe%" and lower(post_evar78) like "%premium%experiment%v4%")

select adobe_date,device_name, Experiments, count(distinct adobe_tracking_id) as accts
from cte
group by 1,2,3
order by 1,2,4 desc;

# Account Mutiple Groups by Experiment Check
with cte as (SELECT 
d.*,
case
when regexp_extract(post_evar78, r"premium_experiment:variant1-v4") = "premium_experiment:variant1-v4"  then "premium_experiment:variant1-v4"
when regexp_extract(post_evar78, r"premium_experiment:control-v4") = "premium_experiment:control-v4" then "premium_experiment:control-v4" else null end as Experiments
FROM `nbcu-ds-sandbox-a-001.Shunchao_Sandbox.AB_Testing_draft`d
where lower(Binge_Details) like "%morning%joe%premium%" and lower(post_evar78) like "%premium%experiment%v4%")

select adobe_tracking_id, count(distinct Experiments) as accts
from cte
group by 1
order by 2 desc;
