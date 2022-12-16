-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

SELECT c.cf_id, c.backers_count 
FROM campaign AS c
WHERE (outcome = 'live')
ORDER BY c.backers_count DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

SELECT COUNT(b.backer_id), b.cf_id
FROM backers AS b
GROUP BY b.cf_id
ORDER BY COUNT(b.backer_id) DESC
;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT con.first_name, con.last_name, con.email, cam.goal, cam.pledged, (cam.goal - cam.pledged) AS "Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM contacts AS con
INNER JOIN campaign AS cam
ON (con.contact_id = cam.contact_id)
WHERE (cam.outcome = 'live')
ORDER BY "Remaining Goal Amount" DESC;

-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT con.email, con.first_name, con.last_name, cam.cf_id, cam.company_name, cam.description, 
cam.end_date, (cam.goal - cam.pledged) AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM contacts AS con
INNER JOIN campaign AS cam
ON (con.contact_id = cam.contact_id)
ORDER BY con.email DESC;


-- Check the table
SELECT * FROM email_backers_remaining_goal_amount

