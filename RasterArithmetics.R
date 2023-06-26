#*******************************************#
# A simple calculator for rasters
# This code is designed for two raster data sets
# It can be extended to N raster data sets
#
# created by: Dr. Usman Mazhar
#             usmanmazhargeo@outlook.com
#*******************************************#
library(sp)
library(raster)

setwd("D:/test/")

first_file = list.files("D:/test/first_raster/", pattern = '*.tif', full.names = T)
first_file
length(first_file)

second_file = list.files("D:/test/second_raster/", pattern = '*.tif', full.names = T)
second_file
length(second_file)


for(i in 1:length(first_file)){
  
  temp_first = raster(first_file[i])
  temp_second = raster(second_file[i])
  
  
  # modify formulae according to your requirement 
  
  #for add/subtract
  
  final_file = temp_first - temp_second
  
  # For average
  # final_file = (temp_first + temp_second)/2
  
  
  # for root mean square
    #stepone = (temp_first^2) + (temp_second^2)
  #final_file = sqrt(stepone)  
  
  out_name = paste0(substr(names(temp_first), 4,9), "_avg")
  
  writeRaster(final_file,  filename = out_name, format = "GTiff", overwrite = T)
  
}
print("End Processing!")
Sys.time()