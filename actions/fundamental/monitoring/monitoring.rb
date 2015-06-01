class Monitoring < BaseModel

	$acessSense = Queue.new

	def interpreter(params=nil, client=nil)
		self.monitoring_queue()
	end

  	#Monitoring queue
	def monitoring_queue
		process = nil
	    loop do
	      # Wait a new command (Redis)
	      sleep(configurations['refresh_seconds'].to_f)
	      process = $acessSense.listen()
	      unless process.nil?
	      	break
	      end
	    end
	    return process
	end

end

Monitoring.new __dir__