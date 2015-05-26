
class Learn < BaseModel

  def interpreter params, client
    p 'learn learn learn'
    self.help __dir__
  end

    
end

#Create the acess object
Learn.new __dir__
