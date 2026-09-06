-- Tech Advertising Campaign Performance & ROI Analytics
-- SQL analysis file generated from the actual dataset
-- Dataset rows: 10,000
-- Dataset columns: 41

CREATE DATABASE IF NOT EXISTS advertising_analytics;
USE advertising_analytics;

-- Main table
DROP TABLE IF EXISTS advertising_campaigns;
CREATE TABLE advertising_campaigns (
    `campaign_id` VARCHAR(255),
    `campaign_objective` VARCHAR(255),
    `platform` VARCHAR(255),
    `ad_placement` VARCHAR(255),
    `device_type` VARCHAR(255),
    `operating_system` VARCHAR(255),
    `creative_format` VARCHAR(255),
    `creative_size` VARCHAR(255),
    `ad_copy_length` VARCHAR(255),
    `has_call_to_action` BOOLEAN,
    `creative_emotion` VARCHAR(255),
    `creative_age_days` BIGINT,
    `target_audience_age` VARCHAR(255),
    `target_audience_gender` VARCHAR(255),
    `audience_interest_category` VARCHAR(255),
    `income_bracket` VARCHAR(255),
    `purchase_intent_score` VARCHAR(255),
    `retargeting_flag` BOOLEAN,
    `start_date` VARCHAR(255),
    `quarter` BIGINT,
    `day_of_week` VARCHAR(255),
    `hour_of_day` BIGINT,
    `campaign_day` BIGINT,
    `quality_score` BIGINT,
    `actual_cpc` DOUBLE,
    `impressions` BIGINT,
    `clicks` BIGINT,
    `conversions` BIGINT,
    `ad_spend` DOUBLE,
    `revenue` DOUBLE,
    `bounce_rate` DOUBLE,
    `avg_session_duration_seconds` BIGINT,
    `pages_per_session` DOUBLE,
    `industry_vertical` VARCHAR(255),
    `budget_tier` VARCHAR(255),
    `ctr` DOUBLE,
    `cpc` DOUBLE,
    `conversion_rate` DOUBLE,
    `cpa` DOUBLE,
    `roas` DOUBLE,
    `profit` DOUBLE
);

-- Import the CSV using your SQL client's CSV import feature.
-- Example for MySQL: adjust the file path and LOCAL INFILE settings as needed.
-- LOAD DATA LOCAL INFILE 'tech_advertising_campaigns_dataset.csv'
-- INTO TABLE advertising_campaigns
-- FIELDS TERMINATED BY ',' ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- ================================================================
-- 1. DATASET OVERVIEW
-- ================================================================
SELECT COUNT(*) AS total_rows FROM advertising_campaigns;
SELECT COUNT(DISTINCT campaign_id) AS unique_campaigns FROM advertising_campaigns;

-- ================================================================
-- 2. OVERALL KPIs
-- ================================================================
SELECT
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,
    SUM(conversions) AS total_conversions,
    SUM(ad_spend) AS total_spend,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit,
    SUM(clicks) / NULLIF(SUM(impressions), 0) AS ctr,
    SUM(conversions) / NULLIF(SUM(clicks), 0) AS conversion_rate,
    SUM(ad_spend) / NULLIF(SUM(conversions), 0) AS cpa,
    SUM(revenue) / NULLIF(SUM(ad_spend), 0) AS roas
FROM advertising_campaigns;

-- ================================================================
-- 3. PLATFORM PERFORMANCE
-- ================================================================
SELECT
    platform,
    COUNT(*) AS campaigns,
    SUM(impressions) AS impressions,
    SUM(clicks) AS clicks,
    SUM(conversions) AS conversions,
    SUM(ad_spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(clicks) / NULLIF(SUM(impressions), 0) AS ctr,
    SUM(conversions) / NULLIF(SUM(clicks), 0) AS conversion_rate,
    SUM(ad_spend) / NULLIF(SUM(conversions), 0) AS cpa,
    SUM(revenue) / NULLIF(SUM(ad_spend), 0) AS roas
FROM advertising_campaigns
GROUP BY platform
ORDER BY roas DESC;

-- ================================================================
-- 4. CAMPAIGN OBJECTIVE PERFORMANCE
-- ================================================================
SELECT
    campaign_objective,
    COUNT(*) AS campaigns,
    SUM(ad_spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(conversions) AS conversions,
    SUM(revenue) / NULLIF(SUM(ad_spend), 0) AS roas
FROM advertising_campaigns
GROUP BY campaign_objective
ORDER BY profit DESC;

-- ================================================================
-- 5. AUDIENCE PERFORMANCE
-- ================================================================
-- target_audience_age
SELECT
    `target_audience_age` AS segment,
    COUNT(*) AS campaigns,
    SUM(ad_spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(conversions) AS conversions,
    SUM(revenue) / NULLIF(SUM(ad_spend), 0) AS roas
FROM advertising_campaigns
GROUP BY `target_audience_age`
ORDER BY profit DESC;

-- target_audience_gender
SELECT
    `target_audience_gender` AS segment,
    COUNT(*) AS campaigns,
    SUM(ad_spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(conversions) AS conversions,
    SUM(revenue) / NULLIF(SUM(ad_spend), 0) AS roas
FROM advertising_campaigns
GROUP BY `target_audience_gender`
ORDER BY profit DESC;

-- audience_interest_category
SELECT
    `audience_interest_category` AS segment,
    COUNT(*) AS campaigns,
    SUM(ad_spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(conversions) AS conversions,
    SUM(revenue) / NULLIF(SUM(ad_spend), 0) AS roas
FROM advertising_campaigns
GROUP BY `audience_interest_category`
ORDER BY profit DESC;

-- income_bracket
SELECT
    `income_bracket` AS segment,
    COUNT(*) AS campaigns,
    SUM(ad_spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(conversions) AS conversions,
    SUM(revenue) / NULLIF(SUM(ad_spend), 0) AS roas
FROM advertising_campaigns
GROUP BY `income_bracket`
ORDER BY profit DESC;

-- ================================================================
-- 6. DEVICE PERFORMANCE
-- ================================================================
SELECT
    device_type,
    COUNT(*) AS campaigns,
    SUM(ad_spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(conversions) AS conversions,
    SUM(revenue) / NULLIF(SUM(ad_spend), 0) AS roas
FROM advertising_campaigns
GROUP BY device_type
ORDER BY roas DESC;

-- ================================================================
-- 7. AD PLACEMENT PERFORMANCE
-- ================================================================
SELECT
    ad_placement,
    COUNT(*) AS campaigns,
    SUM(ad_spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(conversions) AS conversions,
    SUM(revenue) / NULLIF(SUM(ad_spend), 0) AS roas
FROM advertising_campaigns
GROUP BY ad_placement
ORDER BY roas DESC;

-- ================================================================
-- 8. CREATIVE PERFORMANCE
-- ================================================================
-- creative_format
SELECT
    `creative_format` AS creative_attribute,
    COUNT(*) AS campaigns,
    SUM(ad_spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(conversions) AS conversions,
    SUM(revenue) / NULLIF(SUM(ad_spend), 0) AS roas
FROM advertising_campaigns
GROUP BY `creative_format`
ORDER BY roas DESC;

-- creative_size
SELECT
    `creative_size` AS creative_attribute,
    COUNT(*) AS campaigns,
    SUM(ad_spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(conversions) AS conversions,
    SUM(revenue) / NULLIF(SUM(ad_spend), 0) AS roas
FROM advertising_campaigns
GROUP BY `creative_size`
ORDER BY roas DESC;

-- creative_emotion
SELECT
    `creative_emotion` AS creative_attribute,
    COUNT(*) AS campaigns,
    SUM(ad_spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(conversions) AS conversions,
    SUM(revenue) / NULLIF(SUM(ad_spend), 0) AS roas
FROM advertising_campaigns
GROUP BY `creative_emotion`
ORDER BY roas DESC;

-- ad_copy_length
SELECT
    `ad_copy_length` AS creative_attribute,
    COUNT(*) AS campaigns,
    SUM(ad_spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(conversions) AS conversions,
    SUM(revenue) / NULLIF(SUM(ad_spend), 0) AS roas
FROM advertising_campaigns
GROUP BY `ad_copy_length`
ORDER BY roas DESC;

-- has_call_to_action
SELECT
    `has_call_to_action` AS creative_attribute,
    COUNT(*) AS campaigns,
    SUM(ad_spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(conversions) AS conversions,
    SUM(revenue) / NULLIF(SUM(ad_spend), 0) AS roas
FROM advertising_campaigns
GROUP BY `has_call_to_action`
ORDER BY roas DESC;

-- ================================================================
-- 9. TIME PERFORMANCE
-- ================================================================
-- quarter
SELECT
    `quarter` AS time_period,
    COUNT(*) AS campaigns,
    SUM(ad_spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(conversions) AS conversions,
    SUM(revenue) / NULLIF(SUM(ad_spend), 0) AS roas
FROM advertising_campaigns
GROUP BY `quarter`
ORDER BY profit DESC;

-- day_of_week
SELECT
    `day_of_week` AS time_period,
    COUNT(*) AS campaigns,
    SUM(ad_spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(conversions) AS conversions,
    SUM(revenue) / NULLIF(SUM(ad_spend), 0) AS roas
FROM advertising_campaigns
GROUP BY `day_of_week`
ORDER BY profit DESC;

-- hour_of_day
SELECT
    `hour_of_day` AS time_period,
    COUNT(*) AS campaigns,
    SUM(ad_spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(conversions) AS conversions,
    SUM(revenue) / NULLIF(SUM(ad_spend), 0) AS roas
FROM advertising_campaigns
GROUP BY `hour_of_day`
ORDER BY profit DESC;

-- ================================================================
-- 10. TOP 10 CAMPAIGNS BY PROFIT
-- ================================================================
SELECT
    campaign_id,
    platform,
    campaign_objective,
    ad_spend,
    revenue,
    ROAS,
    profit
FROM advertising_campaigns
ORDER BY profit DESC
LIMIT 10;

-- ================================================================
-- 11. TOP 10 CAMPAIGNS BY ROAS
-- ================================================================
SELECT
    campaign_id,
    platform,
    campaign_objective,
    ad_spend,
    revenue,
    ROAS,
    profit
FROM advertising_campaigns
WHERE ad_spend > 0
ORDER BY ROAS DESC
LIMIT 10;

-- ================================================================
-- 12. LOSS-MAKING CAMPAIGNS
-- ================================================================
SELECT
    campaign_id,
    platform,
    campaign_objective,
    ad_spend,
    revenue,
    ROAS,
    profit
FROM advertising_campaigns
WHERE profit < 0
ORDER BY profit ASC;

-- ================================================================
-- 13. LOSS-MAKING SUMMARY
-- ================================================================
SELECT
    COUNT(*) AS loss_making_campaigns,
    SUM(ad_spend) AS loss_campaign_spend,
    SUM(profit) AS total_loss
FROM advertising_campaigns
WHERE profit < 0;

-- ================================================================
-- 14. QUALITY CHECKS
-- ================================================================
SELECT
    SUM(CASE WHEN campaign_id IS NULL THEN 1 ELSE 0 END) AS null_campaign_ids,
    SUM(CASE WHEN ad_spend IS NULL THEN 1 ELSE 0 END) AS null_spend,
    SUM(CASE WHEN revenue IS NULL THEN 1 ELSE 0 END) AS null_revenue,
    SUM(CASE WHEN profit IS NULL THEN 1 ELSE 0 END) AS null_profit
FROM advertising_campaigns;

-- ================================================================
-- END
-- ================================================================