load 'primitive_sense.rb'

class Synapsis
  @@acessSense = ''

	def initialize
    @@acessSense = PrimitiveSense.new
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


	end

  #Execution stimulis part
  def cerebellum
  end

  #Reation programs part
  def amygdala
  end

end
