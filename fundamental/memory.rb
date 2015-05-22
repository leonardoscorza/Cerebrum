require 'mongo'
require 'json'

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
			group  = @@db.collection(memoryGroup)
			cursor = group.find(partialInformation)
			answer = {}
			cursor.map { |h| answer = h }
			answer
		rescue
			#I can't remember
			nil
		end
	end

	def rememberAll(memoryGroup)
		#Remember any thing
		begin
			group  = @@db.collection(memoryGroup)
			cursor = group.find({})
			answer = []
			cursor.each do |c|
				c.delete "_id"
				answer.push(c)			
			end
			answer
		rescue
			#I can't re
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

	#Forgot a information
	def forgotAll(memoryGroup)
		#Forgot any thing
		begin
			@@db.collection(memoryGroup).drop()
		rescue
			#I can't remember for this i can't forgot
			nil
		end
	end

end