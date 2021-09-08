/* select * from ex5.uk_crime_lsoa */
with cte_lsoa_msoa (lsoa, msoa) as (
	select distinct lsoa11cd, msoa11cd from admin.oa_lookup
), cte_msoa_osm (msoa,pubs,nightclubs,nightlife_total,restaurants,shoe_shops,
				 deps_shops,supermarks_shops,clothes_shops,shops_total,trains,
				 train_bin,bus,bus_bin,bikes,car_spaces,car_parkings,moto_parkings,conveniences) as (
	select clm.msoa, 
	sum(ol.pubs) as pubs,
	sum(ol.nightclubs) as nightclubs,
	sum(nightlife_total) as nightlife_total,
	sum(restaurants) as restaurants,
	sum(shoe_shops) as shoe_shops,
	sum(deps_shops) as deps_shops,
	sum(supermarks_shops) as supermarks_shops,
	sum(clothes_shops) as clothes_shops,
	sum(shops_total) as shops_total,
	sum(trains) as trains,
	sum(train_bin) as train_bin,
	sum(bus) as bus,
	sum(bus_bin) as bus_bin,
	sum(bikes) as bikes,
	sum(car_spaces) as car_spaces,
	sum(car_parkings) as car_parkings,
	sum(moto_parkings) as moto_parkings,
	sum(conveniences) as conveniences
	from ex5.osm_lsoa ol 
	inner join cte_lsoa_msoa clm
	on ol.geo_code = clm.lsoa
	group by clm.msoa
)







