create or replace table `nbcu-ds-sandbox-a-001.Shunchao_Sandbox.AB_Testing_draft` as

SELECT 
post_evar56 as Adobe_Tracking_ID, 
DATE(timestamp(post_cust_hit_time_gmt), "America/New_York") AS Adobe_Date,
DATETIME(timestamp(post_cust_hit_time_gmt), "America/New_York") AS Adobe_Timestamp,
post_evar19 as Player_Event,
post_evar7 as Binge_Details,
post_evar37 as device_name, -- Device_Info from Clickstream
post_evar78 -- AB Testing 
FROM `nbcu-ds-prod-001.feed.adobe_clickstream` 
WHERE post_evar56 is not null
and post_cust_hit_time_gmt is not null 
and post_evar7 is not null
and post_evar7 not like "%display"
and post_evar56 is not null
and DATE(timestamp(post_cust_hit_time_gmt), "America/New_York") = "2023-03-28"

