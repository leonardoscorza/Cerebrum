class Hack < BaseModel
	def interpreter(params, client)
    	self.help __dir__
  	end
end
Hack.new __dir__
