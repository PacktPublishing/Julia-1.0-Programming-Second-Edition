# type annotations and scope:
x = 1.0 # x is Float64
x = 1 # now x is Int
# y::Float64 = 1.0 
# ERROR: syntax: type declarations on global variables are not yet supported

function scopetest()
    println(x)
    y::Float64 = 1.0 # y must be Float64, this is not possible in global scope
    # y = 1
end

scopetest() 
#> 1
#> 1.0
# println(y) #> ERROR: UndefVarError: y not defined

# compound expressions:
x = begin
    a = 5
    2 * a
end # after: x is 10
println(a) #> a is 5
x = (a = 5; 2 * a) #> 10