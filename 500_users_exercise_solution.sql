-- Question 1
SELECT DATE_FORMAT(created_at,'%M %D %Y') AS earliest_date
FROM users
ORDER BY created_at
LIMIT 1;
-- OR
SELECT DATE_FORMAT(MIN(created_at), '%M %D %Y') AS earliest_date
FROM users;

-- Question 2
SELECT email, created_at
FROM users
ORDER BY created_at
LIMIT 1;
-- OR
SELECT email, created_at
FROM users
WHERE created_at = (SELECT MIN(created_at) 
					FROM users);

-- Question 3
SELECT MONTHNAME(created_at) AS month, COUNT(*) AS join_count
FROM users
GROUP BY MONTHNAME(created_at)
ORDER BY join_count DESC;
-- OR
SELECT MONTHNAME(created_at) AS month, COUNT(*) AS join_count
FROM users
GROUP BY month
ORDER BY join_count DESC;

-- Question 4
SELECT COUNT(*) AS 'Yahoo_users'
FROM users 
WHERE email LIKE '%@yahoo%';

-- Question 5
SELECT
	CASE
		WHEN email LIKE '%@gmail%' THEN 'GMAIL'
		WHEN email LIKE '%@yahoo%' THEN 'YAHOO'
		WHEN email LIKE '%hotmail%' THEN 'HOTMAIL'
		ELSE 'OTHER'
	END AS provider ,
	COUNT(*) AS total_users
FROM users
GROUP BY provider
ORDER BY total_users DESC;