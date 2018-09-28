a = 5
b = 2a^2 + 30a + 9

using PyPlot
x = range(0,stop=5,length=101)
y = cos.(2x .+ 5)
plot(x, y, linewidth=2.0, linestyle="--")
title("a nice cosinus")
xlabel("x axis")
ylabel("y axis")
