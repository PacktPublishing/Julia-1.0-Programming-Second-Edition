# this script does not run as a whole 
# (the code snippets are for demo-purposes only, 
# and should be used on their own, and/or in the REPL
# on Julia prompt:
# julia> stdin
# Base.TTY(Base.Libc.WindowsRawSocket(0x000000000000027c) open, 0 bytes waiting)
# julia> stdout
# Base.TTY(Base.Libc.WindowsRawSocket(0x0000000000000280) open, 0 bytes waiting)

# read(stdin, Char)
write(stdout, "Julia") #> Julia5
# read(stdin,3)
# readline(stdin)
# input:  # Julia
# output: # "Julia\r\n" (Windows) - "Julia\n" (Linux)

# stream can be stdin or any other input stream:
stream = stdin
for line in eachline(stream)
    println("Found $line")
end

while !eof(stream)
    x = read(stream, Char)
    println("Found: $x")
end


function process(item)
    # do the processing
end

# files:
fieldnames(IOStream)
#> (:handle, :ios, :name, :mark)

IOStream.types
#> svec(Ptr{Nothing}, Array{UInt8,1}, AbstractString, Int64)

# reading:
fname = "example.dat"
f1 = open(fname)
# IOStream(<file example.dat>)

data = readlines(f1)
# 3-element Array{String,1}:
#  "this is line 1."
#  "42; 3.14"
#  "this is line 3." 

for line in data
	println(line)
	process(line) 
end
close(f1)

open(fname) do file
    process(file)
end

open(fname) do file
    for line in eachline(file)
        print(line) 
        process(line)
    end
end

# writing:
fname = "example2.dat"
f2 = open(fname, "w")
write(f2, "I write myself to a file\n") #> 24
println(f2, "even with println!")
close(f2)

# looping over all files in a folder:
for file in readdir()
    process(file)
end

# example:
mydir = pwd();
cd("..")

for fn in readdir()
    println(fn)
end
# possible output:
#  .DS_Store
# .git
# Chapter 1
# Chapter 2
# Chapter 3
# Chapter 4
# Chapter 5
# Chapter 6
# Chapter 7
# Chapter 8
# Chapter 9
# LICENSE
# README.md 

cd(mydir)
