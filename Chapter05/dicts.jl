d1 = Dict(1 => 4.2, 2 => 5.3) 
# Dict{Int64,Float64} with 2 entries:
#   2 => 5.3
#   1 => 4.2
d1 = Dict{Int64,Float64}(1 => 4.2, 2 => 5.3)
d1 = [1 => 4.2, 2 => 5.3]
# 2-element Array{Pair{Int64,Float64},1}:
#  1 => 4.2
#  2 => 5.3

d2 = Dict{Any,Any}("a"=>1, (2,3)=>true) 

d3 = Dict(:A => 100, :B => 200)
# Dict{Symbol,Int64} with 2 entries:
#   :A => 100
#   :B => 200
d3 = Dict{Symbol,Int64}(:A => 100, :B => 200)
d3[:B] #> 200
# d3[:Z] #> ERROR: KeyError: key :Z not found
get(d3, :Z, 999) #> 999

d3[:A] = 150 #> d3 is now [:A => 150, :B => 200]
d3[:C] = 300 #> d3 is now [:A => 150, :B => 200, :C => 300]
length(d3) #> 3
# d3["CVO"] = 500 #> ERROR: KeyError: key "CVO" not found 
# d3[:CVO] = "Julia" #> ERROR: KeyError: key "CVO" not found

dmus = Dict{Symbol,String}(:first_name => "Louis", :surname => "Armstrong", :occupation => "musician",  
 		 :date_of_birth => "4/8/1901")
# Dict{Symbol,String} with 4 entries:
#   :date_of_birth => "4/8/1901"
#   :occupation    => "musician"
#   :surname       => "Armstrong"
#   :first_name    => "Louis"

haskey(d3, :Z) #> false
haskey(d3, :B) #> true

d4 = Dict() #> Dict{Any,Any} with 0 entries
d4["lang"] = "Julia"

d5 = Dict{Float64, Int64}() #> Dict{Float64,Int64} with 0 entries
# d5["c"] = 6 #> ERROR: MethodError: `convert` has no method matching convert(::Type{Float64}, ::ASCIIString)

d3 = Dict(:A => 100, :B => 200) 
delete!(d3, :B) #> Dict{Symbol,Int64} with 1 entry:  :A => 100

d3 = Dict(:A => 100, :B => 200) 
ki = keys(d3) #> KeyIterator
for k in ki
   println(k)
end #> A   B
:A in ki #> true
:Z in ki #> false

collect(keys(d3)) #> 2-element Array{Symbol,1}:
#  :A
#  :B
vi = values(d3) #> ValueIterator
for v in values(d3)
    println(v)
end #> 100  200

keys1 = ["J.S. Bach", "Woody Allen", "Barack Obama"]
values1 = [ 1685, 1935, 1961]
d5 = Dict(zip(keys1, values1))
#>
# Dict{String,Int64} with 3 entries:
#   "J.S. Bach"    => 1685
#   "Woody Allen"  => 1935
#   "Barack Obama" => 1961

for (k, v) in d5
  println("$k was born in $v")
end
for p in d5
  println("$(p[1]) was born in $(p[2])")
end
#J.S. Bach was born in 1685
#Barack Obama was born in 1961
#Woody Allen was born in 1935

capitals = Dict{String, String}("France"=> "Paris", "China"=>"Beijing")
# Dict{String,String} with 2 entries:
#   "China"  => "Beijing"
#   "France" => "Paris"

# neat tricks:
dict = Dict("a" => 1, "b" => 2, "c" => 3) 
arrkey = [key for (key, value) in dict] #> 3-element Array{String,1}: "a" "b" "c"
# same as collect(keys(dict)) 
arrval = [value for (key, value) in dict] #> 3-element Array{Int64,1}: 1 2 3
# same as collect(values(dict))
