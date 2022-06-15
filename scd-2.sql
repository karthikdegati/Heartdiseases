


/***** scd2*******/


create or replace stream Table_Heart_stream on table  Table_Heart;


 copy into CAPTAIN.public.Table_Heart
from (select t.$1 , t.$2 , t.$3 ,t.$4 , t.$5 ,t.$6,t.$7 , t.$8 , t.$9 ,t.$10 , t.$11 ,t.$12,t.$13 , t.$14 , t.$15 ,t.$16 , t.$17 ,t.$18, t.$19 from  @CAPTAIN.public.External_stage t)
on_error = 'skip_file'
file_format = my_csv_format;



-- Create consumer table

create or replace table Consumer_Heart(HeartDisease varchar,BMI float,Smoking varchar,AlcoholDrinking varchar,Stroke varchar,PhysicalHealth int,MentalHealth int,DiffWalking varchar,Sex varchar,AgeCategory string,Race varchar,Diabetic varchar,
                                 PhysicalActivity varchar,GenHealth varchar,SleepTime int,Asthma varchar,KidneyDisease varchar,SkinCancer varchar,id int, stream_type  string, rec_version number default 0,REC_DATE TIMESTAMP_LTZ);




 -- updating task
CREATE or replace TASK tgt_merge
  WAREHOUSE = compute_wh
  SCHEDULE = '1 minute'
WHEN
  SYSTEM$STREAM_HAS_DATA('strm_cyclone')
AS
merge into Consumer_Heart t
using Table_Heart_stream s 
on t."ID"=s."ID"
 and (metadata$action='DELETE')
when matched and metadata$isupdate='FALSE' then update set rec_version=9999, stream_type='DELETE'
when matched and metadata$isupdate='TRUE' then update set rec_version=rec_version-1
when not matched then insert (HeartDisease,BMI ,Smoking ,AlcoholDrinking ,Stroke ,PhysicalHealth ,MentalHealth ,DiffWalking ,Sex ,AgeCategory ,Race ,Diabetic ,
                                 PhysicalActivity ,GenHealth ,SleepTime ,Asthma ,KidneyDisease ,SkinCancer,id,stream_type ,rec_version,REC_DATE) values(s.HeartDisease ,s.BMI ,s.Smoking ,s.AlcoholDrinking ,s.Stroke ,s.PhysicalHealth ,s.MentalHealth ,s.DiffWalking ,s.Sex ,s.AgeCategory ,s.Race ,s.Diabetic,
                                 s.PhysicalActivity ,s.GenHealth ,s.SleepTime ,s.Asthma ,s.KidneyDisease ,s.SkinCancer,s.id, metadata$action,0,CURRENT_TIMESTAMP() );
                                 
ALTER TABLE Consumer_Heart
ADD ID INT;

SELECT * from Consumer_Heart;

SELECT * FROM strm_cyclone;
                              