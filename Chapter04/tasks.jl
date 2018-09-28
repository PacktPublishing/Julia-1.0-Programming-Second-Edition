function fib_producer(c::Channel)
    a, b = (0, 1)
    for i = 1:10
        put!(c, b)
        a, b = (b, a + b)
    end
end

chnl = Channel(fib_producer) #> Channel{Any}(sz_max:0,sz_curr:1)

take!(chnl) #> 1
take!(chnl) #> 1
take!(chnl) #> 2
take!(chnl) #> 3
take!(chnl) #> 5
take!(chnl) #> 8
take!(chnl) #> 13
take!(chnl) #> 21
take!(chnl) #> 34
take!(chnl) #> 55
# take!(chnl) #> ERROR: InvalidStateException("Channel is closed.", :closed)

for n in chnl
    println(n)
end
#> 1 1 1 2 3 5 8 13 21 34 55

chnl = @task fib_producer(c::Channel) # Task (runnable) @0x0000000005696d80

fac(i::Integer) = (i > 1) ? i*fac(i - 1) : 1
c = Channel(0)
task = @async foreach(i->put!(c,fac(i)), 1:5)
bind(c,task)
for i in c
   @show i
end
# i = 1
# i = 2
# i = 6
# i = 24
# i = 120