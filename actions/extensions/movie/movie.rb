require 'themoviedb'

class Movie < BaseModel
	def interpreter(params, client)
		if params
    		self.search params.join(" ")
    	else
    		false
    	end
  	end

  	def access language
  		Tmdb::Api.key(self.configurations['api_key'])
  		Tmdb::Api.language(self.configurations['language_default'])
  	end

  	def search_movie query
  		self.access
  		results = Tmdb::Movie.find(query)
  		final = ''
  		results.each do |result|
  			final += "<br><b style='color:blue'>#{result.title}</b>#{result.overview} votes:#{result.vote_average} popularity:#{result.popularity} <img src=#{result}>"
  		end
  	end
end
Movie.new __dir__
