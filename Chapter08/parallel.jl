using Distributed
# start the following on the command line:
# julia -p n  # starts n processes on the local machine
# julia -p 8  # starts REPL with 8 workers
workers()
# 8-element Array{Int64,1}:
#   2
#   3
#   4
#   5
#   ⋮
#   8
#   9

# iterate over workers:
for pid in workers()
	# do something with pid
end
myid() # 1
addprocs(5)
# 5-element Array{Any,1}:
#  10
#  11
#  12
#  13
#  14
nprocs() # 14
rmprocs(3) #> Task (done) @0x0000000012f8f0f0
# worker with id 3 is removed

# cluster of computers:
# julia --machinefile machines driver.jl 
# Run processes specified in driver.jl on hosts listed in machines

# primitive operations with processes:
r1 = remotecall(x -> x^2, 2, 1000) #> Future(2, 1, 15, nothing)
fetch(r1) #> 1000000

remotecall_fetch(sin, 5, 2pi) # -2.4492935982947064e-16

r2 = @spawnat 4 sqrt(2) #> Future(4, 1, 18, nothing)
# lets worker 4 calculate sqrt(2)
fetch(r2)  #> 1.4142135623730951
r = [@spawnat w sqrt(5) for w in workers()]
# or in a freshly started REPL:
# r = [@spawnat i sqrt(5) for i=1:length(workers())]
# 12-element Array{Future,1}:
#  Future(2, 1, 20, nothing)
#  Future(4, 1, 21, nothing)
#  Future(5, 1, 22, nothing)
#  Future(6, 1, 23, nothing)
#  Future(7, 1, 24, nothing)
#  Future(8, 1, 25, nothing)
#  Future(9, 1, 26, nothing)
#  Future(10, 1, 27, nothing)
#  Future(11, 1, 28, nothing)
#  Future(12, 1, 29, nothing)
#  Future(13, 1, 30, nothing)
#  Future(14, 1, 31, nothing)
r3 = @spawn sqrt(5) #> Future(2, 1, 32, nothing)
fetch(r3) #> 2.23606797749979

# using @everywhere to make functions available to all workers:
@everywhere w = 8
@everywhere println(myid()) 
# 1
#       From worker 14:   14
#       From worker 8:    8
#       From worker 10:   10
#       From worker 7:    7
#       From worker 2:    2
#       From worker 4:    4
#       From worker 12:   12
#       From worker 9:    9
#       From worker 11:   11
#       From worker 6:    6
#       From worker 13:   13
#       From worker 5:    5

x = 5 #> 5
@everywhere println(x) #> 5
#   # exception on worker 2: ERROR: UndefVarError: x not defined ...
#        ...and 11 more exception(s)

@everywhere include("defs.jl")
@everywhere function fib(n)
	if (n < 2) 
		return n
	else 
		return fib(n-1) + fib(n-2)
	end
end

r2 =  @spawnat 2 fib(10)
# Future(2, 1, 70, nothing)
fetch(r2)
# 55

include("functions.jl")

# broadcast data to all workers:
d = "Julia"
for pid in workers()
   remotecall(x -> (global d; d = x; nothing), pid, d)
end