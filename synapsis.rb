load 'primitive_sense.rb'
load 'memory.rb'
load 'hippocampus.rb'


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
          p temporalLobe(synapse)
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
    knowMethods = @@memory.remember('know', {:know => synapseArray.shift } )
    unless(knowMethods)
      return "I do not know or forgot how to do this. If you want I can tell you about the things I know. Ask me about my knowledge [know]."
    else
      p 'knowMethods' , knowMethods
    end



	end

  #Execution stimulis part
  def cerebellum
  end

  #Reation programs part
  def amygdala
  end

end
