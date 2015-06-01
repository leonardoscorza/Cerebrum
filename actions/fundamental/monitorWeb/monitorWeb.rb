require 'sinatra'

class Monitorweb < Sinatra::Base
	def interpreter(params, client)
    	self.run!
  	end

  	configure do
	  # Roda na inicializaç~ao
	end

	not_found do
	  'Isto está longe de ser encontrado'
	  # RODA QUANDO 404
	end

	# Begin executation
	get // do
	  pass if true
	  # ...
	end

	# Before here
	before do 
		p 'BEFORE'
		# halt 401, 'vamos embora!' PARA REQUISIÇ~AO
	end

	# After here
	after do 
		p 'AFTER'
	end

	error do
	   #QUANDO ERROR
	  'Desculpe, houve um erro desagradável - ' + env['sinatra.error'].name
	end

	# error MeuErroCustomizado do
	#   'Então que aconteceu foi...' + env['sinatra.error'].message
	#   # QUANDO CALL raise MeuErroCustomizado
	# end

	get '/teste' do
		Teste.new
	end
end
Monitorweb.new
