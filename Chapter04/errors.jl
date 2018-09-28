arr = [1,2,3]
# arr[0] #> causes a program stop with: ERROR: BoundsError()
# sqrt(-3) #>  causes an ERROR: DomainError: sqrt with -3.0:
# sqrt will only return a complex result if called with a complex argument.
sqrt(complex(-3)) #> 0.0 + 1.7320508075688772im

mutable struct CustomException <: Exception 
end

# throw:
codes = ["AO", "ZD", "SG", "EZ"]
# code = "AR"
code = "AO"
if code in codes # in(code, codes)
    println("This is an acceptable code")
else
    throw(DomainError())
end

# error:
function sqroot(n::Int)
    n >= 0 || error("n must be non-negative")
    n == 0 && return 0
    sqrt(n)
end
sqroot(4) #> 2.0
sqroot(0) #> 0.0
# sqroot(-6) #> ERROR: n must be non-negative

# try / catch
a = []
try
    pop!(a)
catch ex
    println(typeof(ex))  #> ArgumentError
    backtrace()
    showerror(stdout, ex) #> ArgumentError: array must be non-empty
end

try
# try this code
catch ex
    if isa(ex, DomainError)
# do this
    elseif isa(ex, BoundsError)
# do this
    end
end

ret =   try
            global a = 4 * 2
        catch ex
        end
println(ret) #> 8

# finally
try
    global f = open("file1.txt", "r") #> IOStream(<file file1.txt>)
    # operate on file f, for example:
    # alternative: open("file1.txt", "r") do f
    k = 0
    while(!eof(f))
        a=readline(f)
        println(a)
        k += 1    
    end
    println("\nNumber of lines in file: $k")
catch ex
finally
    close(f)
end


