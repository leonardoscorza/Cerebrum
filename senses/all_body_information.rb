load './arm/memory.rb'


class AllBodyInformation
  @@memory     = ''


  def initializte
    #Create relation on memory of the knowledge
    @@memory     = Memory.new('brainMemory')
    @@memory.burn('know',"INSERIR AQUI")
  end

  def get(client)

    #Get the informations

    #Mount the html case web
    if client == 'web'
      'teste'
    #Mount the string case console
    else #console
      'teste'
    end
    
    
  end

  def help
    'Class to information about the attributes of the body. (senses, actions and your needs)
     This class dont need parameters.'
  end
end

#Create the acess object
$know = AllBodyInformation.new
