require 'hpricot'
require 'json'
require 'rest-client'

class Wiki < BaseModel

  def interpreter params, client
    if params != []
        self.search params
    else
        self.help __dir__
    end
    true
  end

  def search params=nil
    language = 'pt'
    params.each do |param|
      if param.include? 'language'
        language = param.split(":")[1]
        p language
        params.delete(param)
      end
    end
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
    p results
    $acessSense.speak('console',results)
    true
  end
    
end

#Create the acess object
Wiki.new __dir__
