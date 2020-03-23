-- Challenge 1
SELECT id, username, created_at
FROM users
ORDER BY created_at
LIMIT 5;

-- Challenge 2
SELECT DAYNAME(created_at) AS Day, COUNT(*) AS 'registration_counts'
FROM users
GROUP BY DAYOFWEEK(created_at)
ORDER BY registration_counts DESC;

-- Challenge 3
SELECT users.id, username, users.created_at
FROM users
LEFT JOIN photos
	ON users.id = photos.user_id
WHERE photos.user_id IS NULL;

-- Challenge 4
SELECT photos.id AS photo_id, photos.user_id, users.username, COUNT(*) AS Likes
FROM photos
INNER JOIN likes
	ON photos.id = likes.photo_id
INNER JOIN users
	ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY Likes DESC
LIMIT 1;

-- Challenge 5
SELECT 
	(SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS 'average_posts_per_user';

-- Challenge 6
SELECT tags.id as TagID, tags.tag_name, COUNT(*) AS TotalCount
FROM tags
INNER JOIN photo_tags
	ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY TotalCount DESC
LIMIT 5;

-- Challenge 7
SELECT users.id, users.username, COUNT(*) AS num_likes
FROM users
INNER JOIN likes
	ON users.id = likes.user_id
GROUP BY users.id
HAVING num_likes = (SELECT COUNT(*) FROM photos);