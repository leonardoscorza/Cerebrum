require 'hpricot'

class Wiki < BaseModel

  def interpreter params, client
    if params != []
        self.search params
    else
        self.help __dir__
    end
  end

  def search params=nil
    if params
      params, language = cut_param params, 'language'
      language = (language == nil)? 'pt' : language

      query = params.join(" ")
      file =  RestClient.get "http://#{language}.wikipedia.org/w/api.php?action=query&list=search&srsearch=#{query}&srprop=timestamp&continue=&format=json"

      terms_results = []
      JSON.parse(file)["query"]["search"].each do |search|
        terms_results.push(search["title"])
      end
      results = []
      terms_results.first(1).each do |term|
        file = RestClient.get "https://#{language}.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=&explaintext=&titles=#{term}"
        begin 
          extract = JSON.parse(file)["query"]["pages"].first[1]["extract"]
          results.push(extract)
        rescue
          p 'rescue'
        end
      end
      $acessSense.speak('console',results)
      results.first
    end
  else
    false
  end
end

#Create the acess object
Wiki.new __dir__
