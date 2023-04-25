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

create or replace table `nbcu-ds-sandbox-a-001.Shunchao_Sandbox.AB_Testing_draft_02` as

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
and post_evar78 is not null
and DATE(timestamp(post_cust_hit_time_gmt), "America/New_York") between "2023-03-28" and "2023-03-30"

create or replace table `nbcu-ds-sandbox-a-001.Shunchao_Sandbox.AB_Testing_draft_03` as

SELECT 
post_evar56 as Adobe_Tracking_ID, 
DATE(timestamp(post_cust_hit_time_gmt), "America/New_York") AS Adobe_Date,
DATETIME(timestamp(post_cust_hit_time_gmt), "America/New_York") AS Adobe_Timestamp,
post_evar19 as Player_Event,
post_evar7 as Binge_Details,
post_evar37 as device_name, -- Device_Info from Clickstream
post_evar72 as Binge_From_Title,
post_evar28 as Binge_To_Full,
post_prop21 as Binge_To_ID,
post_evar78 -- AB Testing 
FROM `nbcu-ds-prod-001.feed.adobe_clickstream` 
WHERE post_evar56 is not null
and post_cust_hit_time_gmt is not null 
and post_evar78 is not null
and DATE(timestamp(post_cust_hit_time_gmt), "America/New_York") between "2023-03-28" and "2023-03-30"

--------------------------------------------2023-03-28 - 2023-04-24 -----------------------------------------------------------
create or replace table `nbcu-ds-sandbox-a-001.Shunchao_Sandbox.AB_Testing_draft_0425` as

SELECT 
post_evar56 as Adobe_Tracking_ID, 
DATE(timestamp(post_cust_hit_time_gmt), "America/New_York") AS Adobe_Date,
DATETIME(timestamp(post_cust_hit_time_gmt), "America/New_York") AS Adobe_Timestamp,
post_evar19 as Player_Event,
post_evar7 as Binge_Details,
post_evar37 as device_name, -- Device_Info from Clickstream
post_evar72 as Binge_From_Title,
post_evar28 as Binge_To_Full,
post_prop21 as Binge_To_ID,
post_evar78 -- AB Testing 
FROM `nbcu-ds-prod-001.feed.adobe_clickstream` 
WHERE post_evar56 is not null
and post_cust_hit_time_gmt is not null 
and lower(post_evar78) like "%premium%experiment%v4%"
and DATE(timestamp(post_cust_hit_time_gmt), "America/New_York") between "2023-03-28" and "2023-04-24"

