class Broke_captcha < BaseModel
	def interpreter(params, client)
    	if not params.empty?
    		self.broken_metropolitan_api(params,client)
    	end
  	end

  	def broken_metropolitan_api(urlCaptcha, client)
	    urlBase = "#{self.configurations['metropolitan_url']}#{urlCaptcha}"
	    begin
	    	resource = RestClient::Request.execute(:method => :get, :url => urlBase, :headers => {'X-Mashape-Key' => self.configurations['X_Mashape_Key']})
	    rescue Exception => e
	    	p e
	    end
	    p urlBase, :method => :get, :url => urlBase, :headers => {'X-Mashape-Key' => self.configurations['X_Mashape_Key']}
	    begin
	    	results = JSON.parse(resource)["captcha"]
	    	self.response('console',results)
	    	results
	    rescue Exception => e
	      e
	    end
  	end

end
Broke_captcha.new __dir__
