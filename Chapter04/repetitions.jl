coll = [1:50]
for e in coll
   # process(e) executed for every element e in coll
end

for n = 1:10  println(n^3)  end
for n = 1:10  
    println(n^3)  
end
# prints:
#1
#8
#27
#64
#125
#216
#343
#512
#729
#1000

# iterate over index:
arr = [x^2 for x in 1:10]
#10-element Array{Int64,1}:
#   1
#   4
#   9
#  16
#  25
#  36
#  49
#  64
#  81
# 100

for i = 1:length(arr)
   println("the $i-th element is $(arr[i])")
end
# the 1-th element is 1
# the 2-th element is 4
# the 3-th element is 9
# the 4-th element is 16
# the 5-th element is 25
# the 6-th element is 36
# the 7-th element is 49
# the 8-th element is 64
# the 9-th element is 81
# the 10-th element is 100

for (ix, val) in enumerate(arr)
   println("the $ix-th element is $val")
end
# 1 1
# 2 4
# 3 9
# 4 16
# 5 25
# 6 36
# 7 49
# 8 64
# 9 81
# 10 100

for n = 1:5
    for m = 1:5
        println("$n * $m = $(n * m)")
    end
end

for n = 1:5, m = 1:5
    println("$n * $m = $(n * m)")
end
#
#1 * 1 = 1
#1 * 2 = 2
#1 * 3 = 3
#1 * 4 = 4
#1 * 5 = 5
#2 * 1 = 2
#2 * 2 = 4
#2 * 3 = 6
#2 * 4 = 8
#2 * 5 = 10
#3 * 1 = 3
#3 * 2 = 6
#3 * 3 = 9
#3 * 4 = 12
#3 * 5 = 15
#4 * 1 = 4
#4 * 2 = 8
#4 * 3 = 12
#4 * 4 = 16
#4 * 5 = 20
#5 * 1 = 5
#5 * 2 = 10
#5 * 3 = 15
#5 * 4 = 20
#5 * 5 = 25

# while loop:
a = 10
b = 15
while a < b
    # process(a)
    println(a)
    global a += 1
end
# prints:
#10
#11
#12
#13
#14

# loop over array that is changing in the loop:
arr = [1,2,3,4]
while !isempty(arr)
    print(pop!(arr), ", ")
end
# => 4, 3, 2, 1,
# julia> arr
# 0-element Array{Int64,1}

# break:
a = 10
b = 150
while a < b
    # process(a)
    println(a)
    global a += 1
    if a >= 50
        break
    end
end

arr = rand(1:10, 10)
println(arr)
# get the index of search in an array arr:
searched = 4
for (ix, curr) in enumerate(arr)
    if curr == searched
        println("The searched element $searched occurs on index $ix")
        break
    end
end
#=
[8,4,3,6,3,5,4,4,6,6]
The searched element 4 occurs on index 2
=#

# continue:
for n in 1:10
    if 3 <= n <= 6
        continue # skip one iteration
    end
    println(n)
end