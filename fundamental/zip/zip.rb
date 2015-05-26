
class Zip < BaseModel

  def initialize
      $memory.save_know ({:know => 'zip', :numMethods => 1})
  end

  def interpreter(params, client)
    self.help __dir__ 
  end
end

$know["zip"] = Zip.new