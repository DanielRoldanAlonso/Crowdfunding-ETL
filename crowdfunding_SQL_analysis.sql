-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT * FROM backers
ORDER BY cf_id DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT * FROM backers


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT c.first_name,  
	c.last_name, 
	c.email, 
	cp.goal - cp.pledged as remaining_goal_amount
INTO email_contacts_remaining_goal_amount
FROM contacts AS c
	LEFT JOIN campaign AS cp
		ON (cp.contact_id = c.contact_id)
WHERE outcome = 'live'
ORDER BY remaining_goal_amount DESC;

-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT b.email, 
	b.first_name, 
	b.last_name, 
	c1.cf_id, 
	c1.company_name, 
	c1.description, 
	c1.end_date, 
	c1.goal - c1.pledged as left_of_goal
INTO email_backers_remaining_goal_amount
FROM backers AS b
	LEFT JOIN campaign AS c1
		ON (c1.cf_id = b.cf_id)
WHERE outcome = 'live'
ORDER BY last_name ASC;

-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;

