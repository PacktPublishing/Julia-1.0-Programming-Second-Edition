fname = "winequality.csv"

using DelimitedFiles
data = DelimitedFiles.readdlm(fname, ';')
# 1600x12 Array{Any,2}:
#    "fixed acidity"   "volatile acidity"  …    "alcohol"   "quality"
#   7.4               0.7                      9.4         5.0
#   7.8               0.88                     9.8         5.0
#   7.8               0.76                     9.8         5.0
#  11.2               0.28                     9.8         6.0

# variant:
data3 = DelimitedFiles.readdlm(fname, ';', Float64, '\n', header=true)
#> ([7.4 0.7 … 9.4 5.0; 7.8 0.88 … 9.8 5.0; … ; 5.9 0.645 … 10.2 5.0; 
# 6.0 0.31 … 11.0 6.0], 
# AbstractString["fixed acidity" "volatile acidity" … "alcohol" "quality"])

# extracting data:
row3 = data[3, :] # measurements for wine xyz
# 12-element Array{Any,1}: 7.8  0.88  0  2.6  0.098 25 67  0.9968  3.2  0.68  9.8  5
col3 = data[ :, 3]  # measurements of citric acid
# 1600-element Array{Any,1}:
# "citric acid"
# 0.0 0.0 0.04 0.56 0.0 0.0 ⋮ 0.08 0.08 0.1 0.13 0.12 0.47 ...
x = data[:, 2:4]
# 1600×3 Array{Any,2}:
#   "volatile acidity"   "citric acid"   "residual sugar"
#  0.7                  0               1.9
#  0.88                 0               2.6
#  0.76                 0.04            2.3
y = data[70:75, 2:4]
# 6x3 Array{Any,2}:
 # 0.32   0.57  2.0
 # 0.705  0.05  1.9
 # 0.63   0.08  1.9
 # 0.67   0.23  2.1
 # 0.69   0.22  1.9
 # 0.675  0.26  2.1
 z = [data[:,3] data[:,6] data[:,11]]
 # 1600x3 Array{Any,2}:
 #  "citric acid"    "free sulfur dioxide"    "alcohol"
 # 0.0             11.0                      9.4
 # 0.0             25.0                      9.8
 # 0.04            15.0                      9.8
 # 0.56            17.0                      9.8
 # ⋮
 # 0.08            32.0                     10.5
 # 0.1             39.0                     11.2
 # 0.13            29.0                     11.0
 # 0.12            32.0                     10.2
 # 0.47            18.0                     11.0
 
 # without headers:
 z = [data[2:end,3] data[2:end,6] data[2:end,11]]

 mutable struct Wine
    fixed_acidity::Array{Float64}
    volatile_acidity::Array{Float64}
    citric_acid::Array{Float64}
    #...define the other columns here
    quality::Array{Float64}
end
# wine1 = Wine(7.4, 0.7, 0, ..., 5)
# wine1 = Wine(data[1, :]...) # ... = splat-operator

data = z
# writing to csv file:
writedlm("partial.dat", data, ';')