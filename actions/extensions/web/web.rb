require 'whois'
require 'net/ping'
require 'resolv'

class Web < BaseModel
	def interpreter(params, client)
		command = params.shift
		site = params.shift

		case command
		when 'whois'
			self.whois site
		when 'ping'
			self.ping site
		when 'ip'
			self.ip site
		when 'name'
			self.name site
		else
			false
		end
  	end

  	def whois site
  		begin
  			c = Whois::Client.new
  			results = c.lookup(site)
  		rescue Exception => e
  			results = false
  		end
  		response('console',results)
  		results
  	end

  	def ping site
  		result = Net::Ping::External.new(site)
  		response('console',(result.ping?)? 'ok' : 'Do not answer'  )
  		result.ping?
  	end

  	def ip site
  		begin
	  		result = Resolv.getaddress site
  		rescue Exception => e
  			result 'not found'
  		end
  		response('console',result)
  		result
  	end

  	def name site
  		begin
			result = Resolv.getname site  			
  		rescue Exception => e
  			result 'not found'
  		end
		response('console',result)
		result
  	end

end
Web.new __dir__
