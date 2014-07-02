load 'primitive_sense.rb'

class Synapsis
  @@acessSense = ''
  @@synapseT   = ''

	def initialize
    @@acessSense = PrimitiveSense.new
		somatosensation()
	end

  #Monitoring sensations parts
	def somatosensation
		
    loop do
      stimuli = @@acessSense.listen()

      #Listen the queue of stimuli
      unless stimuli.nil?

        #Call a action for the stimuli
        @@synapseT =  Thread.new {
          responseSynapsis = pons(stimuli)
        }

      end
        @@synapseT.join()

    end

	end

  #Interpret language stimulis part
	def temporalLobe(synapse)
    p 'a'
	end

  #Execution stimulis part
  def cerebellum
  end

end
