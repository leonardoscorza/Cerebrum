#Load fundamentals actions
require './base_model.rb'
require './actions/fundamental/memory/memory.rb'
require './actions/fundamental/queue/queue.rb'
require './actions/fundamental/zip/zip.rb'
#Load all extensions actions
Dir["./actions/extensions/*/*.rb"].each {|file| require file }


class Synapsis
  $acessSense = ''
  @@client    = ''

	def initialize
    # Create primitive sense (redis)
    $acessSense = Queue.new
    # Call the monitor, to execute actions when new command
		monitoring_queue()
	end

  #Monitoring sensations parts
	def monitoring_queue
    loop do
      # Wait a new command (Redis)
      sleep(0.1)
      synapse = $acessSense.listen()
      unless synapse.nil?
        #Call the stimuli interpreter
        Thread.new {
          temporalLobe(synapse)
        }
      end

    end

	end

  #Interpret language stimulis part
	def temporalLobe(synapse)
    synapseArray = synapse.split(' ')
    action_return = nil
    connection = false
    begin

      @@client = synapseArray.shift
      unless @@client
        raise "Haven't a client"
      end

      unless synapseArray.shift == 'THINK'
        raise 'Its not a think'
      end

      while synapseArray

        while synapseArray.first == 'AND'
          synapseArray.shift
        end

        if synapseArray.first == 'CONNECT'
          synapseArray.shift
          connection = true
        end
      
        knowMethod = synapseArray.shift
        unless knowMethod
          raise "Haven't a command"
        end

        #Get the params
        arrayParameters = []
        while synapseArray != [] and synapseArray.first != "AND" and synapseArray.first != "CONNECT" 
          syn = synapseArray.shift
          arrayParameters.push(syn)
        end

        if connection
          p action_return
          arrayParameters.push action_return
          connection = false
        end


        p "Are all okay, call the execution..."
        action_return = self.cerebellum(knowMethod, arrayParameters)
      end
    rescue Exception => e
      $acessSense.speak('console',"I don't know or don't understrand, be more clear human" + e)
      Logger::log e, 'error'
    end
	end

  #Execution stimulis part
  def cerebellum(know, params=nil)
    p BaseModel::action_obj(know)
    begin
      if BaseModel::action_obj(know).send('interpreter',params, @@client) == false
        raise "error"
      end 
    rescue Exception => e
      $acessSense.speak('console',"Error on the Execution of your command")
      Logger::log e, 'error'
    end
  end

  #Reation programs part
  def amygdala
  end

end
