mutable struct Person
    name:: String
    height::Float64
end

fieldnames(Person) #> (:name, :height)
Person.types  #> svec(String, Float64)

code_lowered(+, (Int, Int))
# 1-element Array{Core.CodeInfo,1}:
#  CodeInfo(
# 53 1 ─ %1 = Base.add_int(%%x, %%y)::Any                                     │
#    └──      return %1                                                       │
# )

code_typed(+, (Int, Int))
# 1-element Array{Any,1}:
#  CodeInfo(
# 53 1 ─ %1 = Base.add_int(%%x, %%y)::Int64                                   │
#    └──      return %1                                                       │
# ) => Int64