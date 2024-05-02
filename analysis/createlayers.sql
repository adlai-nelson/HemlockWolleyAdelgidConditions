-- source: https://postgis.net/docs/RT_ST_DumpAsPolygons.html
-- create layers of risk area
-- high temp
CREATE TABLE hightemp_area
AS
SELECT val, geom
FROM (
SELECT poly.*
FROM high_temp, LATERAL ST_DumpAsPolygons(rast) AS poly
) As item
WHERE val BETWEEN 25.46047 and 27.60675
ORDER BY val;

-- high temp
CREATE TABLE lowtemp_area
AS
SELECT val, geom
FROM (
SELECT poly.*
FROM low_temp, LATERAL ST_DumpAsPolygons(rast) AS poly
) As item
WHERE val BETWEEN -11.725 and -9.098477
ORDER BY val;

CREATE TABLE precip_area
AS
SELECT val, geom
FROM (
SELECT poly.*
FROM precip, LATERAL ST_DumpAsPolygons(rast) AS poly
) As item
WHERE val BETWEEN 922.0518 and 1162.538
ORDER BY val;

CREATE TABLE elevation_area
AS
SELECT val, geom
FROM (
SELECT poly.*
FROM elevation, LATERAL ST_DumpAsPolygons(rast) AS poly
) As item
WHERE val BETWEEN 168.4558 and 479.6323
ORDER BY val;

-- buffer around roads
CREATE TABLE roads_distance
AS
SELECT ST_Buffer(geom, 3787.443, 'endcap=square join=bevel') AS buffer_geom
FROM roads