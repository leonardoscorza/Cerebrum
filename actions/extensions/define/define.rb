require 'rest-client'


class Define < BaseModel
  def interpreter params, client
    if params != []
        self.search params
    end
    true
  end

  #TODO: Related topics
  def search params
    results = RestClient::Request.execute(:method => :get, :url => "https://duckduckgo-duckduckgo-zero-click-info.p.mashape.com/?callback=process_duckduckgo&format=json&no_html=1&no_redirect=1&q=#{params.join(' ')}&skip_disambig=1", :headers => {"X-Mashape-Key" => self.configurations['MashapeKey']})
    partial = JSON.parse((results.sub! 'process_duckduckgo(', '').sub! ');', '')
    if not partial['AbstractText'].empty?
    	results = "#{partial['AbstractText']} --- <a target='_blank' href=#{partial['AbstractURL']}>Link</a><br><img style='width:300px;' src=#{partial['Image']}>"
    else
    	results = "I'dont know define this, please try other word(s)"
    end
    response('console', results)
  end
end
Define.new __dir__
