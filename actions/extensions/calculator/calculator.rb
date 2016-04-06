require 'calc'

class Calculator < BaseModel
	def interpreter(params, client)
    	self.do params
  	end

  	def do params
  		sentence = params.join(" ")
  		sentence = sentence.gsub '+', ' + ' if sentence.include? '+'
  		sentence = sentence.gsub '-', ' - ' if sentence.include? '-'
  		sentence = sentence.gsub '**', ' ** ' if sentence.include? '**'
  		sentence = sentence.gsub '*', ' * ' if sentence.include? '*'
  		sentence = sentence.gsub '/', ' / ' if sentence.include? '/'
  		sentence = sentence.gsub '%', ' % ' if sentence.include? '%'
  		sentence = sentence.gsub '(', ' ( ' if sentence.include? '('
  		sentence = sentence.gsub ')', ' ) ' if sentence.include? ')'

  		while sentence.include? '  '
			sentence = sentence.gsub '  ', ' ' 			
  		end
  		p sentence
  		result = Calc.evaluate(sentence)
  		response('console',result)
  		result
   	end
end
Calculator.new __dir__
