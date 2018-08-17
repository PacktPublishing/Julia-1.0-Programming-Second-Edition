a, b, c, d = 1, 22.0, "World", 'x'
a #> 1
b #> 22.0
c #> "World"
d #> 'x'
t1 = (1,22.0,"World",'x')
typeof(t1) #> Tuple{Int64,Float64,String,Char}
t2 = (1, 2, 3)
typeof(t2) #> Tuple{Int64,Int64,Int64}
() #> empty tuple
(1,) #> one element tuple
('z', 3.14)::Tuple{Char, Float64}

t3 = (5, 6, 7, 8)
t3[1] #> 5
t3[end] #> 8
t3[2:3] #> (6, 7)
# t3[5] #> BoundsError
# t3[3] = 9 #> Error: 'setindex' has no matching ...

author = ("Ivo", "Balbaert", 62)
author[2] #> "Balbaert"

for i in t3
    println(i)
end #> 5  6  7  8

#tuple unpacking:
a, b = t3 #> a is 5 and b is 6
first_name, last_name, age = author
# first_name has value "Ivo"
# last_name has value "Balbaert"
# age has value 62