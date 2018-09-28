filter(x -> iseven(x), 1:10)
# 5-element Array{Int64,1}:
#   2
#   4
#   6
#   8
#  10
mapreduce(x -> sqrt(x), +, 1:10) #> 22.4682781862041
# equivalent to:
sum(map(x -> sqrt(x), 1:10)) #> 22.4682781862041

# clipboard:
using InteractiveUtils
a = 42 #> 42
clipboard(a)
# quit and restart REPL:
# a #> ERROR: a not defined
a = clipboard() #> "42"