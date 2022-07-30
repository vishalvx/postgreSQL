--  Select json data
-- 
SELECT content
FROM rich_content;
--  Select json type
-- 
SELECT content->'type'
FROM rich_content;
--  Select json type
-- 
SELECT content->'type'
FROM rich_content;
--  
-- content ->> 'type' this convert automatic to text type 
-- CAST(   content->'type')
--
SELECT DISTINCT content->>'type' AS content_type
FROM rich_content;
--
SELECT content->'dimensions' AS content_type
FROM rich_content
WHERE content->'dimensions' IS NOT NULL;

--extract height width from json
SELECT content->'dimensions'->>'height' AS height,
content->'dimensions'->>'width' AS width
FROM rich_content
WHERE content->'dimensions' IS NOT NULL;