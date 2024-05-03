------ Select values where HWA thrives------


-- select distances with 
-- credit: https://gis.stackexchange.com/questions/136403/postgis-nearest-points-with-st-distance-knn
SELECT
  points.gid, -- select gid of hwa points
  closest_road.gid, -- find gid of closest road
  closest_road.dist -- distance in meters
FROM hwa_points AS points
CROSS JOIN LATERAL -- join tables
  (SELECT
     gid, -- road gid
     ST_Distance(road.geom, points.geom) as dist -- distance 
     FROM roads AS road 
     ORDER BY points.geom <-> road.geom -- closest road to each hwa point
   LIMIT 1) AS closest_road; -- limit to only 1 closest road
   
-- select raster values where hwa was observed
-- high temperature of warmest month
SELECT thing.gid, ST_Value(rast, thing.geom) AS high_temp
FROM high_temp CROSS JOIN hwa_points AS thing;

-- low temperature of lowest month
SELECT thing.gid, ST_Value(rast, thing.geom) AS low_temp
FROM low_temp CROSS JOIN hwa_points AS thing;

-- mean annual precipitation
SELECT thing.gid, ST_Value(rast, thing.geom) AS precip
FROM precip CROSS JOIN hwa_points AS thing;

--hemlock area
SELECT thing.gid, ST_Value(rast, thing.geom) AS helock_area
FROM hemlock_area CROSS JOIN hwa_points AS thing;

-- elevation
SELECT thing.gid, ST_Value(rast, thing.geom) AS elevation
FROM elevation CROSS JOIN hwa_points AS thing;

-- slope
SELECT thing.gid, ST_Value(rast, thing.geom) AS slope
FROM slope CROSS JOIN hwa_points AS thing;

-- aspect
SELECT thing.gid, ST_Value(rast, thing.geom) AS aspect
FROM aspect CROSS JOIN hwa_points AS thing;

