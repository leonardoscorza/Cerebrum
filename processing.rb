class Processing
  @@client    = ''
  $acessSense = Queue.new
  # $m = Monitoring.new __dir__

	def initialize
    # Call the monitor
		self.monitoring_queue()
	end

  # Monitore the commands
	def monitoring_queue
    loop do
      # process = $m.interpreter
      # p process
      process = self.execute('monitoring')
      p process
      Thread.new { command_interpreter(process) }
    end
	end

  #Interpret language
	def command_interpreter(process)
    processArray = process.split(' ')
    action_return = nil
    connection = false
    begin

      @@client = processArray.shift
      unless @@client
        raise "Haven't a client"
      end

      unless processArray.shift == 'THINK'
        raise 'Its not a think'
      end

      while processArray

        while processArray.first == 'AND'
          processArray.shift
        end

        if processArray.first == 'CONNECT'
          processArray.shift
          connection = true
        end
      
        knowMethod = processArray.shift
        unless knowMethod
          raise "Haven't a command"
        end

        #Get the params
        arrayParameters = []
        while processArray != [] and processArray.first != "AND" and processArray.first != "CONNECT" 
          syn = processArray.shift
          arrayParameters.push(syn)
        end

        if connection
          p action_return
          arrayParameters.push action_return
          connection = false
        end
        
        p "Are all okay, call the execution..."
        action_return = self.execute(knowMethod, arrayParameters)
      end
    rescue Exception => e
      $acessSense.speak('console',"I don't know or don't understrand, be more clear human" + e)
      Logger::log e, 'error'
    end
	end

  #Execution command
  def execute(command, params=nil)
    begin
      result = BaseModel::action_obj(command).interpreter params, @@client
    rescue Interrupt
      exit
    rescue Exception => e
      $acessSense.speak('console',"Error on the Execution of your command " + command)
      Logger::log e, 'error'
      exit
    end
    result
  end

end
