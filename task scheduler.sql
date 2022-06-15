create or replace TASK mytask_minute1
WAREHOUSE = COMPUTE_WH,
SCHEDULE = 'USING CRON  0 0 * * */THU Asia/Kolkata'
AS 
 copy into CAPTAIN.public.Table_Heart
from (select t.$1 , t.$2 , t.$3 ,t.$4 , t.$5 ,t.$6,t.$7 , t.$8 , t.$9 ,t.$10 , t.$11 ,t.$12,t.$13 , t.$14 , t.$15 ,t.$16 , t.$17 ,t.$18, t.$19 from  @CAPTAIN.public.External_stage t)
on_error = 'skip_file'
file_format = my_csv_format;

alter task mytask_minute1 resume;

alter task mytask_minute suspend;


SHOW TASKS;

SELECT * from Mytable_one;