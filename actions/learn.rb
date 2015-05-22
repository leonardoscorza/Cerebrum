require 'json'
require 'rest-client'

class Learn

  def initialize
    @memory = Memory.new('brainMemory')
    exist = @memory.remember('knowledge', {:know => 'learn' } )
    if exist == {}
      @memory.burn('knowledge',{:know => 'learn', :numMethods => 1})
    end
  end

  def interpreter params, client
    p 'learn learn learn'
  end

  def help client=nil
  end

    
end

#Create the acess object
$know["learn"] = Learn.new
