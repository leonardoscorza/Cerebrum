require 'rest-client'

class Currency < BaseModel
	def interpreter(params, client)
    	if params.shift == 'converter'
        currency_to = (params[2] == 'to')? params[3] : params[2]
    		self.converter params[0], params[1], currency_to
    		true
    	else
    		false
    	end
  	end

  	def converter ammount, currency_from, currency_to 
      p 'aqui', ammount, currency_from, currency_to
	    results = RestClient::Request.execute(:method => :get, :url => "https://currencyconverter.p.mashape.com/?from=#{currency_from}&from_amount=#{ammount}&to=#{currency_to}", :headers => {"X-Mashape-Key" => self.configurations['MashapeKey']})
	    partial = JSON.parse(results)["to_amount"]
	    if not partial.nil?
	    	total = "#{currency_to}:#{'%.3f' % partial}"
	    else
	    	total = "Problem in converter"
	    end
  		response('console',total)
  	end
end
Currency.new __dir__
