include("temperature_converter.jl")

println("$(TemperatureConverter.as_celsius(100, :Celsius))") #> 100
println("$(TemperatureConverter.as_celsius(100, :Kelvin))") #> 373
println("$(TemperatureConverter.kelvin_to_celsius(0))") #> 273