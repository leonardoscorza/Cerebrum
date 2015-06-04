class Weather < BaseModel
	def interpreter(params, client)
    	self.get params
  	end

    def get params
      res = RestClient::Request.execute(:method => :get, :url => "https://george-vustrey-weather.p.mashape.com/api.php?location=#{params.join('+')}", :headers => {"X-Mashape-Key" => self.configurations['MashapeKey']})
      partial = JSON.parse(res)
     
      results = ''
      partial.each do |p|
        results += "<br><b style='color:blue'>(#{p['day_of_week']}</b>) high: #{p['high_celsius']}°C - low: #{p['low_celsius']}°C - condition: #{p['condition']}"
      end
      response('console',results)
    end
end
Weather.new __dir__
