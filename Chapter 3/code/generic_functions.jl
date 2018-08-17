# multiple dispatch:
f(n, m) = "base case"
f(n::Number, m::Number) = "n and m are both numbers"
f(n::Number, m) = "n is a number"
f(n, m::Number) = "m is a number"
f(n::Integer, m::Integer) = "n and m are both integers"
#> f (generic function with 5 methods)
f(1.5, 2) #> "n and m are both numbers"
f(1, "bar") #> "n is a number"
f(1, 2) #> "n and m are both integers"
f("foo", [1,2]) #> "base case"
f(n::Float64, m::Integer) = "n is a float and m is an integer"
#> f (generic function with 6 methods)
f(1.5, 2) #> "n is a float and m is an integer"

# methods:
methods(+)
methods(sort)

using InteractiveUtils
InteractiveUtils.methodswith(String)

# measuring execution:
fib(n) = n < 2 ? n : fib(n-1) + fib(n-2)
@time fib(35)
@elapsed fib(35) #> elapsed time: 0.115853481 seconds (45144 bytes allocated)

# broadcasting:
arr = [1.0, 2.0, 3.0]
sin.(arr) 
#> 3-element Array{Float64,1}:
#  0.8414709848078965
#  0.9092974268256817
#  0.1411200080598672

f(x,y) = x + 7y
f.(pi, arr) 
#> 3-element Array{Float64,1}:
# 10.141592653589793
# 17.141592653589793
# 24.141592653589793