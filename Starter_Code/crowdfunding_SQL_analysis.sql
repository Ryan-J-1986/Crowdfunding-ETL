-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id, backers_count
FROM campaign
WHERE outcome='live'
ORDER BY backers_count DESC;



-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT cf_id, COUNT(cf_id) as backercount
FROM backers
WHERE cf_id IN
('65','1572','563','968','1114','238','1911','948','910','2284','2882','3138','2488','2510')
GROUP BY cf_id
ORDER BY backercount DESC;



-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT cn.first_name, cn.last_name, cn.email, (cp.goal-cp.pledged) as "Remaining Goal Amount"
INTO email_contact_remaining_goal_amount
FROM campaign as cp
LEFT JOIN contacts as cn
ON cn.contact_id=cp.contact_id
WHERE cp.outcome='live'
ORDER BY "Remaining Goal Amount" DESC;




-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 



-- Check the table
SELECT b.email, b.first_name, b.last_name, b.cf_id, c.company_name, c.description, c.end_date, (c.goal-c.pledged) as "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM campaign as c
INNER JOIN backers as b
ON c.cf_id=b.cf_id
WHERE c.outcome='live'
ORDER BY b.last_name;


