class Zip < BaseModel

  def interpreter(params, client)
    p self.configurations
  end
end

Zip.new __dir__