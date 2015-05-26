#This is the first eletron passing
load 'synapsis.rb'
# Initialize and configure the system
require "./configurations/make.rb"

class Start
	def initialize
		#Iniciate console
 		Synapsis.new()
	end

end

#Inicialize the brain functions
brain = Start.new
