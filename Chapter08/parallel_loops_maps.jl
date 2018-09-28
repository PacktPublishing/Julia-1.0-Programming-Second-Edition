using Distributed
# parallel loops:
function buffon(n)
	hit = 0
	for i = 1:n
		mp = rand()
		phi = (rand() * pi) - pi / 2 # angle at which needle falls
		xright = mp + cos(phi)/2  # x-location of needle
		xleft = mp - cos(phi)/2
		# if xright >= 1 || xleft <= 0
		# 	hit += 1
		# end
		# Does needle cross either x == 0 or x == 1?
		p = (xright >= 1 || xleft <= 0) ? 1 : 0
		hit += p
	end
	miss = n - hit
	piapprox = n / hit * 2
end

@time buffon(100000)
#   0.208500 seconds (504.79 k allocations: 25.730 MiB, 7.10% gc time)
# 3.1441597233139444
@time buffon(100000000)
#   4.112683 seconds (5 allocations: 176 bytes)
# 3.141258861373451

function buffon_par(n)
	hit = @distributed (+) for i = 1:n
			mp = rand()
			phi = (rand() * pi) - pi / 2
			xright = mp + cos(phi)/2
			xleft = mp - cos(phi)/2
			(xright >= 1 || xleft <= 0) ? 1 : 0
		end
	miss = n - hit
	piapprox = n / hit * 2
end
@time buffon_par(100000)
#   1.058487 seconds (951.35 k allocations: 48.192 MiB, 2.04% gc time)
# 3.15059861373661

@time buffon_par(100000000)
#   0.735853 seconds (1.84 k allocations: 133.156 KiB)
# 3.1418106012575633

# arr is not correctly initialized:
arr = zeros(100000)
@distributed for i=1:100000
    arr[i] = i
end #> Task (queued) @0x00000000147ad430
#> arr only contains zeros!

# parallel maps:
using LinearAlgebra
function rank_marray()
	marr = [rand(1000,1000) for i=1:10]
	for arr in marr
	   println(rank(arr))
	end
end

@time rank_marray()
# 1000
# 1000
# 1000
# 1000
# 1000
# 1000
# 1000
# 1000
# 1000
# 1000
# 7.310404 seconds (91.33 k allocations: 162.878 MiB, 1.15% gc time)

function prank_marray()
	marr = [rand(1000,1000) for i=1:10]
	println(pmap(rank, marr))
end
@time prank_marray()
# {1000,1000,1000,1000,1000,1000,1000,1000,1000,1000}
# 5.966216 seconds (4.15 M allocations: 285.610 MiB, 2.15% gc time)