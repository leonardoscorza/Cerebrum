require 'sinatra'
require './queue.rb'

$queue = Queue.new

class Monitorweb < Sinatra::Base

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
		# p 'BEFORE'
		# halt 401, 'vamos embora!' PARA REQUISIÇ~AO
	end

	# After here
	after do 
		# p 'AFTER'
	end

	get '/execute' do
		if params[:process]
			$queue.speak('!',params[:process])
			msg = nil	
			10.times do
				sleep(0.1)
				msg = $queue.listen('console')			
				break if msg
			end
			msg
		end
	end
end

Monitorweb.new
Monitorweb.run!