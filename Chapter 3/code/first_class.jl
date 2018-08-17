mult(x, y) = x * y
typeof(mult) #> Function
m = mult
m(6, 6) #> 36

plustwo = function (x)
                x + 2
          end
plustwo(3) #> 5

3+4 #> 7
+(3,4) #> 7

function numerical_derivative(f, x, dx=0.01)
    derivative = (f(x+dx) - f(x-dx))/(2*dx)
    return derivative
end

f = x -> 2x^2 + 30x + 9
println(numerical_derivative(f, 1, 0.001)) #> 33.99999999999537

function derivative(f)
    return function(x)
        # pick a small value for h
        h = x == 0 ? sqrt(eps(Float64)) : sqrt(eps(Float64)) * x
        xph = x + h
        dx = xph - x
        f1 = f(xph) # evaluate f at x + h
        f0 = f(x) # evaluate f at x
        return (f1 - f0) / dx  # divide by h
    end
end

# closure:
function counter()
    n = 0
    () -> n += 1, () -> n = 0
end

(addOne, reset) = counter()
addOne()
addOne()
addOne()
reset()

# currying:
function add(x)
    return function f(y)
        return x + y
    end
end
add(1)(2) #> 3
add(x) = f(y) = x + y 
add(x) = y -> x + y

# nested:
function afun(x)
    z = x * 2
    function b(z)
        z += 1
    end
    b(z)
end

d = 5
afun(d) #> 11

# recursive:
sum(n) =  n > 1 ? sum(n-1) + n : n
sum(100) #> 5050
fib(n) = n < 2 ? n : fib(n-1) + fib(n-2)
println(fib(25)) #> 75025