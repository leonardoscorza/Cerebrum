class SentenceSave < BaseModel

  def interpreter(params, client)
    case params[0]
      when "saveOne"
        self.saveOne params[1], client
      when "rescueOne"
        self.rescueOne params[1], client
      when "history"
        self.history client
      else
        self.help __dir__
    end
    true
  end

  def saveOne(command, client)
    begin
      #Get the current index
      p "save one"
      indexCurrent = $memory.remember('sentenceSave', {:sentenceHelp => 'index'} )
      #Burn the new sentence
      $memory.burn('sentenceSave',{:sentenceBody => command, :sentenceIndex => (indexCurrent['current'] + 1) })
      #Atualize the current index
      $memory.burn('sentenceSave',{:sentenceHelp => 'index', :current => (indexCurrent['current'] + 1)})
      true
    rescue
      false
    end
  end

  def rescueOne(position, client)
    indexCurrent = $memory.remember('sentenceSave', {:sentenceHelp => 'index'} )
    sentence = $memory.remember('sentenceSave', {:sentenceIndex => (indexCurrent['current'] - position[0].to_i)} )
    self.response('console',"#{'rescueOne:'}#{sentence['sentenceBody']}")
  end


  def history(lenght, client)
      sentences = $memory.rememberAll('sentenceSave')
      self.response('console',sentences)
      
      sentences
  end
end

SentenceSave.new __dir__

