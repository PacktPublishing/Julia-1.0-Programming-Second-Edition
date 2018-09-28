# (31+42)::Float64 #> TypeError(:typeassert,"",Float64,73)
# convert(Int64, 7.01) #> ERROR: InexactError()
convert(Int64, 7.0) #> 7
Int64(7.0) #> 7
# Int64(7.01) #> ERROR: InexactError: Int64(Int64, 7.01)
# convert(Int64, "CV")
# ERROR: MethodError: Cannot `convert` an object of type String to an object of type Int64
# convert(Int64, "123") # same ERROR as above

promote(1, 2.5, 3//4) #> (1.0,2.5,0.75)
promote(1.5, im) #> (1.5 + 0.0im,0.0 + 1.0im)
promote(true, 1.0) #> (1.0, 1.0)
promote_type(Int8, UInt16) #> UInt16