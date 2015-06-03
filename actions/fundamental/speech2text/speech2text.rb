class Speech2text < BaseModel
	def interpreter(params, client)
    	self.help __dir__
  	end
end
Speech2text.new __dir__
