require 'mongo'


class Memory
	@@db = ''

	def initialize(memory)
		#Connect a memory group
		conn = Mongo::Connection.new
		@@db = conn.db(memory)
	end

	def burn(memoryGroup, information)
		#Brun a new memory
	 	group = @@db.collection(memoryGroup)
	 	group.insert(information)
	end

	def remember(memoryGroup, partialInformation)
		#Remember any thing
		group = @@db.collection(memoryGroup)
		group.find(partialInformation).to_a
	end

end