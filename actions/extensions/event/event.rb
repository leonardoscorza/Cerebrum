class Event < BaseModel
	def interpreter(params, client)
    	self.help __dir__
  	end
end
Event.new __dir__
