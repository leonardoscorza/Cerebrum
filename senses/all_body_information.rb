load './arm/memory.rb'


class AllBodyInformation
  @@memory     = ''


  def initializate
    #Create relation on memory of the knowledge
    @@memory     = Memory.new('brainMemory')
    @@memory.burn('knowledge',{:know => 'know', :numMethods => 2, :methods => {:method1 => {'name' => 'help', :numParam => 0}}})
  end

  def get(client)

    #Get the informations
    knowInformations = @@memory.remember('knowledge', {:know => synapseArray.shift } )


    #Mount the html case web
    if client == 'web'
      'teste'
    #Mount the string case console
    else #console
      knowInformations
    end
    
    
  end

  def help
    self.get('console')
  end


  def helpDois
    'Class to information about the attributes of the body. (senses, actions and your needs)
     This class dont need parameters2.'
  end
end

#Create the acess object
$know["know"] = AllBodyInformation.new
