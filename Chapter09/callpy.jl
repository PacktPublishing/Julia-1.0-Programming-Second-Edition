using PyCall
py"10*10"             #> 100
@pyimport math
math.sin(math.pi / 2) #> 1.0
