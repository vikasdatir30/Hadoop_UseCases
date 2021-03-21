use  sample; 

drop table if exists emp_table;  

create table emp_table (
emp_id int ,  
fname varchar(20), 
lname varchar(20), 
email varchar(30), 
contact varchar(30), 
hire_date date, 
job_id varchar(30), 
salary decimal(10,2),
comm_pct decimal(10,8), 
manager_id  int , 
dept_id  int )
row format serde 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties ( 
'separatorChar' = '\t',  
'quoteChar'  =  '"'
    )
stored as textfile
location   '/test/sample/emp_table';



select * from emp_table;

-----------------------------------------------
Note : 
4 - Limitations
This SerDe:
does not handle embedded newlines.
treats all columns to be of type String. Even if you create a table with non-string column types using this SerDe, 
the DESCRIBE TABLE output would show string column type. To convert columns to the desired type in a table, 
you can create a view over the table that does the CAST to the desired type.
