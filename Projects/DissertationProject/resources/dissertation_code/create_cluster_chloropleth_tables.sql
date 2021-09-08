truncate table ex5."2020_wales_crime_data_F"
truncate table ex5."wales_msoa_F"

select * from ex5."2020_wales_crime_data_F"
select * from ex5."wales_msoa_F"


--insert values into main table
insert into ex5."2020_wales_crime_data_F"
select * from ex5."2020_wales_crime_data" where msoa in ('W02000045'
,'W02000192'
,'W02000360'
,'W02000398'
,'W02000402')

--insert msoa values into cluster table
with cte_msoacount (msoa,msoacount) as (
select msoa,count(*) as msoacount from ex5."2020_wales_crime_data_F"
group by msoa
)
insert into ex5."wales_msoa_F"(id,geom,name,code)
select id,geom,name,code from ex5."wales_msoa_copy"
where code in (select msoa from cte_msoacount)

--update count column in msoa cluster table
with cte_msoacount (msoa,msoacount) as (
select msoa,count(*) as msoacount from ex5."2020_wales_crime_data_A"
group by msoa
)
update ex5."wales_msoa_A" t1
set msoacount = t2.msoacount
from cte_msoacount t2
where t1.code = t2.msoa

--update population column in cluster table
with cte_oa_msoa (oa, msoa) as (
	select distinct oa11cd, msoa11cd from admin.oa_lookup 	
)

update ex5."wales_msoa_A" t1
set msoapopulation = msoa_population
from (select msoa, sum(totaladult) as msoa_population from admin.oa_adult_pop a1
inner join cte_oa_msoa b1 
on b1.oa = a1.gss
group by msoa
order by msoa) t2
where t1.code = t2.msoa