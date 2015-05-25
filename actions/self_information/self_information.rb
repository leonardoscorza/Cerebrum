class SelfInformation

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
        self.help
      when "helpDois"
        self.helpDois
      else
        self.help
    end
    true
  end

  def help(client=nil)
    response = self.get(client)
    $acessSense.speak('console',response.to_s)
    response
  end
  # -----                                       -------- #


  def helpDois
    'Class to information about the attributes of the body. (senses, actions and your needs)
     This class dont need parameters2.'
  end
end

#Create the acess object
$know["know"] = SelfInformation.new
