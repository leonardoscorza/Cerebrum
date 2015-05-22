load './fundamental/memory.rb'
require 'hpricot'
require 'json'
require 'rest-client'

class Search

  def initialize
    @memory = Memory.new('brainMemory')
    exist = @memory.remember('knowledge', {:know => 'search' } )
    if exist == {}
      @memory.burn('knowledge',{:know => 'search', :numMethods => 1})
    end

  end

  def interpreter params, client
    if params != []
        self.search params
    else
        self.help
    end
    true
  end

  def help client=nil
    $acessSense.speak('console','Call search more terms that you want : )...humans...')
  end

  def search params=nil
    if params[0] == 'bing'
      engine = 'bing'
      query = params.shift.join(" ")
    else
      engine = 'google'
      query = params.join(" ")
      file = RestClient.get "https://news.google.com/news/section?q=#{query}"
      doc  = Hpricot(file)
      p doc.search('.titletext')[0]
    end
    $acessSense.speak('console',results)
  end

end

#Create the acess object
$know["search"] = Search.new
