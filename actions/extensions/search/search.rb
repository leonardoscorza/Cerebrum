require 'rest-client'

class Search < BaseModel

  def interpreter params, client
    if params != []
        self.search params
    end
    true
  end

  def search params
    results = RestClient::Request.execute(:method => :get, :url => "https://duckduckgo-duckduckgo-zero-click-info.p.mashape.com/?callback=process_duckduckgo&format=json&no_html=1&no_redirect=1&q=#{params.join(' ')}&skip_disambig=1", :headers => {"X-Mashape-Key" => self.configurations['MashapeKey'],
      "Accept" => "application/json"})
    p results
    response('console', results)
  end

end

#Create the acess object
Search.new __dir__
