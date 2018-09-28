mutable struct Point{T}
  x::T
  y::T
end

Point{Int64} #> Point{Int64} (constructor with 1 method)
Point{Float64} #> Point{Float64} (constructor with 1 method)
Point{String} #> Point{String} (constructor with 1 method)

Point{Int64} <: Point #> true
Point{String} <: Point #> true
Point{Float64} <: Point{Real} #> false

p = Point{Int64}(2, 5) #> Point{Int64}(2,5)
p = Point(2, 5) #> Point{Int64}(2,5)
p = Point("London", "Great-Britain") #> Point{String}("London", "Great-Britain")

mutable struct PointP{T <: Real}
  x::T
  y::T
end

# p = PointP("London", "Great-Britain") #> ERROR: MethodError: no method matching PointP(::String, ::String)

add(x::T, y::T) where T = x + y
add(2, 3) #> 5
# add(2, 3.0) #> ERROR: MethodError: `add` has no method matching add(::Int64, ::Float64)
add(x::T, y::T) where T <: Number = x + y

function vecfloat(x::Vector{T}) where T <: AbstractFloat 
# code   
end