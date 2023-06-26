#*******************************************#
# Computing the average value of a raster
# This code will compute average of all pixels 
# in the raster
#
# created by: Dr. Usman Mazhar
#             usmanmazhargeo@outlook.com
#*******************************************#

library("rgdal")
library("sp")
library("raster")

mypath = 'D:/test/'
setwd(mypath)


lstfile = list.files(mypath, pattern = '*.tif', full.names = T)
lstfile
length(lstfile)


for(i in 1:length(lstfile)){
  
  temp = raster(lstfile[i])
  rList[i] = values(temp)
  
  avg =raster::cellStats(temp, stat = 'mean', na.rm = T) 
  print(avg)
  
}
print("End Processing")
Sys.time()