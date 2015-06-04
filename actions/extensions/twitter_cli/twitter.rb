require 'twitter'

class TwitterCli < BaseModel
	def client
		Twitter::REST::Client.new do |config|
		  	config.consumer_key        = "Lou7nrM4B7IKdmf79dMemsHFt"
		  	config.consumer_secret     = "ZUbh8S9B9uFb1r8lYsjMvtYoYGcMmLVFdkzTvTbNtI6pvRa31b"
		  	config.access_token        = "2376188359-SkM8AFEVHgsjVg1zzqcFhnTNmje7rmaksw5L06Y"
		  	config.access_token_secret = "e8mJiRGLww4n2FL0bg4OMyxRj8dLRwWYJX6db5N5VY4uk"
		end
	end

	def interpreter(params, client)
    	params, language = cut_param params, 'language'
      action = params.shift
      case action
      when 'user' 
        self.user params.shift
      when 'post'
        self.post params.join(" ")
      when 'follow'
        self.follow params.shift
      when 'followers'
        self.followers params.shift
      when 'friends'
        self.friends params.shift
      when 'popularity'
        self.popularity
      when 'feelings'
        self.feelings
      when 'search'
        self.search params.join(" "), language
      end
  	end

  	def user name
      begin
        result = self.client.user(name)    
        response("console", "#{result.name}, #{result.description}")
      rescue Exception => e
        response("console", 'Error')
      end
      result
  	end

  	def post message
      begin
        result = self.client.update(message)    
        response("console", 'Posted')
      rescue Exception => e
        response("console", 'Error')
      end
  		result
  	end

  	def follow name
  		result = self.client.follow(name)
  		response("console", result)
  		result
  	end

  	def followers
  		result = self.client.follow(name).to_h
  		response("console", result)
  		result
  	end

  	def friends name
  		if name
  			result = self.client.friends(name).to_h
  		else
			result = self.client.friends  			
  		end
  		response("console", result)
  		result
  	end

    def search query, language
      search = self.client.search("#{query}", result_type: "recent", lang: (language != nil)? language : self.configurations['language_default'] )
      results = ''
      search.to_h[:statuses].each do |s|
        date = "#{s[:created_at].split(' ')[1]}/#{s[:created_at].split(' ')[2]}/#{s[:created_at].split(' ')[5]} - #{s[:created_at].split(' ')[3]}"
        results += "<br><b style='color:red'>-</b> #{s[:text]} - <b style='color:blue'>#{s[:user][:screen_name]} - #{s[:user][:location]} - #{date}</b><br>"
      end
      response("console", results)
      results
    end

  	def popularity
  	end

  	# VERIFICAR BANCO DE PALAVRAS SOBRE PESSOA
  	def feelings
  	end


end
TwitterCli.new __dir__
