require 'rubygems'
require 'rufus/scheduler'

class Schedule < BaseModel
	
	
	def interpreter(params, client)
    	# self.help __dir__
    	self.in params[0], params[1]
  	end

  	def in time, message
  		begin
	  		@@scheduler = Rufus::Scheduler.new
	  		@@scheduler.in time do
	  			p 'aqui'
	  			self.response('console',message)
	  		end
  		rescue Exception => e
  			p e
  		end
  		
  	end

  	def every time, message
  		scheduler.every time do
  			self.response('console',message)
  		end
  	end

  	def at
  	end

  	def cron
  	end
end
Schedule.new __dir__
