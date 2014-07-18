load './arm/memory.rb'
require 'Hpricot'
require 'json'

class SearchNews
  $memory     = ''


  def initialize
    #Create relation on memory of the knowledge
    $memory     = Memory.new('brainMemory')

    #Verification of existent know in the brain
    exist = $memory.remember('knowledge', {:know => 'search_news' } )
    if exist == {}
      $memory.burn('knowledge',{:know => 'search_news', :numMethods => 1, :methods => {:method1 => {'name' => 'bbc_brasil', :numParam => 1}}})
    end

  end


  def bbc_brasil(client, theme = nil)
    docReturn = {}
    urlBase = 'http://www.bbc.co.uk/portuguese/'

    case theme
    when 'brasil' or 'Brasil'
      urlPart = 'topicos/brasil'
    when 'internacional' or 'Internacional'
      urlPart = 'topicos/internacional'
    when 'ciencia' or 'tecnologia' or 'Ciencia' or 'Tecnologia'
      urlPart = 'topicos/ciencia_e_tecnologia'
    end

    #Do the request
    begin
      file = open(urlBase + urlPart)
    rescue
      docReturn = 'Fail on communication with bbc'
      $acessSense.speak('console',docReturn)
      return docReturn
    end

    #Process text
    doc  = Hpricot(file)

    #Get all elements on notice
    newsTable = doc.search('.teaser')
    newsTable.search('.ts-144x81').search('.summary').each {  |n| p n.children.select{|e| e.text?}}

    #On return document add header and body on loop
    docReturn.merge!('keyMUDAR' => 'head', 'keyMudar2' => 'body')


    newsTable.search('.ts-144x81').search('a')[1]
    a.search('.ts-144x81').search('a')[1].children.select{|e| e.text?}
    a.search('.ts-144x81').search('.summary')[1].children.select{|e| e.text?}

    p 'ab'
    # $acessSense.speak('console',response.to_s)
  end

end

#Create the acess object
$know["search_news"] = SearchNews.new
