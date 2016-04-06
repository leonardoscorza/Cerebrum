class Broke_captcha < BaseModel
	def interpreter(params, client)
    	if not params.empty?
    		self.broken_metropolitan_api(params,client)
    	end
  	end

  	def broken_metropolitan_api(urlCaptcha, client)
	    urlBase = "#{self.configurations['metropolitan_url']}#{URI.escape(urlCaptcha.first)}"
	    p urlBase
	    begin
	   		resource = RestClient::Request.execute(:method => :get, :url => urlBase, :headers => {'X-Mashape-Key' => self.configurations['X_Mashape_Key']})
	    	results = JSON.parse(resource)["captcha"]
	    	self.response('console',results)
	    	results
	    rescue Exception => e
	    	p e
	      e
	    end
  	end

end
Broke_captcha.new __dir__
