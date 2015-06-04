require 'rest-client'

class Youtube < BaseModel
	def interpreter(params, client)
		if params.shift == 'search'
	    	params, maxResults = cut_param params, 'max'
	    	self.search params, ((maxResults == nil)? 10 : maxResults)
	    end
  	end

  	def search params, maxResults=10
  		partial = RestClient::Request.execute(:method => :get, :url => "https://zazkov-youtube-grabber-v1.p.mashape.com/search.video.php?maxResults=#{maxResults}&query=#{params.join(' ')}", :headers => {"X-Mashape-Key" => self.configurations['MashapeKey']})
	   	partial = JSON.parse partial
	    if not partial.empty?
	    	results = ''
	    	partial['data'].each do |video|
	    		results += "<br><br><b style='color:blue;font-family:verdana'>Title: #{video['title']}</b><br>description: #{video['description']}<br><a href=http://www.youtube.com/watch?v=#{video['videoId']} target='_blank'><img style='width:300px;' src=#{video['img']['default']}></a> <br><br>"
	    	end
	    else
	    	results = "I'dont find any video"
	    end
	    response('console', results)
  	end
end
Youtube.new __dir__
