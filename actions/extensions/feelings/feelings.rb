require 'sentimental'

class Feelings < BaseModel
	def interpreter(params, client)
		if params
    		self.analyzer params
    	else
    		false
    	end
  	end

  	def analyzer params
  		Sentimental.load_defaults
    	Sentimental.threshold = 0.1
  		analyzer = Sentimental.new
		results = "#{analyzer.get_sentiment params.join(' ')} (#{analyzer.get_score params.join(' ')})"
		response('console', results)
		results
  	end
end
Feelings.new __dir__
