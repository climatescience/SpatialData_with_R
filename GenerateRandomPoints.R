#*******************************************#
# NCDF to GeoTiff conversion
#
# created by: Dr. Usman Mazhar
#             usmanmazhargeo@outlook.com
#*******************************************#
#*
library(raster)
library(rgdal)
library(sf)

mypath = "D:/test/"
setwd(mypath)

# Generate random points using a polygon (vector)     
# Give name of your polygon file. here, "Pak_admin0.shp" is my shapefile.
mypoly = readOGR("PAK_adm0.shp") 
plot(mypoly)
# After 'n=' give the number of points you want to generate.
randpoint = spsample(mypoly, n=100, "random")  
plot(randpoint)


#To save generated points as csv
write.csv(randpoint, "mypoints.csv")