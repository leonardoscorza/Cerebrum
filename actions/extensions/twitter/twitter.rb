# require 'twitter'

# class Twitter < BaseModel
# 	def client
# 		Twitter::REST::Client.new do |config|
# 		  	config.consumer_key        = "Lou7nrM4B7IKdmf79dMemsHFt"
# 		  	config.consumer_secret     = "ZUbh8S9B9uFb1r8lYsjMvtYoYGcMmLVFdkzTvTbNtI6pvRa31b"
# 		  	config.access_token        = "2376188359-SkM8AFEVHgsjVg1zzqcFhnTNmje7rmaksw5L06Y"
# 		  	config.access_token_secret = "e8mJiRGLww4n2FL0bg4OMyxRj8dLRwWYJX6db5N5VY4uk"
# 		end
# 	end

# 	def interpreter(params, client)
#     	self.help __dir__
#     	params, language = cut_param params, 'languages'
    	
#   	end

#   	def user name
# 		result = self.client.user(name)
# 		response("console",result)
# 		result
#   	end

#   	def post message
#   		result = self.client.update(message)
#   		response("console", result)
#   		result
#   	end

#   	def follow name
#   		result = self.client.follow(name)
#   		response("console", result)
#   		result
#   	end

#   	def followers
#   		result = self.client.follow(name).to_h
#   		response("console", result)
#   		result
#   	end

#   	def friends name
#   		if name
#   			result = self.client.friends(name).to_h
#   		else
# 			result = self.client.friends  			
#   		end
#   		response("console", result)
#   		result
#   	end


#   	def popularity
#   	end

#   	# VERIFICAR BANCO DE PALAVRAS SOBRE PESSOA
#   	def feelings
#   	end


# end
# Twitter.new __dir__
