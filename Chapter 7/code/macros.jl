# Example 1:
macro macint(ex)
    quote
        println("start")
        $ex
        println("after")
    end
end

@macint println("Where am I?")
#start
#Where am I?
#after

# Example 1B:
macro duplicate(ex)
    quote
        $ex
        $ex
    end
end

@duplicate println(sin(42))
# -0.9165215479156338
# -0.9165215479156338

# Example 2:
macro assert(ex)
    :($ex ? nothing : error("Assertion failed: ", $(string(ex))))
end

@assert 1 == 1.0
# @assert 1 == 42 #> ERROR: Assertion failed: 1 == 42

# Example 3:
macro unless(test, branch)
    quote
        if !$test
            $branch
        end
    end
end

arr = [3.14, 42, 'b']
@unless 41 in arr println("arr does not contain 41")
#> array does not contain 41
@unless 42 in arr println("arr does not contain 42") #> nothing
@unless isempty(arr) println("array arr has elements")
#> array arr has elements

macroexpand(Main, :(@unless 41 in arr println("arr does not contain 41")) )
quote
    #= REPL[49]:3 =#
    if !(41 in Main.arr)
        #= REPL[49]:4 =#
        (Main.println)("arr does not contain 41")
    end
end

# Example 4:
arr = ["a", "b", "c"]
macro convarr(arr, T)
    :(reshape($T[$arr...], size($arr)...))
end
@convarr arr Symbol #> returns 3-element Array{Symbol,1} :a :b :c

# Example 5:
@time factorial(10)
#>   0.023171 seconds (15.36 k allocations: 797.196 KiB)
# 3628800

using Printf
macro timeit(ex)
    quote
        local t0 = time()   # local necessary to not conflict with outside
        local val = $(esc(ex))     # variables; esc makes sure ex is not
        local t1 = time()   # expanded, but is used literally
        print("elapsed time in seconds: ")
        @printf "%.3f" t1 - t0
        val
    end
end

@timeit factorial(10) #> elapsed time in seconds: 0.0003628800
@timeit factorial(15) #> elapsed time in seconds: 0.0001307674368000
a = 42
@timeit a^3 #> elapsed time in seconds: 0.00074088

# Example 6:
macro bench(f)
    quote
        median([@elapsed sleep($f) for x=1:10])
    end
end

@bench 0.1 #> 0.1010291465
@bench 0.2 #> 0.20101891449999998
@bench 0.5 #> 0.501034175