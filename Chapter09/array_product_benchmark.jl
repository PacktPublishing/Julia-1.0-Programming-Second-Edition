# The following benchmarks demonstrate 
# that devectorising code can lead to substantial speed improvement
x = randn(10000000)
y = randn(10000000)

function inner(x, y)
    result = 0.0
    for i=1:length(x)
        result += x[i] * y[i]
    end
    result
end

# GC.enable(false) 
@time for i=1:50 result = sum(x .* y); end
# with 1 processor: Array operations took 89.43973046 ms - avg: 90 ms
# with 9 processors: 4.895387 seconds (336.22 k allocations: 3.742 GiB, 20.99% gc time)

@time for i=1:50 result = inner(x, y) end 
# 0.967685 seconds (14.13 k allocations: 746.626 KiB)

x = randn(1, 10000000)
y = randn(10000000, 1)

@time for i=1:50 result = x * y end
# 2.815247 seconds (927.43 k allocations: 44.635 MiB, 0.83% gc time)
