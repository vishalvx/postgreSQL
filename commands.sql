--{resource }   https://btholt.github.io/complete-intro-to-databases/


--[[[[create Database]]]]
CREATE DATABASE db_name;
-- [CREATE TABLE]
--datatypes : https://www.postgresql.org/docs/current/datatype.html
CREATE TABLE users (
    --field ( column ) type option 
    --field_name ( column_name ) : type : primary key : auto increment value  
    user_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    --field_name ( column_name ) : type : it wiil unique : Not null  
    username VARCHAR (20) UNIQUE NOT NULL,
    email VARCHAR (30) UNIQUE NOT NULL,
    full_name VARCHAR (100) NOT NULL,
    last_login TIMESTAMP,
    create_on TIMESTAMP NOT NULL
);
--[Insert Data in table] 
-- INSERT INTO table_name(column1, column2, …) VALUES (value1, value2, …);
--now() is fn in psql
INSERT INTO users (username, email, full_name, create_on)
VALUES (
        'vishalvx',
        'vx@vx.com',
        'Vishal Prajapati',
        NOW()
    );
--Table show
-- SELECT col_name from table_name;
SELECT *
FROM users;
-- RENAME COLUMN name
-- ALTER TABLE table_name RENAME COLUMN column_name TO new_column_name;
ALTER TABLE users
    RENAME COLUMN first_name TO email;