create database project_2;
use project_2;
select * from account;
select * from lead_table;
select * from oppertunity_table;
select * from oppertunity_product;
select * from user_table;

## Lead Kpis
select count('lead id') as 'Total lead' from lead_table;

#select l.('lead id'),o.sum('Expected Amount') as 'Expected Amount' from Oppertunity_table o
select sum('Expected Amount') from oppertunity_table;

drop database project_2;
create database Project_2;
use project_2;
drop table account;
select * from account;
select * from lead_table;







    select round(count(case when status="converted" then 1 end)*100 /count(lead_id),2) as
'convertion Ratio' from lead_table;
select converted from lead_table;

SELECT 
    ROUND(
        (COUNT(CASE WHEN converted = 'true' THEN 1 END) * 100.0) 
        / COUNT(*), 
        2
    ) AS conversion_rate_percentage
FROM 
    lead_table;
    
    SELECT 
    COUNT('Converted_ Account _ID') AS converted_accounts
FROM 
    lead_table
WHERE 
    Converted ="True";
    SELECT 
    COUNT( l.`converted_opportunity_id`) AS Converted_Opportunities
FROM 
    lead_table l
JOIN 
    oppertuninty_table o
ON 
    l.`converted_opportunity_id` = o.Opportunity_ID
WHERE 
    l.converted = 'true'
    AND l.`converted_opportunity_id` IS NOT NULL;
    
    SELECT 
    industry,
    COUNT(*) AS total_leads
FROM 
    lead_table
GROUP BY 
    industry
ORDER BY 
    total_leads DESC;

    
    
    SELECT 
    status,
    COUNT(*) AS total_leads
FROM 
    lead_table
GROUP BY 
    status
ORDER BY 
    total_leads DESC;
    
    SELECT 
    Lead_Source,
    COUNT(*) AS total_leads
FROM 
    lead_table
GROUP BY 
    Lead_Source
ORDER BY 
    total_leads DESC;
    
    SELECT 
    round(sum(`expected_amount`),2) AS total_expected_amount
FROM 
    oppertuninty_table;
