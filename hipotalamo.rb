#This is the first eletron passing
load 'synapsis.rb'



class Hipotalamo
	def initializations
		#Iniciate console
		consoleT = Thread.new {
 			Synapsis.new()	
		}
		consoleT.join()
	end

end




#Inicialize the brain functions
brain = Hipotalamo.new
brain.initializations
