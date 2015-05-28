p 'The magic begin now'

class Initialize
	def self.configurations
		YAML::load_file(File.join('./configurations', 'config.yml'))
	end
end

#----Initialize system actions----#
#--Fundamentals
require './base_model.rb'
require './actions/fundamental/memory/memory.rb'
require './actions/fundamental/queue/queue.rb'
require './actions/fundamental/monitoring/monitoring.rb'
require './actions/fundamental/commands/commands.rb'
require './actions/fundamental/zip/zip.rb'
require './actions/fundamental/process_words/process_words.rb'

#--Exensions
Dir["./actions/extensions/*/*.rb"].each {|file| require file }

#----Initialize system modules----#
Dir[__dir__ + "/initializers/*.rb"].each {|file| require file }


