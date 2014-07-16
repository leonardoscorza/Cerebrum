require 'json'

load 'primitive_sense.rb'
load 'hippocampus.rb'

#Load all sense files
Dir["./senses/*.rb"].each {|file| require file }
#Load all arm's
Dir["./arm/*.rb"].each   {|file| require file }


class Synapsis
  $acessSense = ''
  @@memory     = ''
  @@client       = ''

	def initialize
    $acessSense = PrimitiveSense.new
    @@memory     = Memory.new('brainMemory')

		somatosensation()
	end

  #Monitoring sensations parts
	def somatosensation

    loop do
      synapse = $acessSense.listen()

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
    knowMethods = @@memory.remember('knowledge', {:know => synapseArray.shift } )

    if(knowMethods == [])
      return "I do not know or forgot how to do this. If you want I can tell you about the things I know. Ask me about my knowledge [know]."
    else



      #Case all right, call the execution
      method = synapseArray.shift
      i = 0
      while i != knowMethods['numMethods'] do
        i = i + 1
        methodCurrency = 'method' + i.to_s

        #Verify if is the same method
        if knowMethods['methods'][methodCurrency]['name'] == method
          #Verify if the params are right
          j = 0
          arrayParameters = []
          while j != knowMethods['methods'][methodCurrency]['numParam'] do
            arrayParameters.push(synapseArray.shift)

            if  arrayParameters[j] == "AND" or arrayParameters[j] == "CONECT" or arrayParameters[j] == nil
              #Call help method
              p "call help method num param wrong"
              self.cerebellum(knowMethods['know'],'help')

              #In the multiples commands DELETE the next command
              return ""
            end
            j = j + 1

          end

          #Verifify if have a cross parameter, case have, do the substituition


          #If the params are okay, call the execution process
          p "Are all okay, call the execution..."
          return self.cerebellum(knowMethods['know'], knowMethods['methods'][methodCurrency]['name'], arrayParameters)

        end

      end

      #Not find the method, call the default help method
      p "Nao encontrou o metodo"


    end



	end

  #Execution stimulis part
  def cerebellum(know, method, param=nil)
    #Create the action acess
    action = $know[know]

    #Call the method
    begin
      if param != []
        p 'param', method, param, @@client, action

        action.send(method, param, @@client)
      else
        p 'no param'
        action.send(method, @@client)
      end
    #Call the help method in problem case
    rescue
      action.send('help')
    end
  end

  #Reation programs part
  def amygdala
  end

end
