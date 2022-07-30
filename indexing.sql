--
-- FIND COST of query
--
EXPLAIN
SELECT comment_id,
    user_id,
    time,
    LEFT(comment, 20)
FROM comments
WHERE board_id = 39
ORDER BY time DESC
LIMIT 20;
--
--                               QUERY PLAN
-----------------------------------------------------------------------
--  Limit  (cost=65.75..65.78 rows=12 width=48)
--    ->  Sort  (cost=65.75..65.78 rows=12 width=48)
--          Sort Key: "time" DESC
--          ->  Seq Scan on comments  (cost=0.00..65.53 rows=12 width=48) --scaning take too much time
--                Filter: (board_id = 39)

--
-- ADD INDEX 
--
-- ADD index on board_id in comments because we are searching board_id in comments table 
CREATE INDEX ON comments (board_id);

-- -- AFTER DOING INDEXING WE GET
--                                            QUERY PLAN
-- -------------------------------------------------------------------------------------------------
--  Limit  (cost=33.73..33.76 rows=12 width=48)
--    ->  Sort  (cost=33.73..33.76 rows=12 width=48)
--          Sort Key: "time" DESC
--          ->  Bitmap Heap Scan on comments  (cost=4.37..33.51 rows=12 width=48)
--                Recheck Cond: (board_id = 39)
--                ->  Bitmap Index Scan on comments_board_id_idx  (cost=0.00..4.37 rows=12 width=0)
--                      Index Cond: (board_id = 39)