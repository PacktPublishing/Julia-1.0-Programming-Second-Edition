using InteractiveUtils

mutable struct Point
    x::Float64
    y::Float64
    z::Float64
end

typeof(Point) #> DataType

fieldnames(Point) #> (:x, :y, :z)

orig = Point(0, 0, 0) #> Point(0.0,0.0,0.0)
p1 = Point(2, 4, 1.3) #> Point(2.0,4.0,1.3)
fieldnames(typeof(p1)) #> (:x, :y, :z)

methods(Point)
# 3 methods for generic function "(::Type)":
# [1] Point(x::Float64, y::Float64, z::Float64) in Main at REPL[12]:2
# [2] Point(x, y, z) in Main at REPL[12]:2
# [3] (::Type{T})(arg) where T in Base at deprecated.jl:461

typeof(p1) #> Point (constructor with 1 method)
subtypes(Point) #> 0-element Array{Type,1}

p1.y #> 4.0
p1.z = 3.14 #> 3.14
p1 #> Point(2.0, 4.0, 3.14)
# p1.z = "A" #> ERROR: MethodError: Cannot `convert` an object of type String 
# to an object of type Float64 

struct Vector3D
    x::Float64
    y::Float64
    z::Float64
end
typeof(Vector3D) #> DataType
p = Vector3D(1, 2, 3) #> Vector3D(1.0,2.0,3.0)
# p.y = 5 #> ERROR: type Vector3D is immutable

Point3D = Point
p31 = Point3D(1, 2, 3) #> Point(1.0,2.0,3.0) 

5 == 5 #> true
5 == 5.0 #> true
isequal(5, 5) #> true
isequal(5, 5.0) #> true
5 === 5   #> true
5 === 5.0 #> false

q = Vector3D(4.0, 3.14, 2.71)
r = Vector3D(4.0, 3.14, 2.71)
isequal(q, r) #> true
q === r #> true

mutable struct MVector3D
    x::Float64
    y::Float64
    z::Float64
end

q = MVector3D(4.0, 3.14, 2.71)
r = MVector3D(4.0, 3.14, 2.71)
isequal(q, r) #> false
q === r #> false

# constructors, subtyping and multiple dispatch
abstract type Employee
end

# Employee() #> ERROR: MethodError: no constructors have been defined for Employee

mutable struct Developer <: Employee
    name::String
    iq
    favorite_lang
end

# mutable struct MobileDeveloper <: Developer
#    platform
# end
# ERROR: invalid subtyping in definition of MobileDeveloper

# outer constructor:
Developer(name, iq) = Developer(name, iq, "Java")
#> Developer (constructor with 3 methods)

mutable struct Manager
    name::String
    iq
    department::String
end

devel1 = Developer("Bob", 110) #> Developer("Bob",110,"Java")
devel2 = Developer("William", 145, "Julia")
#> Developer("William",145,"Julia")
man1 = Manager("Julia", 120, "ICT") #> Manager("Julia",120,"ICT")

cleverness(emp::Employee) = emp.iq
cleverness(devel1) #> 110
# cleverness(man1) #> ERROR: MethodError: `cleverness` has no method 
# matching cleverness(::Manager)

function cleverer(m::Manager, e::Employee)
    println("The manager $(m.name) is cleverer!")
end

cleverer(man1, devel1) #> The manager Julia is cleverer!
cleverer(man1, devel2) #> The manager Julia is cleverer!

function cleverer(d::Developer, e::Employee)
    println("The developer $(d.name) is cleverer!")
end

cleverer(devel1, devel2) #> The developer Bob is cleverer!
# cleverer(devel1, man1) #> ERROR: `cleverer` has no method matching cleverer(::Developer,::Manager)

function cleverer(e::Employee, d::Developer)
    if e.iq <= d.iq
        println("The developer $(d.name) is cleverer!")
    else
        println("The employee $(e.name) is cleverer!")
    end
end

# cleverer(devel1, devel2)
#> ERROR: MethodError: cleverer(::Developer, ::Developer) is ambiguous. Candidates:
#    cleverer(e::Employee, d::Developer) in Main at REPL[32]:2
#    cleverer(d::Developer, e::Employee) in Main at REPL[29]:2
#  Possible fix, define
#    cleverer(::Developer, ::Developer)

function cleverer(d1::Developer, d2::Developer)
    if d1.iq <= d2.iq
        println("The developer $(d2.name) is cleverer!")
    else
        println("The developer $(d1.name) is cleverer!")
    end
end

cleverer(devel1, devel2) #> The developer William is cleverer!
cleverer(devel2, devel1) #> The developer William is cleverer!