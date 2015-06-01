begin
	raise "Use a argument to action name" unless ARGV[0]
	name = ARGV[0]
	raise "Action name:#{name}, yet exists" if Dir.exist?(name)
	Dir.mkdir(name)

	class_content   =  "class #{name.capitalize} < BaseModel
	def interpreter(params, client)
    	self.help __dir__
  	end
end
#{name.capitalize}.new __dir__"

	config_content  = "configurations:
  help_message: 'Put here your help message...'
  action_name: '#{name}'
  wiki: 'Write any words about your extension'"

	spec_content = "require 'spec_helper'
require './actions/extensions/#{name}/#{name}.rb'

describe #{name.capitalize} do
  pending 'example :)'
end"


    File.new("./#{name}/#{name}.rb",'w').puts(class_content)
    File.new("./#{name}/config.yml",'w').puts(config_content)
    File.new("./#{name}/Gemfile",'w')
    File.new("./#{name}/#{name}_spec.rb",'w').puts(spec_content)

    p "The action #{name} are created..."
rescue Exception => e
	p e.message
end