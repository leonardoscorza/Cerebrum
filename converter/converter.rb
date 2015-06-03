class Converter < BaseModel
	def interpreter(params, client)
    	self.help __dir__
  	end
end
Converter.new __dir__
