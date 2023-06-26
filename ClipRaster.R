#*******************************************#
# Clip a raster using shapefile
#
# created by: Dr. Usman Mazhar
#             usmanmazhargeo@outlook.com
#*******************************************#
library(sp)
library(rgdal)
library(raster)


mypath = "D:/test/"
setwd(mypath)

#This code will clip/subset all rasters in your working directory 
lstfile = list.files(mypath, pattern = '*.tif', full.names = T)
lstfile
length(lstfile)

# Give the name of your reference shapefile 
shp_file = readOGR("PAK_adm0.shp")

# This loop will clip/subset all raster/images in your working directory using the given shapefile
for(i in 1:length(lstfile)){
  
  temp = raster(lstfile[i])
  
  croped_file = crop(temp, extent(shp_file))
  masked_file = mask(croped_file, shp_file)
  
  out_name = paste0(names(temp) ,"_subset" )
  writeRaster(masked_file, filename = out_name, format = "GTiff", overwrite = T)
  
}
print("End Processing")
