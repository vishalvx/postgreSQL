--
-- FOREIGN KEY
--
CREATE TABLE comments (
    comment_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    -- column_name : type :REFERENCES table(column REFERENCES) : if we delete user then comment also delete
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    board_id INT REFERENCES boards(board_id) ON DELETE CASCADE,
    comment TEXT NOT NULL,
    time TIMESTAMP
);
-- 
-- JOIN
-- 
SELECT comment_id,
    comments.user_id,
    username,
    time,
    --take first 20 latter of the comment and assign name as preview
    LEFT(comment, 20) AS preview
FROM comments
    INNER JOIN users ON users.user_id = comments.user_id --join table same field 
WHERE board_id = 39 -- select board_id = 39
;
-- 
-- NATURAL JOIN
-- 
SELECT comment_id,
    comments.user_id,
    username,
    time,
    --take first 20 latter of the comment and assign name as preview
    LEFT(comment, 20) AS preview
FROM comments NATURAL
    INNER JOIN users --find same field and join 
WHERE board_id = 39 -- select board_id = 39
;
--
--RUN QUERY Inside Query
--
SELECT comment_id,
    user_id,
    LEFT(comment, 20)
FROM comments
WHERE user_id = (
        --sub-query
        SELECT user_id
        from users
        WHERE full_name = 'Maynord Simonich'
    );
-- 
-- GROUP BY use for group data which having same value
--
SELECT boards.board_name,
    COUNT(*) AS comment_count
FROM -- join two table but collect all boards table data
    comments NATURAL
    RIGHT JOIN boards
GROUP BY --group data by board_name
    boards.board_name
ORDER BY -- sort by comment count
    comment_count DESC
LIMIT 10;