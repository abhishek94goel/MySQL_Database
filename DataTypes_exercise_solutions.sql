SELECT CURTIME();
SELECT CURDATE();
SELECT CURDATE(), DAYOFWEEK(NOW());
SELECT CURDATE(), DAYNAME(CURDATE());

SELECT CONCAT(MONTH(NOW()), '/', DAY(NOW()), '/', YEAR(NOW()));
SELECT DATE_FORMAT(CURRENT_TIMESTAMP(), '%m/%d/%Y');

SELECT DATE_FORMAT(NOW(), '%M %D at %k:%i');

CREATE TABLE tweets(
content VARCHAR(140),
username VARCHAR(20),
created_at TIMESTAMP DEFAULT NOW());

DESC tweets;