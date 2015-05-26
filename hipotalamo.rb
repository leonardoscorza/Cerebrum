#This is the first eletron passing
load 'synapsis.rb'
# Initialize the system
require "./configurations/start.rb"

class Hipotalamo
	def initialize
		#Iniciate console
 		Synapsis.new()
	end

end

#Inicialize the brain functions
brain = Hipotalamo.new
