with cte_lsoa_msoa (lsoa, msoa) as (
	select distinct lsoa11cd, msoa11cd from admin.oa_lookup
)

select wcd21.*, clm.msoa from ex5."2021_wales_crime_data" wcd21
inner join cte_lsoa_msoa clm on wcd21."LSOA code" = clm.lsoa
--133249
/*
select wcd18.*, clm.msoa from ex5."2018_wales_crime_data" wcd18
inner join cte_lsoa_msoa clm on wcd18."LSOA code" = clm.lsoa
--308110

select wcd19.*, clm.msoa from ex5."2019_wales_crime_data" wcd19
inner join cte_lsoa_msoa clm on wcd19."LSOA code" = clm.lsoa
--311744

select wcd20.*, clm.msoa from ex5."2020_wales_crime_data" wcd20
inner join cte_lsoa_msoa clm on wcd20."LSOA code" = clm.lsoa
--330956

*/
