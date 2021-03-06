--Contains a list of Sybase quary examples

--1)
-- Script for removing duplicate entries in a table
-- Finds the duplicate entries based on col2 and delete the entry 
-- with MAX value for col1.
delete 
from my_table
where col1 IN (
select MAX(col1)
from my_table
where col2 IN ( select col2
	from my_table
	group by col2 having count(col2) > 1)
)
and col2 IN ( select col2
	from my_table
	group by col2 having count(col2) > 1
)

--2) Viewing table details
Catalog stored procedure calls (CSPs)

sp_tables:
exec sp_tables '%', 'dbo', 'master', "'TABLE'" 
exec sp_tables '%tablename%', 'dbo', 'master', "'TABLE | VIEW | SYSTEM TABLE | ALIAS'" 

--References:
--1) http://infocenter.sybase.com/help/index.jsp?topic=/com.sybase.infocenter.dc36525_1500/html/mfcig/CIHJEBIE.htm
--2) http://razorsql.com/articles/sybase_admin_queries.html

--3) Creating temporery tables
CREATE TABLE tempdb..tmp_table_name (
	col1 int,
	col2 varchar(10)
)

INSERT INTO tempdb..tmp_table_name
SELECT *
FROM tableA

-- or

SELECT *
INTO #tmp_table_name
FROM tableA

-- First option the table will remain even after the currnet connection is closed.
-- Whereas in the second method the temporery table will exist only during the connection.