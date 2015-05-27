# Initialize and configure the system
require "./configurations/initialize.rb"
# Call the interpreter and executer method
require './processing.rb'

class Start
	def initialize
		#Iniciate console
 		Processing.new()
	end

end

# Initialize
Start.new
