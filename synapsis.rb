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
      stimuli = @@acessSense.listen()

      #Listen the queue of stimuli
      unless stimuli.nil?

        #Call a action for the stimuli
        Thread.new {
          responseSynapsis = temporalLobe(stimuli)
        }

      end

    end

	end

  #Interpret language stimulis part
	def temporalLobe(synapse)
    p 'a'
	end

  #Execution stimulis part
  def cerebellum
  end

  #Reation programs part
  def amygdala
  end

end
