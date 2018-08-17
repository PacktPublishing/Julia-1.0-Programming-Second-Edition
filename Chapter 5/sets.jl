s = Set([11, 14, 13, 7, 14, 11]) 
#> Set([7, 14, 13, 11])

# empty set:
Set() #> Set(Any[])

s1 = Set([11, 25]) 
s2 = Set([25, 3.14]) 
union(s1, s2) #> Set([3.14, 25.0, 11.0])
intersect(s1, s2) #> Set([25])
setdiff(s1, s2) #> Set([11])
setdiff(s2, s1) #> Set([3.14])
issubset(s1, s2) #> false
issubset(s1, Set([11, 25, 36])) #> true 

push!(s1, 32) #> Set([25,32,11])
in(32, s1) #> true
in(100, s1) #> false

s1 = Set([1,2,3]) #> Set([2,3,1]) 
typeof(s1) #> Set{Int64}
Set([[1,2,3]]) #> Set(Array{Int64,1}[[1, 2, 3]])

x = Set([1:100])
@time 2 in x # 0.014211 seconds (20.64 k allocations: 1.038 MiB)
x2 = Set([1:1000000])
@time 2 in x2 # 0.000003 seconds (4 allocations: 160 bytes)