load './arm/memory.rb'
require 'Hpricot'
require 'json'
require 'rest-client'

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


  def bbc_brasil(theme = nil, client)
    docReturn = {}
    urlBase = 'http://www.bbc.co.uk/portuguese/'

    p 'a'
    p 'theme', theme
    p 'chegou aqui'

    case theme[0]
    when 'brasil' || 'Brasil'
      urlPart = 'topicos/brasil'
    when 'internacional' || 'Internacional'
      urlPart = 'topicos/internacional'
    when 'ciencia' || 'tecnologia' || 'Ciencia' || 'Tecnologia'
      urlPart = 'topicos/ciencia_e_tecnologia'
    when 'economia' || 'Economia'
      urlPart = 'topicos/economia'
    when 'saude' || 'Saude'
      urlPart = 'topicos/saude'
    when 'social' || 'Social'
      urlPart = 'topicos/salasocial'
    end

    #Do the request
    begin
      file = RestClient.get urlBase + urlPart
    rescue
      docReturn = 'Fail on communication with bbc'
      $acessSense.speak('console',docReturn)
      return docReturn
    end




    begin
      #Process text
      doc  = Hpricot(file)
      #Get all elements on notice
      newsTable = doc.search('.teaser')
      i = 0
      while i != 10
            noticeTitleExtract  = newsTable.search('.ts-144x81').search('.link')[i]
            noticeBodyExtract   = newsTable.search('.ts-144x81').search('.summary')[i]
            noticeLink          = "<a target='_blank' href='http://www.bbc.co.uk#{noticeTitleExtract.search('/a')[0].attributes['href']}'> here </a>"
            noticeTitle         = noticeTitleExtract.search('').text
            noticeBody          = noticeBodyExtract.search('').text


            docReturn['title' +  i.to_s] = noticeTitle
            docReturn['link'  +  i.to_s] = noticeLink
            docReturn['body'  +  i.to_s] = noticeBody

            i = i + 1
      end

      p 'docReturn', docReturn

      $acessSense.speak('console',docReturn)
    rescue
      docReturn = 'Problem in colection of notices'
      $acessSense.speak('console',docReturn)
    end

    return docReturn

  end

end

#Create the acess object
$know["search_news"] = SearchNews.new
