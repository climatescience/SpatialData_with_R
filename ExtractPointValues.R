#*******************************************#
# Extract corresponding point value
#
# created by: Dr. Usman Mazhar
#             usmanmazhargeo@outlook.com
#*******************************************#
library(sp)
library(raster)
library(rgdal)

mypath = "D:/test/"
setwd(mypath)

# stack all raster files from your working directory.
mylist = list.files(mypath, pattern = "*.tif", full.names = T)
mylist
mystack = stack(mylist)

# Read the point shape file. 
mypoint = readOGR("random100.shp")

# Extract the corresponding pixel values.
myvalue = extract(mystack, mypoint)

# Write the output as a csv.

write.csv(myvalue, "point_value.csv")
Sys.time()
