typeof(2) #> Int64
typeof(Int64) #> DataType
typeof(Complex{Int64}) #> DataType
typeof(Any) #> DataType
typeof(DataType) #> DataType

supertype(Int64) #> Signed
supertype(Signed) #> Integer
supertype(Integer) #> Real
supertype(Real) #> Number
supertype(Number) #> Any
supertype(Any) #> Any

using InteractiveUtils
subtypes(Integer) #> 3-element Array{Any,1}:
# Bool
# Signed
# Unsigned
subtypes(Signed) #> 6-element Array{Any,1}:
# BigInt
# Int128
# Int16
# Int32
# Int64
# Int8
subtypes(Int64) #> 0-element Array{Any,1}
typeof(Nothing) #> DataType

Bool <: Integer #> true
Bool <: Any #> true
Bool <: Char #> false
Bool <: Integer #> true
Float64 <: Integer #> false

typeof(5) #> Int64
isa(5, Number) #> true