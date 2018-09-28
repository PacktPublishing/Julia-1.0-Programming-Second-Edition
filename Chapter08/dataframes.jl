using DataFrames, Missings, CSV

# constructing a DataFrame:
df = DataFrame()
df[:Col1] = 1:4
df[:Col2] = [exp(1), pi, sqrt(2), 42]
df[:Col3] = [true, false, true, false]
show(df)
# 4x3 DataFrame
# | Row | Col1 | Col2    | Col3  |
# |-----|------|---------|-------|
# | 1   | 1    | 2.71828 | true  |
# | 2   | 2    | 3.14159 | false |
# | 3   | 3    | 1.41421 | true  |
# | 4   | 4    | 42.0    | false |

df = DataFrame(Col1 = 1:4, Col2 = [exp(1), pi, sqrt(2), 42], Col3 = [true, false, true, false])

# columns:
show(df[2])
#> [2.718281828459045,3.141592653589793,1.4142135623730951,42.0]
show(df[:Col2]) #> same output

# rows:
show(df[1, :])  #> 1st row
# 1x3 DataFrame
# | Row | Col1 | Col2    | Col3 |
# |-----|------|---------|------|
# | 1   | 1    | 2.71828 | true |
show(df[2:3, :]) #> 2nd and 3rd row:
# 2x3 DataFrame
# | Row | Col1 | Col2    | Col3  |
# |-----|------|---------|-------|
# | 1   | 2    | 3.14159 | false |
# | 2   | 3    | 1.41421 | true  |
show(df[2:3, :Col2]) #> 2nd and 3rd row, only 2nd column:
# [3.141592653589793,1.4142135623730951]
df[2:3, [:Col2, :Col3]] #> 2nd and 3rd row, 2nd and 3rd column:
# 2x2 DataFrame
# | Row | Col2    | Col3  |
# |-----|---------|-------|
# | 1   | 3.14159 | false |
# | 2   | 1.41421 | true  |
head(df)

df0 = DataFrame(i = 1:10, x = rand(10), y = rand(["a", "b",  "c"], 10))
head(df0)

tail(df)

names(df)
# 3-element Array{Symbol,1}:
#  :Col1
#  :Col2
#  :Col3
eltypes(df)
# 3-element Array{Type{T<:Top},1}:
 # Int64
 # Float64
 # Bool

describe(df)
# 3×8 DataFrame
# │ Row │ variable │ mean    │ min     │ median  │ max  │ nunique │ nmissing │ eltype  │
# ├─────┼──────────┼─────────┼─────────┼─────────┼──────┼─────────┼──────────┼─────────┤
# │ 1   │ Col1     │ 2.5     │ 1       │ 2.5     │ 4    │         │          │ Int64   │
# │ 2   │ Col2     │ 12.3185 │ 1.41421 │ 2.92994 │ 42.0 │         │          │ Float64 │
# │ 3   │ Col3     │ 0.5     │ false   │ 0.5     │ true │         │          │ Bool    │

fname = "winequality.csv"
data = CSV.read(fname, delim = ';')
# 1599x12 DataFrame
# | Row  | fixed_acidity | volatile_acidity | citric_acid | residual_sugar |
# |------|---------------|------------------|-------------|----------------|
# | 1    | 7.4           | 0.7              | 0.0         | 1.9            |
# | 2    | 7.8           | 0.88             | 0.0         | 2.6            |
# | 3    | 7.8           | 0.76             | 0.04        | 2.3            |
# ⋮
# | 1596 | 5.9           | 0.55             | 0.1         | 2.2            |
# | 1597 | 6.3           | 0.51             | 0.13        | 2.3            |
# | 1598 | 5.9           | 0.645            | 0.12        | 2.0            |
# | 1599 | 6.0           | 0.31             | 0.47        | 3.6            |

# | Row  | chlorides | free_sulfur_dioxide | total_sulfur_dioxide | density |
# |------|-----------|---------------------|----------------------|---------|
# | 1    | 0.076     | 11.0                | 34.0                 | 0.9978  |
# | 2    | 0.098     | 25.0                | 67.0                 | 0.9968  |
# | 3    | 0.092     | 15.0                | 54.0                 | 0.997   |
# ⋮
# | 1596 | 0.062     | 39.0                | 51.0                 | 0.99512 |
# | 1597 | 0.076     | 29.0                | 40.0                 | 0.99574 |
# | 1598 | 0.075     | 32.0                | 44.0                 | 0.99547 |
# | 1599 | 0.067     | 18.0                | 42.0                 | 0.99549 |

# | Row  | pH   | sulphates | alcohol | quality |
# |------|------|-----------|---------|---------|
# | 1    | 3.51 | 0.56      | 9.4     | 5       |
# | 2    | 3.2  | 0.68      | 9.8     | 5       |
# | 3    | 3.26 | 0.65      | 9.8     | 5       |
# ⋮
# | 1596 | 3.52 | 0.76      | 11.2    | 6       |
# | 1597 | 3.42 | 0.75      | 11.0    | 6       |
# | 1598 | 3.57 | 0.71      | 10.2    | 5       |
# | 1599 | 3.39 | 0.66      | 11.0    | 6       |
typeof(data) # DataFrame
size(data) # (1599,12)
data[:density]
# 1599-element DataArray{Float64,1}:
#  0.9978
#  0.9968
#  0.997
#  0.998
#  ⋮
#  0.99512
#  0.99574
#  0.99547
#  0.99549
CSV.write("dataframe1.csv", df,  delim = ';')

# queries:
# the quality for all wines:
data[:quality]
# give the wines with alcohol % = 9.5
show(data[ data[:alcohol].== 9.5, :])
# count the number of wines grouped by quality
show(by(data, :quality, data -> size(data, 1)))
# 6x2 DataFrame
# | Row | quality | x1  |
# |-----|---------|-----|
# | 1   | 3       | 10  |
# | 2   | 4       | 53  |
# | 3   | 5       | 681 |
# | 4   | 6       | 638 |
# | 5   | 7       | 199 |
# | 6   | 8       | 18  |
_, count = hist(data[:quality])
#>  count 6-element Array{Int64,1}:  10 53 681 638 199 18
class = sort(unique(data[:quality]))
#> 6-element DataArray{Int64,1}: 3 4 5 6 7 8
df_quality = DataFrame(qual=class, no=count)
# 6x2 DataFrame
# | Row | qual | no  |
# |-----|------|-----|
# | 1   | 3    | 10  |
# | 2   | 4    | 53  |
# | 3   | 5    | 681 |
# | 4   | 6    | 638 |
# | 5   | 7    | 199 |
# | 6   | 8    | 18  |
