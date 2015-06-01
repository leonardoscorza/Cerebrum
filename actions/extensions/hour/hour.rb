class Hour < BaseModel
	def interpreter(params, client)
    	if not params.empty?
    		get_hour params.first, client
    	end
  	end

  	def get_hour place, client

  	end
end
Hour.new __dir__
