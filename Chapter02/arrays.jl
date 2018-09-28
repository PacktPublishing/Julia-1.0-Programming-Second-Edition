for i in 1:2:9
    println(i)
end #> 1 3 5 7 9

typeof(1:1000) #> UnitRange{Int64}

a = split("A,B,C,D",",")
typeof(a) #> Array{SubString{String},1}
show(a) #> SubString{String}["A","B","C","D"]

arr = [100, 25, 37]
arra = Any[100, 25, "ABC"] #> element type Any
arr[1] #> 100
arr[end] #> 37
# arr[6] 
#> ERROR: BoundsError: attempt to access 3-element Array{Int64,1} at index [6]
println(eltype(arr)) #> Int64
println(length(arr)) #> 3
println(ndims(arr)) #> 1
println(size(arr,1)) #> 3
println(size(arr)) #> (3,)

arr2 = Array{Int64}(undef, 5)
show(arr2) #> [1, 2, 3, 4, 5]
sizehint!(arr2, 10^5)

arr3 = Float64[] #> 0-element Array{Float64,1}
push!(arr3, 1.0) #> 1-element Array{Float64,1}

arr4 = collect(1:7) #> 7-element Array{Int64,1}
show(arr4) #> [1, 2, 3, 4, 5, 6, 7]

# for in loop and changing the array:
da = [1,2,3,4,5]
for n in da
    n *= 2
end
da #> 5-element Array{Int64,1}: 1 2 3 4 5
for i in 1:length(da)
    da[i] *= 2
end
da #> 5-element Array{Int64,1}: 2 4 6 8 10

arr4 = [1,2,3,4,5,6,7] #> 7-element Array{Int64,1}: [1,2,3,4,5,6,7]
join(arr4, ", ") #> "1, 2, 3, 4, 5, 6, 7"
arr4[1:3] # => [1, 2, 3]
arr4[4:end] # => [4, 5, 6, 7]

arr = [1,2,3,4,5]
arr[2:4] = [8,9,10]
println(arr) #> 1 8 9 10 5

zeros(5)
ones(4)
ones(3, 2)
eqa = range(0, step=10, length=5) #> 0:10:40
println()
show(eqa) #> 0:10:40
fill!(arr, 42) #> [42, 42, 42, 42, 42]
println()
println(Array{Any}(undef, 4)) #> Any[#undef,#undef,#undef,#undef]

v1 = rand(Int32, 5)
println(v1) #> Int32[1735276173,972339632,1303377282,1493859467,-788555652]

b = collect(1:7)
c = [100,200,300]
append!(b,c) # Now b is [1, 2, 3, 4, 5, 6, 7, 100, 200, 300]
pop!(b) #> 300, b is now [1, 2, 3, 4, 5, 6, 7, 100, 200]
push!(b, 42) # b is now [1, 2, 3, 4, 5, 6, 7, 100, 200, 42]
popfirst!(b) #> 1, b is now [2, 3, 4, 5, 6, 7, 100, 200, 42]
pushfirst!(b, 42) # b is now [1, 2, 3, 4, 5, 6, 7, 100, 200, 42]
splice!(b,8) #> 100, b is now [42, 2, 3, 4, 5, 6, 7, 200, 42]
in(42, b) #> true
in(43, b) #> false
println()
println("sorting:")
sort(b) #> [2,3,4,5,6,7,42,42,200], b is not changed
println(b) #> [42,2,3,4,5,6,7,200,42]
sort!(b) #> b is now changed to [2,3,4,5,6,7,42,42,200]
println(b) #> [2,3,4,5,6,7,42,42,200]
println()
arr = [1, 5, 3]
# looping
for e in arr
    print("$e ")
end # prints 1 5 3

arr = [1, 2, 3]
arr .+ 2 #> [3, 7, 5]
arr * 2 #> [2, 10, 6]
a1 = [1, 2, 3]
a2 = [4, 5, 6]
a1 .* a2 #> [4, 10, 18]

using LinearAlgebra
LinearAlgebra.dot(a1, a2) #> 32
sum(a1 .* a2)

repeat([1, 2, 3], inner = [2]) #> [1,1,2,2,3,3]

a = [1,2,4,6]
a1 = a
show(a1)
a[4] = 0
show(a) #> [1,2,4,0]
show(a1) #> [1,2,4,0]
b = copy(a)
b = deepcopy(a)

a = [1,2,3]
function change_array(arr)
	arr[2] = 25
end
change_array(a)
println(a) #>[ 1, 25, 3]

# the splat operator:
arr = ['a', 'b', 'c']
show(join(arr)) #> "abc"
show(string(arr)) #> "['a', 'b', 'c']" 
show(string(arr...)) #> "abc"