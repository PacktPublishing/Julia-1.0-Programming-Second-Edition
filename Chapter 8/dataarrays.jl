using DataArrays
dv = @data([7, 3, NA, 5, 42])
    #> 5-element DataArray{Int64,1}: 7  3   NA  5 42
# array(dv) #> ERROR: NAException
# convert(Array, dv) #> ERROR: NAException("Cannot convert DataArray with NA's to desired type")
mean(dv) #> NA
sum(dv) #> NA
dv[5] = NA  #> dv now becomes [7, 3, NA, 5, NA]

# getting rid of NA's:
sum(dropna(dv)) #> 15
repl = -1
sum(array(dv, repl)) #> 13