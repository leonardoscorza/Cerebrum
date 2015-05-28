class SelfInformation < BaseModel

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
    if params
        self.help
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
SelfInformation.new __dir__
