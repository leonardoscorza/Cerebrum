Dir["./senses/*.rb"].each {|file| require file }

# load './senses/all_body_information.rb'

class Teste
  def initialize
    p $know.help
  end
end

  a = Teste.new
