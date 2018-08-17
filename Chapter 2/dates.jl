# constructing:
start_time = time()
# long computation
time_elapsed = time() - start_time
println("Time elapsed: $time_elapsed") #> 0.0010001659393310547

using Dates
d = Date(2014,9,1) #> 2014-09-01
dt = DateTime(2014,9,1,12,30,59,1) #> 2014-09-01T12:30:59.001
# accessors:
Dates.year(d)
Dates.month(d)
Dates.week(d)
Dates.day(d)
# functions:
Dates.isleapyear(d)
Dates.dayofyear(d)
Dates.monthname(d)
Dates.daysinmonth(d)