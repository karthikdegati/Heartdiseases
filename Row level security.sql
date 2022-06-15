/*****CREATING ROW LEVEL SECURITY******/

create or replace role "18-24";
create or replace role "25-29";
create or replace role "30-34";
create or replace role "35-39";
create or replace role "40-44";                         
create or replace role "45-49";
create or replace role "50-54";
create or replace role "55-59";
create or replace role "60-64";
create or replace role "65-69";
create or replace role "70-74";
create or replace role "75-79";
create or replace role "80 or older";





create or replace user MINOR password = 'temp123' default_Role = "18-24" must_change_password = false;
grant role "18-24" to user MINOR;
grant role  "25-29" to user MINOR;
grant role "55-59" to user MINOR;
grant role  "35-39" to user MINOR;


create or replace user MIDDLE_AGE password = 'temp123' default_Role = "40-44" must_change_password = false;
grant role "45-49" to user MIDDLE_AGE;
grant role  "50-54" to user MIDDLE_AGE;
grant role "60-64" to user MIDDLE_AGE;
grant role "65-69" to user MIDDLE_AGE;


create or replace user OLD_AGE password = 'temp123' default_Role = "70-74" must_change_password = false;
grant role "80 or older" to user OLD_AGE;








                            
grant usage on warehouse compute_Wh to role "18-24";
grant usage on warehouse compute_Wh to role "25-29";
grant usage on warehouse compute_Wh to role "30-34";
grant usage on warehouse compute_Wh to role "35-39";
grant usage on warehouse compute_Wh to role "40-44";
grant usage on warehouse compute_Wh to role "45-49";
grant usage on warehouse compute_Wh to role "50-54";
grant usage on warehouse compute_Wh to role "55-59";
grant usage on warehouse compute_Wh to role "60-64";
grant usage on warehouse compute_Wh to role "65-69";
grant usage on warehouse compute_Wh to role "70-74";
grant usage on warehouse compute_Wh to role "75-79";
grant usage on warehouse compute_Wh to role "80 or older";

grant usage on database captain to role  "18-24";
grant usage on database captain to role  "25-29";
grant usage on database captain to role  "30-34";
grant usage on database captain to role  "35-39";
grant usage on database captain to role  "40-44";
grant usage on database captain to role  "45-49";
grant usage on database captain to role  "50-54";
grant usage on database captain to role  "55-59";
grant usage on database captain to role  "60-64";
grant usage on database captain to role  "65-69";
grant usage on database captain to role  "70-74";
grant usage on database captain to role  "75-79";
grant usage on database captain to role  "80 or older";


grant usage on schema public to role  "18-24";
grant usage on schema public to role  "25-29";
grant usage on schema public to role  "30-34";
grant usage on schema public to role  "35-39";
grant usage on schema public to role  "40-44";
grant usage on schema public to role  "45-49";
grant usage on schema public to role  "50-54";
grant usage on schema public to role  "55-59";
grant usage on schema public to role  "60-64";
grant usage on schema public to role  "65-69";
grant usage on schema public to role  "70-74";
grant usage on schema public to role  "75-79";
grant usage on schema public to role  "80 or older";





create or replace secure view vw_Table_Heart as 
select HeartDisease,BMI ,Smoking ,AlcoholDrinking ,Stroke ,PhysicalHealth ,MentalHealth ,DiffWalking ,Sex ,AgeCategory ,Race ,Diabetic ,
                                 PhysicalActivity ,GenHealth ,SleepTime ,Asthma ,KidneyDisease ,SkinCancer,id  from Table_Heart
               where upper(AGECATEGORY) = upper(current_role());
               
               

               
               
               
               
               
grant select on view vw_Table_Heart to role "18-24";
grant select on view vw_Table_Heart to role "25-29";
grant select on view vw_Table_Heart to role "30-34";
grant select on view vw_Table_Heart to role "35-39";
grant select on view vw_Table_Heart to role "40-44";
grant select on view vw_Table_Heart to role "45-49";
grant select on view vw_Table_Heart to role "50-54";
grant select on view vw_Table_Heart to role "55-59";
grant select on view vw_Table_Heart to role "60-64";
grant select on view vw_Table_Heart to role "65-69";
grant select on view vw_Table_Heart to role "70-74";
grant select on view vw_Table_Heart to role "75-79";
grant select on view vw_Table_Heart to role "80 or older";


-- Verify the rows for DEPARTMENT_MINOR role
use role "18-24";
use role "25-29";
use role "30-34";
use role "35-39";
use role "40-44";
use role "45-49";
use role "50-54";
use role "55-59";
use role "60-64";
use role "65-69";
use role "70-74";
use role "75-79";
use role "80 or older";

use database CAPTAIN;
use schema PUBLIC;

select * from vw_Table_Heart;

drop role "80 or older";
