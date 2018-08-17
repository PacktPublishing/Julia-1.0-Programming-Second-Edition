# optional arguments:
f(a, b = 5) = a + b
f(1) #> 6
f(2, 5) #> 7
f(3) #> 8
# f() #> ERROR: MethodError: no method matching f()
# f(1, 2, 3)
#> ERROR: MethodError: no method matching f(::Int64, ::Int64, ::Int64)
# f(2, b = 5) #> ERROR: function f does not accept keyword arguments

# keyword arguments:
k(x; a1 = 1, a2 = 2) = x * (a1 + a2)
k(3, a2 = 3) #> 12
k(3, a2 = 3, a1 = 0) #> 9
k(3) #> 9

# combine all kinds of arguments in the same function
function allargs(normal_arg, optional_positional_arg=2; keyword_arg="ABC")
    print("normal arg: $normal_arg -")
    print("optional arg: $optional_positional_arg -")
    print("keyword arg: $keyword_arg")
end

allargs(1, 3, keyword_arg=4)
# prints: normal arg: 1 - optional arg: 3 - keyword arg: 4

function varargs2(;args...)
    args
end
varargs2(k1="name1", k2="name2", k3=7)
#> pairs(::NamedTuple) with 3 entries:
#   :k1 => "name1"
#   :k2 => "name2"
#   :k3 => 7