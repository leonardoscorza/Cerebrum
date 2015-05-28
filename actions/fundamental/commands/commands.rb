class Commands < BaseModel
	CONNECT_CODE = 'CONNECT'
	AND_CODE = 'AND'
	INITIALIZER_CODE = 'THINK'

	def interpreter(params, client)
		self.commands_interpreter(params)
	end

	def commands_interpreter(process)
	    commands = process.split(' ')
	    actions_group = {actions: [], client: nil, status: true}
	    begin
	      actions_group[:client] = commands.shift
	      raise "Haven't a client" unless actions_group[:client]
	      raise 'Its not a think'  unless commands.shift == INITIALIZER_CODE

	      while not commands.empty?
	      	current = {params: [], action: nil, type_connect: false}
	        commands.shift if commands.first == AND_CODE
	        if commands.first == CONNECT_CODE
	          commands.shift
	          current[:type_connect] = true
	        end

	        current[:action] = commands.shift
	        raise "Haven't a action"  unless current[:action]

	        while not commands.empty? and
	                  commands.first != AND_CODE and
	                  commands.first != CONNECT_CODE 
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