var = 7
if var > 10
    println("var has value $var and is bigger than 10.")
elseif var < 10    # This elseif clause is optional.
    println("var has value $var and is smaller than 10.")
else                    # The else clause is optional too.
    println("var has value $var and is 10.")
end
#> prints "var has value 7 and is smaller than 10."

# if 0 print("ok") end
# ERROR: LoadError: TypeError: non-boolean (Int64) used in boolean context
a = 10
b = 15
z = if a > b a
    else  b
    end
println(z) #> 15
z = a > b ? a : b # with ternary operator

var = 7
varout = "var has value $var"
cond = var > 10 ? "and is bigger than 10." : var < 10 ? "and is smaller than 10" : "and is 10."
println("$varout $cond") # var has value 7 and is smaller than 10

function sqroot(n::Int)
    n >= 0 || error("n must be non-negative")
    n == 0 && return 0
    sqrt(n)
end
sqroot(4) #> 2.0
sqroot(0) #> 0.0
# sqroot(-6) #> ERROR: LoadError: n must be non-negative