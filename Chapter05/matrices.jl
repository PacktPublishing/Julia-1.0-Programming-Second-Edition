[1, 2, 3]
[1 2 3]
[1; 2; 3]
# 3-element Array{Int64,1}:
#  1
#  2
#  3

Array{Int64, 1} == Vector{Int64} #> true
Array{Int64, 2} == Matrix{Int64} #> true

[1 2] * [3 ; 4] #> 11
[1 2] .* [3 ; 4]
# 2 Array{Int64,2}:
#  3  6
#  4  8 

matrix1 = [1 2; 3 4]
matrix1[2, 1] #> 3
matrix2 = [5 6; 7 8]
println(matrix1 * matrix2) 
#=
[19 22
 43 50]
=#

ma1 = rand(3, 5)
ndims(ma1) #> 2
size(ma1) #> (3, 5)
nrows, ncols = size(ma1)
size(ma1,1) #> 3
size(ma1,2) #> 5
length(ma1) #> 15

using LinearAlgebra
idm = Matrix(1.0*I, 3, 3)
idm[1:end, 2] #> 2nd column
idm[2, :] #> 2nd row
idmc = idm[2:end, 2:end]
#2x2 Array{Float64,2}:
# 1.0  0.0
# 0.0  1.0
idm[2, :] .= 0
# idm
# 3x3 Array{Float64,2}:
# 1.0  0.0  0.0
# 0.0  0.0  0.0
# 0.0  0.0  1.0
idm[2:end, 2:end] = [ 5 7 ; 9 11]
# idm
# 3x3 Array{Float64,2}:
# 1.0  0.0  0.0
# 0.0  5.0  7.0
# 0.0  9.0  11.0

a = [1 2;3 4]
# 2 Array{Int64,2}:
#  1  2
#  3  4

a[:]
# 4-element Array{Int64,1}:
# 1
# 3
# 2
# 4

jarr = (Array{Int64, 1})[]
push!(jarr, [1,2])
push!(jarr, [1,2,3,4])
push!(jarr, [1,2,3])
jarr #>
#3-element Array{Array{Int64,1},1}:
# [1,2]
# [1,2,3,4]
# [1,2,3]

ma = [1 2; 3 4]
ma[:]
# 4-element Array{Int64,1}:
#  1
#  3
#  2
#  4
ma' #> [1 3; 2 4]
ma * ma' #>
#5    11
#11  25
ma .* ma' #> 2x2 Array{Int64,2}:
#1   6
#6  16

inv(ma) #> 2x2 Array{Float64,2}:
# -2.0   1.0
# 1.5   -0.5

ma * inv(ma) #> 2x2 Array{Float64,2}:
# 1.0          0.0
# 8.88178e-16  1.0

v = [1.,2.,3.] #> equivalent to v = [1.0,2.0,3.0]
w = [2.,4.,6.]
append!(v, w)
#6-element Array{Float64,1}:
# 1.0
# 2.0
# 3.0
# 2.0
# 4.0
# 6.0
v = [1.,2.,3.]
hcat(v,w)
# 3x2 Array{Float64,2}:
#  1.0  2.0
#  2.0  4.0
#  3.0  6.0
vcat(v,w)
# 6-element Array{Float64,1}:
#  1.0
#  2.0
#  3.0
#  2.0
#  4.0
#  6.0

a = [1 2; 3 4]
# 2x2 Array{Int64,2}:
#  1  2
#  3  4

b = [5 6; 7 8]
# 2x2 Array{Int64,2}:
#  5  6
#  7  8

c = [a b]
# 2x4 Array{Int64,2}:
#  1  2  5  6
#  3  4  7  8

c = [a; b]
# 4x2 Array{Int64,2}:
#  1  2
#  3  4
#  5  6
#  7  8

c = [a, b]
# 4x2 Array{Int64,2}:
#  1  2
#  3  4
#  5  6
#  7  8

reshape(1:12, 3, 4)
# 3x4 Array{Int64,2}:
#  1  4  7  10
#  2  5  8  11
#  3  6  9  12

a = rand(3, 3)
# 3x3 Array{Float64,2}:
#  0.332401   0.499608  0.
#  0.0933291  0.132798  0.
#  0.722452   0.932347  0.

reshape(a, (9,1))
# 9x1 Array{Float64,2}:
#  0.332401
#  0.0933291
#  0.722452
#  0.499608
#  0.132798
#  0.932347
#  0.355623
#  0.967591
#  0.809577

# reshape(a, (2,2))
# ERROR: DimensionMismatch("new dimensions (2,2) must be consistent with array size 9")

# copy and deepcopy:
x = Array{Any}(undef, 2) #> 2-element Array{Any,1}: #undef #undef
x[1] = ones(2) #> 2-element Array{Float64} 1.0 1.0
x[2] = trues(3) #> 3-element BitArray{1}: true true true
x #> 2-element Array{Any,1}: [1.0,1.0] Bool[true,true,true]
a = x #> 2-element Array{Any,1}: [1.0,1.0] Bool[true,true,true]
b = copy(x) #> 2-element Array{Any,1}: [1.0,1.0] Bool[true,true,true]
c = deepcopy(x) #> 2-element Array{Any,1}: [1.0,1.0] Bool[true,true,true]
x[1] = "Julia"
x[2][1] = false
x #> 2-element Array{Any,1}: "Julia" Bool[false,true,true]
a #> 2-element Array{Any,1}: "Julia" Bool[false,true,true]
isequal(a, x) #> true, a is identical to x
b #> 2-element Array{Any,1}: [1.0,1.0] Bool[false,true,true]
isequal(b, x) #> false, b is a shallow copy of x
c #> 2-element Array{Any,1}: [1.0,1.0] Bool[true,true,true]
isequal(c, x) #> false