use p888crmanalytics;
select * from opportunitytable;

-- kpi 1 Exected Amount
SELECT sum(Expected_Amount) AS total_Expected_amount 
FROM opportunitytable;

-- kpi 2 total Open opportunity
SELECT COUNT(*) AS total_opportunities 
FROM opportunitytable
where closed = 'false';

-- KPI3 Conversion Rate%
SELECT 
    (SUM(CASE WHEN Stage = 'Closed Won' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS conversion_rate_percentage
FROM Opportunitytable;

-- KPI 4 Win Rate%
SELECT 
    (SUM(CASE WHEN Stage = 'Closed Won' THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN Stage IN ('Closed Won', 'Closed Lost') 
    THEN 1 ELSE 0 END)) AS win_rate_percentage
FROM Opportunitytable;

-- KPI 5 Loss Rate%
SELECT 
    (SUM(CASE WHEN Stage = 'Closed Lost' THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN Stage IN ('Closed Won', 'Closed Lost')
    THEN 1 ELSE 0 END)) AS loss_rate_percentage
FROM Opportunitytable;

-- KPI 6 Trend Analysis
-- KPI 6.1 Epeced amount vs Forecast
SELECT 
SUM(Expected_Amount) AS total_expected_amount, 
    SUM(CASE WHEN Forecast_Category1 = 'Commit' THEN Amount ELSE 0 END) AS total_forecast_amount
FROM opportunitytable;
-- KPI 6.2 Active Opportunit vs Total Opportunity
SELECT 
    COUNT(*) AS total_opportunities,
    SUM(CASE WHEN Stage NOT IN ('Closed Won', 'Closed Lost') THEN 1 ELSE 0 END) AS active_opportunities
FROM opportunitytable;

-- KPI 6.3 closed won vs Total Opportunty
SELECT 
    COUNT(*) AS total_opportunities,
    SUM(CASE WHEN Stage = 'Closed Won' THEN 1 ELSE 0 END) AS closed_won_opportunities
FROM opportunitytable;

-- KPI 6.4 Total closed vs losed won
SELECT 
    COUNT(*) AS total_closed_opportunities,
    SUM(CASE WHEN Stage = 'Closed Won' THEN 1 ELSE 0 END) AS closed_won_opportunities
FROM opportunitytable
WHERE Stage IN ('Closed Won', 'Closed Lost');

-- Kpi 7 expected Amount by opportunity type
SELECT opportunity_type, SUM(coalesce(Expected_Amount)) AS Eamount_by_opportunity_T
FROM opportunitytable
GROUP BY Opportunity_Type
ORDER BY Eamount_by_opportunity_T DESC;

-- KPI -8 Opportunity by industry
SELECT industry, COUNT(Opportunity_ID) AS Opportunity_by_industry
FROM opportunitytable
GROUP BY industry
Order BY Opportunity_by_industry desc;	



