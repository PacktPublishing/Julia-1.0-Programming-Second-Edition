# anonymous functions:
(x, y) -> x^3 - y + x * y
f = (x, y) -> x^3 - y + x * y
println(f(3, 2) ) # 31

function (x)
    x + 2
end

(x) -> x + 2
x -> x + 2  # lambda syntax
() -> println("hello, Julia")
(x, y, z) -> 3x + 2y - z