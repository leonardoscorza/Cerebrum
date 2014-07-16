load './arm/memory.rb'


class SentenceSave
  $memory     = ''


  def initialize
    #Create relation on memory of the knowledge
    $memory     = Memory.new('brainMemory')
    #Verification of existent know in the brain
    exist = $memory.remember('knowledge', {:know => 'sentenceSave' } )
    if exist == {}
      $memory.burn('knowledge',{:know => 'sentenceSave', :numMethods => 3, :methods => {:method1 => {'name' => 'saveOne', :numParam => 2},:method2 => {'name' => 'rescueOne', :numParam => 4},:method3 => {'name' => 'history', :numParam => 2}}})
    end
  end


  def saveOne(client, command)

    #Mount the html case web
    if client == 'web'
      'teste'
    #Mount the string case console
    else #console
      begin
        $memory.burn('sentenceSave',{:sentenceName => '1', :sentenceBody => command})
        true
      rescue
        false
      end
    end

  end


  def rescueOne(client, possition, direction)
    sentence = $memory.remember('sentenceSave', {:sentenceName => '1' } )
    $acessSense.speak('console',sentence)
    sentence
  end


  def history(client, lenght)
      sentences = $memory.rememberAll('sentenceSave')
      $acessSense.speak('console',sentences)
      sentences
  end
end

#Create the acess object

a = SentenceSave.new
