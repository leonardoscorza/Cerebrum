require 'feedjira'

class Feed < BaseModel
	def interpreter(params, client)
    	self.help __dir__
  	end

  	def get url=ni, key=nil
      feeds = Feedjira::Feed.fetch_and_parse(url).entries
      feed.title  
      feed.url
      feed.entries 
  	end

  	def feed_list
  	end

  	def add_to_list name, url
  	end

  	def remove_from_list name
  	end
end
Feed.new __dir__
