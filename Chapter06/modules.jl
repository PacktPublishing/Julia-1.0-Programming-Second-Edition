module Package1

export Type1, perc

include("file1.jl")
include("file2.jl")

# code
mutable struct Type1
    total
end

perc(a::Type1) = a.total * 0.01

end