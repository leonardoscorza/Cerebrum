require 'json'

load 'primitive_sense.rb'
load 'hippocampus.rb'

#Load all sense files
Dir["./senses/*.rb"].each {|file| require file }
#Load all arm's
Dir["./arm/*.rb"].each   {|file| require file }



class Synapsis
  @@acessSense = ''
  @@memory     = ''

	def initialize
    @@acessSense = PrimitiveSense.new
    @@memory     = Memory.new('brainMemory')

		somatosensation()
	end

  #Monitoring sensations parts
	def somatosensation
		
    loop do
      synapse = @@acessSense.listen()

      #Listen the queue of stimuli
      unless synapse.nil?

        #Call a action for the stimuli
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

    #Test to confirm that is a think
    unless synapseArray.shift == 'THINK'
      return "Not is a think"
    end


    #Try remember of the sense/action
    knowMethods = @@memory.remember('knowledge', {:know => synapseArray.shift } )
    
    if(knowMethods == [])
      return "I do not know or forgot how to do this. If you want I can tell you about the things I know. Ask me about my knowledge [know]."
    else
      # p knowMethods
      #Verify if the method is right      
      p knowMethods['methods']
      # if ( == synapseArray.shift)

      #Verify if the params are right
      #If have a error call the help method off the sense/action
      
      #Else have a error call the sense/action


    end



	end

  #Execution stimulis part
  def cerebellum
  end

  #Reation programs part
  def amygdala
  end

end
