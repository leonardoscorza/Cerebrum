require 'json'
require 'rest-client'

class Learn < BaseModel

  def initialize
    $memory.save_know ({:know => 'learn', :numMethods => 1})
  end

 

  def interpreter params, client
    p 'learn learn learn'
    self.help __dir__
  end

    
end

#Create the acess object
$know["learn"] = Learn.new
