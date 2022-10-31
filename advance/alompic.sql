CREATE DATABASE Follower;
SHOW DATABASES;
USE Follower;
CREATE TABLE Final_Follower(
	username char(20),
    month char(10),
    change_in_followers double,
    change_in_following double,
    post int
);

SELECT * FROM Final_Follower;

SELECT username, SUM(change_in_followers)
FROM Final_Follower
WHERE username = 'instagram'
GROUP BY username;

SELECT month, change_in_followers, SUM(change_in_followers) 
	OVER (ORDER BY month) AS running_change_in_followers
FROM Final_Follower
WHERE username = 'instagram'
ORDER BY username;

SELECT month, posts, MAX(posts) 
	OVER (PARTITION BY month) Max_for_that_month
FROM Final_Follower
ORDER BY month;
