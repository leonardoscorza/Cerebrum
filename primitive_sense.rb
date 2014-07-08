require 'rubygems'
require 'redis'


class PrimitiveSense
	@@requeue = ""

	def initialize
		@@requeue = Redis.new
	end

	#Listen for shell name (!)
	def listen
		@@requeue.rpop('!')
	end

	#expressed their wishes (what) to member (who)
	def speak(who, what)
		@@requeue.lpush(who, what)
	end
end
