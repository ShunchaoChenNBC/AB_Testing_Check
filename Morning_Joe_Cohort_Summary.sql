with mj as (select adobe_tracking_id,
variant
from  `nbcu-ds-sandbox-a-001.ab_userlists.morning_news_userlist`
where DATE(timestamp(bucketed_timestamp), "America/New_York") between "2023-03-21" and "2023-03-28"),

cte1 as (
select adobe_tracking_id,
adobe_date,
display_name,
num_seconds_played_no_ads
from `nbcu-ds-prod-001.PeacockDataMartSilver.SILVER_VIDEO` sv
where adobe_date between "2023-03-28" and "2023-04-24" 
and lower(display_name) not like "%trailer%" 
and num_seconds_played_no_ads > 300 -- qualifier
and adobe_tracking_id in (select distinct adobe_tracking_id from mj)
),

cte2 as (
select adobe_tracking_id,
count(distinct adobe_date) as Days,
count(distinct display_name) as Repertoires,
round(sum(num_seconds_played_no_ads)/3600,2) as Watched_Hours
from cte1
group by 1
)


select variant, 
round(AVG(Days),2) as Avg_Days_Watched, 
round(AVG(Watched_Hours),2) as Avg_Hours_Watched, 
round(AVG(Repertoires),2) as Avg_Repertoires_Numbers
from cte2
left join mj on cte2.adobe_tracking_id = mj.adobe_tracking_id
group by 1
