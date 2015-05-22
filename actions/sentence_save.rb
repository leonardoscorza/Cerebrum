load './fundamental/memory.rb'


class SentenceSave
  def initialize
    @memory = Memory.new('brainMemory')
    #Verification of existent know in the brain
    exist = @memory.remember('knowledge', {:know => 'sentenceSave' } )
    if exist == {}
      @memory.burn('knowledge',{:know => 'sentenceSave', :numMethods => 3, :methods => {:method1 => {'name' => 'saveOne', :numParam => 1},:method2 => {'name' => 'rescueOne', :numParam => 1},:method3 => {'name' => 'history', :numParam => 2}}})
    end

    #Verification of the existence of the index help variable
    exist = @memory.remember('sentenceSave', {:sentenceHelp => 'index'} )
    if exist == {}
      @memory.burn('sentenceSave',{:sentenceHelp => 'index', :current => 0})
    end
  end

  # ------ BASE METHODS, INTERPRETER AND HELP -------- #
  def interpreter(params, client)
    case params[0]
      when "saveOne"
        self.saveOne params[1]
      when "rescueOne"
        self.rescueOne
      when "history"
        self.history
      else
        self.help
    end
    true
  end

  def help
    $acessSense.speak('console', 'To use this method...')
    true
  end
  # -----                                       -------- #


  def saveOne(command, client)
    begin
      #Get the current index
      p "save one"
      indexCurrent = @memory.remember('sentenceSave', {:sentenceHelp => 'index'} )
      #Burn the new sentence
      @memory.burn('sentenceSave',{:sentenceBody => command, :sentenceIndex => (indexCurrent['current'] + 1) })
      #Atualize the current index
      @memory.burn('sentenceSave',{:sentenceHelp => 'index', :current => (indexCurrent['current'] + 1)})
      true
    rescue
      false
    end
  end


  def rescueOne(position, client)
    #Get the current index
    indexCurrent = @memory.remember('sentenceSave', {:sentenceHelp => 'index'} )
    #Rescue a especific sentence
    sentence = @memory.remember('sentenceSave', {:sentenceIndex => (indexCurrent['current'] - position[0].to_i)} )
    $acessSense.speak('console', sentence['sentenceBody'])
  end


  def history(lenght, client)
      sentences = @memory.rememberAll('sentenceSave')
      $acessSense.speak('console',sentences)
      sentences
  end
end

#Create the acess object
$know["sentenceSave"] = SentenceSave.new

