class Map < BaseModel
	def interpreter(params, client)
    	self.help __dir__
  	end
end
Map.new __dir__
