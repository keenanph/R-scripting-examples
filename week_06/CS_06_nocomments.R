library(raster)
library(sp)
library(spData)
library(tidyverse)
library(sf)


data(world)  #load 'world' data from spData package
tmax_monthly <- getData(name = "worldclim", var="tmax", res=10) #attempts to grab data but it doesn't work

library(ncdf4)

tmean=raster("absolute.nc") # this is already in Cesius

#Below prepares the world
world2 <- world%>%
  filter(continent!='Antarctica')
World_Spatial <- as(world2,'Spatial')

#Below prepares climate data from Climate Research Unit- already in C
tmax_annual <- max(tmean)
names(tmax_annual) <- 'tmax'
Country_max <- raster::extract(tmean, world2,fun=max,na.rm=T,small=T,sp=T)

Country_max_sf <- st_as_sf(Country_max)

ggplot()+geom_sf(data=Country_max_sf,aes(fill =Country_max$CRU_Global_1961.1990_Mean_Monthly_Surface_Temperature_Climatology))+
  scale_fill_viridis_c(name="Annual\nMaximum\nTemperature (C)")+theme(legend.position = 'bottom')

chart <- Country_max_sf%>%
  group_by(continent)

