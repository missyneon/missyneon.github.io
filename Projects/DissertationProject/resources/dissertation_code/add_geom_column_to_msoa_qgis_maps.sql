select * from ex5."2018_wales_crime_data"
select * from ex5."2019_wales_crime_data"
select * from ex5."2020_wales_crime_data"
select * from ex5."2021_wales_crime_data"


alter table ex5."2018_wales_crime_data" add column geom geometry(point,4326);
update ex5."2018_wales_crime_data" set geom = st_setsrid(st_makepoint("Longitude","Latitude"),4326);

alter table ex5."2019_wales_crime_data" add column geom geometry(point,4326);
update ex5."2019_wales_crime_data" set geom = st_setsrid(st_makepoint("Longitude","Latitude"),4326);

alter table ex5."2020_wales_crime_data" add column geom geometry(point,4326);
update ex5."2020_wales_crime_data" set geom = st_setsrid(st_makepoint("Longitude","Latitude"),4326);

alter table ex5."2021_wales_crime_data" add column geom geometry(point,4326);
update ex5."2021_wales_crime_data" set geom = st_setsrid(st_makepoint("Longitude","Latitude"),4326);

alter table ex5."2020_wales_crime_data" add column msoa character varying;
update ex5."2020_wales_crime_data" wcd
set msoa = oal.msoa11cd
from admin.oa_lookup oal
where wcd."LSOA code" = oal.lsoa11cd;