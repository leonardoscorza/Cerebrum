class Zip < BaseModel

  def interpreter(params, client)
    self.help __dir__ 
  end
end

Zip.new __dir__