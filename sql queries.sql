
/****SQL QUERIES*****/

--1. which gender have majority heart attack?

select count(STROKE),sex from Consumer_Heart where stroke = 'Yes' group by sex;


--2. Average Age at which people generally gets heart attack?

select FLOOR(AVG(SUBSTRING(AGECATEGORY, 1,2))) as AGE from Consumer_Heart where stroke = 'Yes';

--3.3. which combination of physical and mental health causes stroke

SELECT STROKE,PHYSICALHEALTH, MENTALHEALTH from Consumer_Heart WHERE stroke = 'Yes' ;

--4. GenHealth wise average BMI of people

SELECT GENHEALTH, AVG(BMI) from Consumer_Heart group by GENHEALTH;

--5. Average age of people having problem in walking

select FLOOR(AVG(SUBSTRING(AGECATEGORY, 1,2))) as AGE from Consumer_Heart where DIFFWALKING = 'Yes';

--6 6. Count the different combination of people having heart-attack against  BMI, Smoking ,AlcoholDrink,Stroke,Diabetic,Kidney Diseases,skin cancer

SELECT HEARTDISEASE, SMOKING, id from Consumer_Heart where HEARTDISEASE = 'Yes' AND SMOKING ='Yes' AND ALCOHOLDRINKING = 'Yes' AND STROKE = 'Yes' AND DIABETIC = 'Yes' AND KIDNEYDISEASE = 'Yes' AND SKINCANCER = 'Yes';


--7. Average BMI of people having Skin Cancer

SELECT SKINCANCER, AVG(BMI) from Consumer_Heart where SKINCANCER  = 'Yes' group by SKINCANCER;

--8. Possibilities/Percentage of people having both Heart Diseases stroke and Skin Cancer

SELECT HEARTDISEASE,SKINCANCER, count(ID) * 100.0 / sum(count(ID)) Over() as Percentage
FROM Consumer_Heart  where HEARTDISEASE = 'Yes' and SKINCANCER = 'Yes'
GROUP BY HEARTDISEASE,SKINCANCER;
