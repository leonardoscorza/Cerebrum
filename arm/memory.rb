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
	 	begin
		 	group = @@db.collection(memoryGroup)
		 	group.insert(information)
		 	#I learn
		 	true
	 	rescue
	 		#I can't learn this
	 		nil
	 	end
	end

	def remember(memoryGroup, partialInformation)
		#Remember any thing
		begin
			group = @@db.collection(memoryGroup)
			group.find(partialInformation).to_a
		rescue
			#I can't remember
			nil
		end
	end

	#Forgot a information
	def forgot(memoryGroup, partialInformation)
		#Forgot any thing
		begin
			group = @@db.collection(memoryGroup)
			group.remove(partialInformation)
		rescue
			#I can't remember for this i can't forgot
			nil
		end
	end

end