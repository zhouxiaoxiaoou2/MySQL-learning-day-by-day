mysql -uroot -p******  -- start to use mysel

-- use 01-1 library schema.sql to create the database and all the tables we need in the library system (members, books, borrow_records)
-- use 01-2 insert example data.sql to insert the data into each table we create

SHOW tables; -- check the table after we create and insert data
DESCRIBE books; -- check the table structure of the table (id, name, price, author, etc)

SELECT*FROM borrow_records; -- check all the information in this table
SELECT*FROM members WHERE join_data > '2024-07-04'; -- check the specified information

UPDATE borrow_records
SET return_date = '2025-07-25'
WHERE record_id =1;  -- update information

DELETE FROM members WHERE member_id=1;  -- delete from the table

UPDATE mysql.user SET authentication_string = password('*****')
WHERE user='root' and Host ='localhost';
flush privileges;  -- update the user and password to use this database 
exit;
