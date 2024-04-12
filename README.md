# Identifying Conditions of Hemlock Woolly Adelgid in Northeastern US

_Adlai Nelson_

## Contents

- Submissions folder
  * contains outline

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

| Layer Name                 | Data type            | Resolution      | Date      | Source              | Notes                                                                 |
|----------------------------|----------------------|-----------------|-----------|---------------------|-----------------------------------------------------------------------|
| Presence of HWA            | point, polygon, line |                 | 2024      | imapinvasives.net   |                                                                       |
| NY and PA polygons         | polygon              |                 |           | Natural Earth       |                                                                       |
| NY and PA roads            | line                 |                 |           | Natural Earth       |                                                                       |
| Eastern Hemlock Basal Area | raster image         | 250 m           | 2000-2009 | Barry et al. (2013) | 250 m resolution                                                      |
| Temperature                | raster image         | 2.5 arc minutes | 1970-2000 | WorldClim           | max temperature of warmest month and min temperature of coldest month |
| Terrain Products           | images               | 90 meters       | 2013      | SRTM                | Slope, Aspect, Elevation                                              |
| Annual Rainfall            | raster               | 2.5 arc minutes | 1970-2000 | WorldClim           | Mean rainfall (mm)                                                    |
| Land Cover                 | raster               | 30 meters       |           | NLCD                | may or may not be included in final analysis                          |

NY and PA roads were not representative of all roads, especially ones on smaller scales, however, I chose to use this dataset rather than state GIS management GIS datasets. 
Distance from roads is included as a proxy for ease of access, as sites closer to major roads likely have more exposure to people, who may spread HWA.

### Preprocessing


All layers were reprojected to WGS 84, for the purpose of simplicity. 
Terrain products were calculated from a 90m SRTM raster image using QGIS tools. 
NY and PA roads were selected. 

Using the centroid tool in QGIS, I extracted centroids for all polygon and line HWA presence observations


### Citations

iMapInvasives: NatureServe’s online data system supporting strategic invasive species management. © [2024], NatureServe. Available at http://www.imapinvasives.org. (Date accessed: [01,04,2024].)

NASA Shuttle Radar Topography Mission (SRTM)(2013). Shuttle Radar Topography Mission (SRTM) Global. Distributed by OpenTopography. https://doi.org/10.5069/G9445JDF. Accessed: 2024-04-11 

Wilson, Barry Tyler; Lister, Andrew J.; Riemann, Rachel I.; Griffith, Douglas M. 2013. Live tree species basal area of the contiguous United States (2000-2009). Newtown Square, PA: USDA Forest Service, Rocky Mountain Research Station. https://doi.org/10.2737/RDS-2013-0013

Fick, S.E. and R.J. Hijmans, 2017. WorldClim 2: new 1km spatial resolution climate surfaces for global land areas. International Journal of Climatology 37 (12): 4302-4315. 
