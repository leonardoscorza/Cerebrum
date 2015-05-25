require 'rest-client'
require 'open-uri'
require 'pry'

class Translate
	$translateObj = ''


	def initialize
	    $memory.save_know ({:know => 'translate', :numMethods => 1})
	end

	def interpreter(params, client)
		special = ''
		params.each do |param|
	      if param.include? 'special'
	        special = param.split(":")[1]
	        params.delete(param)
	      end
	    end

	    if special == "help"
			self.help
		else
			self.convertText params, client
		end
	end

	def help
		$acessSense.speak('console','To use this know, call translate language_from:pt language_to:en and the text')
		true
	end

	def convertText(params, client)
		language_from = nil
		language_to   = nil
		params.each do |param|
	      if param.include? 'language_from'
	        language_from = param.split(":")[1]
	        params.delete(param)
	      end  
	    end
	    params.each do |param|
	      if param.include? 'language_to'
	        language_to = param.split(":")[1]
	        params.delete(param)
	      end
	    end
	    p language_to
	    
	    if language_from != nil and language_to != nil
	    	# text = []
	    	# params.each do |p|
	    	# 	text.push(p.gsub(' ', '').gsub('\n', ''))
	    	# end
	    	text = params.join(" ")

	    	p params
			url = "https://translate.google.com/translate_a/single?client=t&sl=#{language_from}&tl=#{language_to}&hl=en&dt=bd&dt=ex&dt=ld&dt=md&dt=qc&dt=rw&dt=rm&dt=ss&dt=t&ie=UTF-8&oe=UTF-8&oc=1&otf=1&ssel=0&tsel=0&q=#{URI.escape(text)}"
			# binding.pry   
			response = RestClient.get(
			  url, {:user_agent => "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 Safari/537.36", :cookies => {:_ga => "GA1.3.1669895849.1402852165", :PREF => "ID=89af926e087cbbb0:U=3c40bca583a91f52:TM=1402852153:LM=1402852222:S=zIfzdZo1mCEwYqLu", :NID => "67=RP6Ux3LZBWb2cma8fAP9Xjh9RbLawvZ3-Wj7cuyaL4Ow2ex4JPi5cSQwEKy4IfZSMoGNOrvi4GU9aZLaKzH3jpIWmoz-rTpDubtIrmNgIOA1w2dUusiJiOd7nytHP89H"}}
			)
		   	$acessSense.speak('console',response.scan(/"([^"]*)"/)[0][0])
		   	true
		else
			false
		end
	end
end

$know["translate"] = Translate.new
# p teste.convertText('pt', 'nl','ola%20meu%20nome%20%C3%A9%20momo')
