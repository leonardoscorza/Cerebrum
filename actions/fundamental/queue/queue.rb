require 'redis'

class Queue
	@requeue = ""

	def initialize
		@requeue = Redis.new
		# @dir = dir
  #   	self.actions_array
	end

	# def interpreter
		
	# end

	#Listen for shell name (!)
	def listen
		@requeue.rpop('!')
	end

	#expressed their wishes (what) to member (who)
	def speak(who, what)
		@requeue.lpush(who, what)
	end
end

# Queue.new __dir__