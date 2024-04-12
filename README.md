# Identifying Conditions of Hemlock Woolly Adelgid in Northeastern US

_Adlai Nelson_

## Introduction

Hemlock Woolly Adelgid (HWA, _Adelges tsugae_) is a host specific invasive species whose hosts include hemlock species. 
Eastern hemlock (_Tsuga Canadensis_) are particularly important to riparian ecosystems in the Northeast US. 
HWA has spread rapidly since it’s introduction to the US in the 1950s, where it is known to cause mortality in Eastern Hemlock.

This research project aims to answer the following questions:

_What are the environmental and physical conditions that HWA thrives in?_

_What currently uninfested stands of Eastern hemlock are vulnerable to HWA?_

To answer these questions, I will use the case study of two states: Pennsylvania and New York


<img src="figures/HWA_example.JPG" alt="picure of branch of Eastern hemlock with HWA on it the branch, HWA appears as white balls of fuzz" width="500"/>

_Hemlock Woolly Adelgid ovisacs appear as small woolly masses at the base of needles_


## Data

<img src="figures/studyarea.png" alt="map of NY and PA with Eastern Hemlock basal area dataset and HWA confirmed points" width="900"/>

The study area includes the states of Pennsylvania and New York. This is due to data availability.
imapinvasives.net partners with agencies in states to record observations, and these two states are two of the few states that have this partenership.


| Layer Name                 | Data type            | Resolution      | Date      | Source              | Notes                                                                 |
|----------------------------|----------------------|-----------------|-----------|---------------------|-----------------------------------------------------------------------|
| Presence of HWA            | point, polygon, line |                 | 2024      | imapinvasives.net   |                                                                       |
| NY and PA                  | polygon              |                 |           | Natural Earth       |      Study Area                                                       |
| NY and PA roads            | line                 |                 |           | Natural Earth       |  Major Roads                                                          |
| Eastern Hemlock Basal Area | raster image         | 250 m           | 2000-2009 | Barry et al. (2013) | 250 m resolution                                                      |
| Temperature                | raster image         | 2.5 arc minutes | 1970-2000 | WorldClim           | max temperature of warmest month and min temperature of coldest month |
| Terrain Products           | images               | 90 meters       | 2013      | SRTM                | Slope, Aspect, Elevation                                              |
| Annual Rainfall            | raster               | 2.5 arc minutes | 1970-2000 | WorldClim           | Mean rainfall (mm)                                                    |

Terrain varibales included are elevation, slope, aspect. These will be used to asses if there is a relationship between HWA infestations and these variables. 
These data were created from a DEM from SRTM.
Environmental variables include the mean annual rainfall. minimum temperature of coldest month and maximum temperature of the warmest month. 
These datasets all come from WoldClim, and are long term averages over 30 years.

<img src="figures/environ_vars.png" alt="map of environmental and terrain vairables" width="900"/>
<img src="figures/roads.png" alt="map of roads in study area" width="300"/>


NY and PA roads were not representative of all roads, especially ones on smaller scales, however, I chose to use this dataset rather than state GIS management GIS datasets. 
Distance from roads is included as a proxy for ease of access, as sites closer to major roads likely have more exposure to people, who may spread HWA.

### Preprocessing


All spatial data preprocessing took place is QGIS 3.28.14.
All layers were reprojected to EPSG 5070, NAD 83 Conus Albers, using reproject and warp (reproject) tools. 
All layers were clipped to the study area, using the clip and clip raster by mask layer tools.
The HWA observations layer was distributed as three seperate layers: points, lines, and polygons. 
To combine these datasets, the centroid tool was used to calculate the centroid of each line any polygon feature.
The resultant features were merged with the points layer, to create a layer containing all observations in point form.
Slope and aspect layers were calculated in QGIS after being reprojected from the SRTM DEM.

Data was then exported to .sql files using the shp2pgsql and raster2pgsql utilities.

### Normalization

This project relies heavily on images, so the majority of the tables will be raster tables, and will not require normalization.
The vector layers that are included in this project 

## Repo Contents

- Submissions folder
  * outline (submission 1)
  * importing commands (contains code to be ran in command line to read datasets into sql code)
-  read_data (contains .sql files to read into psql)
-  figures (contains figures in read me)

### Citations

iMapInvasives: NatureServe’s online data system supporting strategic invasive species management. © [2024], NatureServe. Available at http://www.imapinvasives.org. (Date accessed: [01,04,2024].)

NASA Shuttle Radar Topography Mission (SRTM)(2013). Shuttle Radar Topography Mission (SRTM) Global. Distributed by OpenTopography. https://doi.org/10.5069/G9445JDF. Accessed: 2024-04-11 

Wilson, Barry Tyler; Lister, Andrew J.; Riemann, Rachel I.; Griffith, Douglas M. 2013. Live tree species basal area of the contiguous United States (2000-2009). Newtown Square, PA: USDA Forest Service, Rocky Mountain Research Station. https://doi.org/10.2737/RDS-2013-0013

Fick, S.E. and R.J. Hijmans, 2017. WorldClim 2: new 1km spatial resolution climate surfaces for global land areas. International Journal of Climatology 37 (12): 4302-4315. 
