mutable struct Point
    x::Float64
    y::Float64
end

mutable struct Vector2D
    x::Float64
    y::Float64
end

p = Point(2, 5) #> Point(2.0,5.0)
v = Vector2D(3, 2) #> Vector2D(3.0,2.0)

# Example with sum:
# +(p, v) #> MethodError: ERROR: `+` has no method matching +(::Point, ::Vector2D)

import Base.+
+(p::Point,    q::Point) = Point(p.x + q.x, p.y + q.y)
+(u::Vector2D, v::Vector2D) = Point(u.x + v.x, u.y + v.y)
+(u::Vector2D, p::Point) = Point(u.x + p.x, u.y + p.y)
# +(p, v) #> ERROR: MethodError: `+` has no method matching +(::Point, ::Vector2D)
+(p::Point,    v::Vector2D) = Point(p.x + v.x, p.y + v.y)
+(p, v) #> Point(5.0,7.0)

# Example with dot product:
# *(p, v) #> ERROR: MethodError: `*` has no method matching *(::Point, ::Vector2D)

import Base.*
*(p::Point,    q::Point) = p.x * q.x + p.y * q.y
*(u::Vector2D, v::Vector2D) = u.x * v.x + u.y * v.y
*(u::Vector2D, p::Point) = u.x * p.x + u.y * p.y
# *(p, v) #> ERROR: MethodError: `*` has no method matching *(::Point, ::Vector2D)
*(p::Point,    v::Vector2D) = p.x * v.x + p.y * v.y
*(p, v) #> 16.0

VecOrPoint = Union{Vector2D, Point}

isa(p, VecOrPoint) #> true
isa(v, VecOrPoint) #> true

+(u::VecOrPoint, v:: VecOrPoint) = VecOrPoint(u.x + v.x, u.y + v.y)
+(p, v) #> Point(5.0,7.0)

*(u::VecOrPoint, v:: VecOrPoint) = u.x * v.x + u.y * v.y
*(p, v) #> 16.0