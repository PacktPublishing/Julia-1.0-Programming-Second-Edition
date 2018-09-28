module TemperatureConverter

	function as_celsius(temperature, unit)
		if unit == :Celsius
			return temperature
		elseif unit == :Kelvin
			return kelvin_to_celsius(temperature)
		end
	end

	function kelvin_to_celsius(temperature)
		# 'private' function
		return temperature + 273
	end

end
