#*******************************************#
# Merge multiple rasters
# This code is also used to take mean/average
# of multiple rasters
#
# created by: Dr. Usman Mazhar
#             usmanmazhargeo@outlook.com
#*******************************************#

library(raster)

mypath = "D:/test/"
setwd(mypath)

# Make the list of all rasters
lstfile = list.files(mypath, pattern =  ".tif", full.names = T)
lstfile
length(lstfile)

# Stack all rasters
mystack = stack(lstfile)

# Applying the merging method
mymerge = mean(mystack, na.rm=T)

# write output raster
writeRaster(mymerge, filename = "mymerge", format = "GTiff")
print("job done!")
Sys.time()