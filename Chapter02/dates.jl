# constructing:
start_time = time()
# long computation
time_elapsed = time() - start_time
println("Time elapsed: $time_elapsed") #>  0.0009999275207519531

using Dates
d = Date(2018,9,1) #> 2018-09-01
dt = DateTime(2018,9,1,12,30,59,1) #> 2018-09-01T12:30:59.001
# accessors:
year(d)
month(d)
week(d)
day(d)
# functions:
isleapyear(d)
dayofyear(d)
monthname(d)
daysinmonth(d)