#*******************************************#
# Applying the scale factor to multiple rasters
#
# created by: Dr. Usman Mazhar
#             usmanmazhargeo@outlook.com
#*******************************************#

library("raster")

mypath = "D:/test/"
setwd(mypath)


lstfile = list.files(mypath, pattern = '*.tif', full.names = T)
lstfile
length(lstfile)

for(i in 1:length(lstfile)){
  
  temp = raster(lstfile[i])
 
# Modify formulae according to your requirement  
   
  rescal =  0.01 * temp
  
# If there is a need to add offset to the rasters, use following lines. 
# rescal = (0.01* temp) + 0.49
  
  out_name = paste0(names(temp), "_SC" )
  writeRaster(rescal,  filename = out_name, format = "GTiff", overwrite = T)

}
print("End Processing")
Sys.time()
