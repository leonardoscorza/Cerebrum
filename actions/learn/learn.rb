require 'json'
require 'rest-client'

class Learn

  def initialize
    $memory.save_know ({:know => 'learn', :numMethods => 1})
  end

 

  def interpreter params, client
    p 'learn learn learn'
  end

  def help client=nil
  end

    
end

#Create the acess object
$know["learn"] = Learn.new
