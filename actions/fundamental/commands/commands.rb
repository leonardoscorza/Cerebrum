class Commands < BaseModel
	
	def interpreter(params, client)
		self.commands_interpreter(params)
	end

	def commands_interpreter(process)
		connect_code = self.configurations['connect_code']
		and_code = self.configurations['and_code']
		initializer_code = self.configurations['initializer_code']

	    commands = process.split(' ')
	    actions_group = {actions: [], client: nil, status: true}
	    begin
	      actions_group[:client] = commands.shift
	      raise "Haven't a client" unless actions_group[:client]
	      raise 'Its not a think'  unless commands.shift == initializer_code

	      while not commands.empty?
	      	current = {params: [], action: nil, type_connect: false}
	        commands.shift if commands.first == and_code
	        if commands.first == connect_code
	          commands.shift
	          current[:type_connect] = true
	        end

	        current[:action] = commands.shift
	        raise "Haven't a action"  unless current[:action]

	        while not commands.empty? and
	                  commands.first != and_code and
	                  commands.first != connect_code 
	        	current[:params].push(commands.shift)
	        end
	        actions_group[:actions].push(current)
	      end
	      actions_group
	    rescue Exception => e
	      {status: false, type: e.message}
	    end
	end
end

Commands.new __dir__