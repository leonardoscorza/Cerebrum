require 'mongo'

class Memory < BaseModel
	@@db = ''

	def initialize(memory)
		conn = Mongo::Connection.new
		@@db = conn.db(memory)
	end

	def save_know know_description
		exist = self.remember('knowledge', {:know => know_description[:know] } )
	    if exist == {}
	      self.burn('knowledge',know_description)
	    end
  	end

	def burn(memoryGroup, information)
	 	begin
		 	group = @@db.collection(memoryGroup)
		 	group.insert(information)
		 	true
	 	rescue
	 		nil
	 	end
	end

	def remember(memoryGroup, partialInformation)
		begin
			group  = @@db.collection(memoryGroup)
			cursor = group.find(partialInformation)
			answer = {}
			cursor.map { |h| answer = h }
			answer
		rescue
			nil
		end
	end

	def rememberAll(memoryGroup)
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
			nil
		end
	end


	def forgot(memoryGroup, partialInformation)
		begin
			group = @@db.collection(memoryGroup)
			group.remove(partialInformation)
		rescue
			nil
		end
	end

	def forgotAll(memoryGroup)
		begin
			@@db.collection(memoryGroup).drop()
		rescue
			nil
		end
	end

end

$memory = Memory.new('brainMemory')