
/**********Creating Coloumn level security*****/







CREATE  MASKING POLICY captain.public.AGE_SENIOR30 AS (VAL string) RETURNS string ->
      CASE
      when current_role() in ('80 or older') THEN VAL 
      when val='80 or older' then VAL
     ELSE '*******'
  
  end;




create or replace table  Table_Heart_CL(HeartDisease varchar,BMI float,Smoking varchar,AlcoholDrinking varchar,Stroke varchar,PhysicalHealth int,MentalHealth int,DiffWalking varchar,Sex varchar,AgeCategory string Masking policy captain.public.AGE_SENIOR30,Race varchar,Diabetic varchar,
                                 PhysicalActivity varchar,GenHealth varchar,SleepTime int,Asthma varchar,KidneyDisease varchar,SkinCancer varchar,id INT);


INSERT INTO Table_Heart_CL(HeartDisease,BMI ,Smoking ,AlcoholDrinking ,Stroke ,PhysicalHealth ,MentalHealth ,DiffWalking ,Sex ,AgeCategory ,Race ,Diabetic ,
                                 PhysicalActivity ,GenHealth ,SleepTime ,Asthma ,KidneyDisease ,SkinCancer,id )
SELECT HeartDisease,BMI ,Smoking ,AlcoholDrinking ,Stroke ,PhysicalHealth ,MentalHealth ,DiffWalking ,Sex ,AgeCategory ,Race ,Diabetic ,
                                 PhysicalActivity ,GenHealth ,SleepTime ,Asthma ,KidneyDisease ,SkinCancer,id FROM Captain.Public.Table_Heart;



select * from Table_Heart_CL;

select * from Table_Heart;




create or replace secure view vw_Table_Heart as
select H.*
from Captain.public.Table_Heart_CL H
where upper(AGECATEGORY)= upper(current_role());



grant select on view captain.public.vw_Table_Heart to role "80 or older";


select * from  vw_Table_Heart;


