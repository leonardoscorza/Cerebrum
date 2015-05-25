$know = {}

#Load all fundamental files
Dir["./fundamental/*.rb"].each {|file| require file }
#Load all actions
Dir["./actions/*/*.rb"].each   {|file| require file }
Dir["./actions/*.rb"].each   {|file| require file }


class Synapsis
  $acessSense = ''
  @@client    = ''
  @memory     = ''

	def initialize
    # Create primitive sense (redis)
    $acessSense = Queue.new
    # Create memory connection (mongo)
    @memory = Memory.new('brainMemory')
		somatosensation()
	end

  #Monitoring sensations parts
	def somatosensation

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
    #Process the synapse
    synapseArray = synapse.split(' ')
    #Save the returns of methods to use in others
    returnsOfMethods = []
    #Try catch the solicitation client
    begin
      @@client = synapseArray.shift
    rescue
      return "No client"
    end
    #Test to confirm that is a think
    unless synapseArray.shift == 'THINK'
      return "Not is a think"
    end
    #Try remember yourself of the sense or action
    knowMethods = @memory.remember('knowledge', {:know => synapseArray.shift } )
    if knowMethods == {}
      return "I do not know or forgot how to do this. If you want I can tell you about the things I know. Ask me about my knowledge [know]."
    else
      #Get the params
      arrayParameters = []
      while synapseArray != [] and synapseArray != "AND" and synapseArray != "CONNECT" 
        syn = synapseArray.shift
        arrayParameters.push(syn)
      end
      #If the params are okay, call the execution process
      p "Are all okay, call the execution..."
      return self.cerebellum(knowMethods['know'], arrayParameters)
    end
	end

  #Execution stimulis part
  def cerebellum(know, params=nil)
    begin
      if $know[know].send('interpreter',params, @@client) == false
        raise "error"
      end 
    rescue
      $know[know].send('help')
    end
  end

  #Reation programs part
  def amygdala
  end

end
