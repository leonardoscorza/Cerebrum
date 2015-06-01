class Zip < BaseModel

  def interpreter(params, client)
    self.help
  end
end

Zip.new __dir__