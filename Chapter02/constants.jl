const GC = 6.67e-11 # gravitational constant in m3/kg s2

GC = 3.14 #> Warning: redefining constant GC
# GC = 10 #> ERROR: invalid redefinition of constant GC

const ARR = [4,7,1]
ARR[1] = 9
show(ARR) #> [9,7,1]
println()
ARR = [1, 2, 3] #> Warning: redefining constant ARR