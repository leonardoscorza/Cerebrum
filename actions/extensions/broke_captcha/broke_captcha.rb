class Broke_captcha < BaseModel
	def interpreter(params, client)
    	if not params.empty?
    		self.broken_metropolitan_api(params,client)
    	end
  	end

  	def broken_metropolitan_api(urlCaptcha, client)
	    urlBase = "#{self.configurations[metropolitan_url]}#{urlCaptcha}"
	    resource = RestClient::Request.execute(:method => :get, :url => urlBase, :headers => {'X-Mashape-Key' => self.configurations['X_Mashape_Key']})

	    begin
	    	results = JSON.parse(resource)["captcha"]
	    	if client == 'console'
	    		self.response('console',results)
	    	end
	    	results
	    rescue Exception => e
	      e
	    end
  	end

end
Broke_captcha.new __dir__
