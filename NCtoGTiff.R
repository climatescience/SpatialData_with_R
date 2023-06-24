#*******************************************#
# NCDF to GeoTiff conversion
#
# created by: Dr. Usman Mazhar
#             usmanmazhargeo@outlook.com
#*******************************************#

library(ncdf4)
library(sp)
library(raster)

mypath = "C:/Users/usman/Desktop/ERA/"
setwd(mypath)


INTO = "nswrs.sfc.gauss.2004.nc"
nc_file = nc_open(INTO)
summary(nc_file)
print(nc_file)

#Output variable
#give your desired parameter name against "varname" in the following command.  
#nswrs is the parameter name from .nc file. This specific ERA5 file contains Net shortwave radiation flux data.
nc_var = brick(INTO, varname="nswrs") 
summary(nc_var)
print(nc_var)
stack_var = stack(nc_var)
print(stack_var)
names(stack_var)

#chnage the extend of the output raster according to your data.
extent(stack_var) = extent(0, 360, -90, 90)
rotat_var = rotate(stack_var)
print(rotat_var)
names(rotat_var)

NL = nlayers(stack_var)
NL

#Save each layer in a separate TIFF file

for(i in 1:NL){
  plot(rotat_var[[i]])
  filout=paste0("NSR_",gsub("[.]", "",  substr(names(stack_var), 2, 12))[i],".tif")
  writeRaster(rotat_var[[i]], filename=filout, format="GTiff",overwrite=TRUE)
}

print("Processing End!")
Sys.time()

