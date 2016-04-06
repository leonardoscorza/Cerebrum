require 'koala'

class Facebook < BaseModel
	def interpreter(params, client)
    	self.help __dir__
  	end

  	def post message, type
  	end

  	def profile name
  	end

  	def friends type, id=nil
  	end

  	def feed page
  		feed = @graph.get_connections("me", "feed")
  		page.times do
  			feed = feed.next_page
  		end
  	end
end
Facebook.new __dir__
