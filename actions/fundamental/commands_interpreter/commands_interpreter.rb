class CommandsInterpreter < BaseModel

	def interpreter(params, client)
		self.help __dir__ 
	end

 	#Interpret language
	def command_interpreter(process)
	    commands = process.split(' ')

	    actions_group = {}
	    begin
	      actions_group[:client] = commands.shift
	      raise "Haven't a client" unless actions_group[:client]
	      raise 'Its not a think'  unless commands.shift == 'THINK'
	      
	      current = {}
	      while commands
	        commands.shift if commands.first == 'AND'
	          
	        if commands.first == 'CONNECT'
	          commands.shift
	          current[:type] = 'connect'
	        end
	      
	        current[:action] = commands.shift
	        raise "Haven't a action" unless current[:action]

	        current[:params] = []
	        while commands                    and 
	              commands.first != "AND"     and
	              commands.first != "CONNECT" 
	          current[:params].push = commands.shift
	        end

	        actions_group[:actions].push(current)
	        actions_group[:status] = 'ok'
	      end
	      actions_group
	    rescue Exception => e
	      {status: 'error', type: e}
	    end
	end
end

CommandsInterpreter.new __dir__