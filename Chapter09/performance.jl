# TIPS:
# 1
const DEFAULT = 42

global x = 42
function f(args)
	#function body
end
y = f(x::Int + 1)

# 3
function myFunc(a::T, c::Int) where T
  # code
end

# 9
function with_keyword(x; name::String = "Smith")
   # ...
end

# 16
mutable struct Person
	name::String
	height::Float64
	weight::Float64
end
# instead of:
# type Person
# 	name
# 	height
# 	weight
# end

# 18
# Use
file = open("file2.txt", "w")
a = "Julia"
b = "Rust"
write(file, a, " ", b)
# instead of:
write(file, "$a $b")

# TOOLS:
# @time

# linter:
# add Lint
# using Lint
# lintfile("performance.jl")