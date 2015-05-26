require 'hpricot'

class Search < BaseModel

  def interpreter params, client
    if params != []
        self.search params
    else
        self.help
    end
    true
  end

  def help client=nil
    $acessSense.speak('console','Call search more terms that you want : )...humans...')
  end

  def search params=nil
    if params[0] == 'bing'
      engine = 'bing'
      query = params.shift.join(" ")
    else
      engine = 'google'
      query = params.join(" ")
      file = RestClient.get "https://news.google.com/news/section?q=#{query}"
      doc  = Hpricot(file)
      p doc.search('.titletext')[0]
    end
    $acessSense.speak('console',results)
  end

end

#Create the acess object
Search.new __dir__
