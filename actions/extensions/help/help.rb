class Help < BaseModel
	def interpreter(params, client)
    	self.actions client, params
  	end

  	def actions client, action=nil
  		if action
  			Dir["./actions/*/#{action.first}/"].each do |file|
  				config = YAML::load_file(File.join(file, 'config.yml'))['configurations']
  				action = config['action_name']
  				help   = config['help_message']
  				wiki   = config['wiki']
  				self.response('console', "<b style='color:red'>#{action.first}</b>:<br>#<b style='color:green'>The wiki</b>:#{wiki}<br>#<b style='color:green'>The Help</b>:#{help}")
  			end
  		else
  			Dir["./actions/*/*/"].each do |file|
  				config = YAML::load_file(File.join(file, 'config.yml'))['configurations']
  				action = config['action_name']
  				help   = config['help_message']
  				wiki   = config['wiki']
  				self.response('console', "<b style='color:red'>#{action}</b>:<br>#<b style='color:green'>The wiki</b>:#{wiki}<br>#<b style='color:green'>The Help</b>:#{help}")
			end
  		end
  	end
end
Help.new __dir__
