e1 = Expr(:call, *, 3, 4) #> :((*)(3,4))
eval(e1) #> 12

# e1 = Expr(:call, *, 3, a) #> ERROR: UndefVarError: a not defined
e2 = Expr(:call, *, 3, :a) #> :((*)(3,a))
# eval(e2) #> ERROR: UndefVarError: a not defined
a = 4 #> 4
eval(e2) #> 12

# b #> ERROR: UndefVarError: b not defined
e3 = :(b = 1)
eval(e3) #> 1
b #> 1

e4 = :(a + b) #> :(a + b)
e5 = :($a + b) #> :(4 + b)
eval(e4) #> 5
eval(e5) #> 5