/*Find the 5 oldest users of the instagram*/
SELECT * FROM users
ORDER BY created_at
LIMIT 5;
/*who never posted a single photo in instagram*/
select username from users
left join photos on users.id=photos.user_id
where photos.id is null;

/*what day of the week most users registers on*/
SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC;

/* 5 most commonly used hashtags*/
SELECT tags.tag_name, 
       Count(*) AS total 
FROM   photo_tags 
       JOIN tags 
         ON photo_tags.tag_id = tags.id 
GROUP  BY tags.id 
ORDER  BY total DESC 
LIMIT  5; 

/*declaring the winner*/
select users.username, photos.id,photos.image_url,count(*) as total_likes
from likes
join photos on photos.id=likes.photo_id
join users on users.id=likes.photo_id
group by photos.id
order by total_likes desc;

/*avg time posting in instagram*/
SELECT ((SELECT COUNT(*) FROM Photos) / (SELECT COUNT(*) FROM Users));

/*liked every single post*/
SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos)