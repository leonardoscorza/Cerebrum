class Weather < BaseModel
	def interpreter(params, client)
    	self.now params
  	end

  	def now city
  		begin
  			response = RestClient.get "http://api.openweathermap.org/data/2.5/weather?q=#{URI.escape(city.join(' '))}"
  			weather_j = JSON.parse(response)
  			results = {
  							temp: self.k_to_c(weather_j['main']['temp']),
  							temp_max: self.k_to_c(weather_j['main']['temp_max']),
							temp_min: self.k_to_c(weather_j['main']['temp_min']),
							humidity: weather_j['main']['humidity'],
							wind_speed: weather_j['wind']['speed'],
							wind_deg:   weather_j['wind']['deg']
  			           }
  			self.response('console',results)
  		rescue Exception => e
  			p e
  			self.help
  		end
  	end

    def here
      true
    end

  	def k_to_c kelvin
  		"#{kelvin - 273.15}ºC"
  	end
end
Weather.new __dir__
