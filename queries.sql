--LIMITS
SELECT *
FROM users
LIMIT 5;
--
--select username email and user_id
--
SELECT username,
    email,
    user_id
FROM users
LIMIT 5;
--
-- select user of id =250
--
SELECT username,
    email,
    user_id
FROM users
WHERE user_id = 250;
-- 
--last login is null
-- 
SELECT username,
    email,
    user_id
FROM users
WHERE last_login IS NULL
LIMIT 10;
-- 
--created before 6 months and last login is null
-- 
SELECT username,
    email,
    user_id
FROM users
WHERE last_login IS NULL
    AND created_on < NOW() - interval '6 months'
LIMIT 10;
--
--SORT by CREATED_ON
--
SELECT username,
    email,
    user_id,
    created_on
FROM users
ORDER BY created_on ASC
LIMIT 10;
-- descending order
SELECT username,
    email,
    user_id,
    created_on
FROM users
ORDER BY created_on DESC
LIMIT 10;
--
-- COUNT USER 
--
SELECT COUNT(*)
FROM users;
SELECT COUNT(last_login)
FROM users;
--
-- find Update
--
UPDATE users
SET last_login = NOW()
WHERE user_id = 1
RETURNING *;
--
--DELETE row
--
DELETE FROM users
WHERE user_id = 1000;
DELETE FROM users
WHERE user_id = 999
RETURNING *;