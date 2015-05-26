class SelfInformation < BaseModel

  def initialize
    $memory.save_know ({:know => 'know', :numMethods => 2, :methods => {:method1 => {'name' => 'help', :numParam => 0},:method2 => {'name' => 'helpDois', :numParam => 0}}})
  end

  def get(client=nil)

    #Get the informations
    knowInformations = $memory.rememberAll('knowledge')
    #Mount the html case web
    if client == 'web'
      'teste'
    #Mount the string case console
    else #console
      knowInformations
    end
  end

  # ------ BASE METHODS, INTERPRETER AND HELP -------- #
  def interpreter(params, client)
    case params[0]
      when "help"
        self.help __dir__
      else
        self.return_all
    end
    true
  end
  # -----                                       -------- #

  def return_all client=nil
    response = self.get(client)
    $acessSense.speak('console',response.to_s)
    response
  end


end

#Create the acess object
$know["know"] = SelfInformation.new
