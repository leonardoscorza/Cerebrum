class Processing
  $acessSense = Queue.new

	def initialize
		self.monitoring_queue()
	end

	def monitoring_queue
    loop do
      process = self.execute(Initialize::configurations['monitoring_action'])
      Thread.new { command_interpreter(process) }
    end
	end

	def command_interpreter(process)
    commands = self.execute(Initialize::configurations['interpreter_action'], process)
    begin
      raise "#{Initialize::messages['error_command']}: #{commands[:type]}" unless commands[:status]
      response = nil
      commands[:actions].each do |c|
        if c[:params].empty? and not c[:type_connect]
          response = self.execute(c[:action])
        else
          c[:params].push(response) if c[:type_connect]
          response = self.execute(c[:action], c[:params])
        end
      end
    rescue Exception => e
      $acessSense.speak('console',e.message)
      Logger::log e, 'error'
    end
	end

  def execute(command, params=nil, client=nil)
    begin
      result = BaseModel::action_obj(command).interpreter params, client
    rescue Interrupt
      exit
    rescue Exception => e
      $acessSense.speak('console',"#{Initialize::messages['error_execute']} #{command}")
      Logger::log e, 'error'
    end
    result
  end

end
