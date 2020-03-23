USE tv_review_app;

-- Challenge 1
SELECT title, rating FROM series
INNER JOIN reviews
ON series.id = reviews.series_id;

-- Challenge 2
SELECT title, AVG(rating) AS 'avg_rating'
FROM series
INNER JOIN reviews
ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY avg_rating;

-- Challenge 3
SELECT first_name, last_name, rating
FROM reviewers
INNER JOIN reviews
ON reviews.reviewer_id = reviewers.id;

-- Challenge 4
SELECT title  AS unreviewed_series
FROM series
LEFT JOIN reviews
	ON series.id = reviews.series_id
WHERE reviews.rating IS NULL;

-- Challenge 5
SELECT series.genre, AVG(reviews.rating) AS avg_rating
FROM series
INNER JOIN reviews
	ON series.id = reviews.series_id
GROUP BY series.genre;

-- Challenge 6
SELECT first_name, last_name, COUNT(rating) AS 'COUNT', IFNULL(MIN(rating),0) AS 'MIN',
	   IFNULL(MAX(rating),0) AS 'MAX', IFNULL(AVG(rating),0) AS 'AVG',
	   CASE
	   	WHEN COUNT(rating) >= 1 THEN 'ACTIVE'
		ELSE 'INACTIVE'
	   END AS 'STATUS'
FROM reviewers
LEFT JOIN reviews
	ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;

-- Challenge 7
SELECT title, rating, CONCAT_WS(' ', first_name,last_name) AS reviewer
FROM series
INNER JOIN reviews
	ON series.id = reviews.series_id
INNER JOIN reviewers
	ON reviewer_id = reviewers.id
ORDER BY title;