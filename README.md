This is just any words about the structure
	
	The requirements
		# Redis
		# MongoDB

	How make work
		# ruby hipotalamo.rb

	The ideal
		# TERMINAL, to get commands and call actions
		# ACTIONS, that do the job. Like a man, have arms, eyes, and anything that do a specif or a combined work.
		# BRAIN, this interpret the human interact, and think about the best way to call the terminal to see the job already.
	The action Structure
		# TheActionFolder
		  & ActionClass (rb)
		  & ActionDescription (yml)

	Details:
		TERMINAL: This, works like a unix terminal. Get commands, check if this commands are valid commands, and call the right action. He can concat actions (command one CONNECT command two), or handle with disconnecteds commands like (command one AND command two).

		ACTIONS: Actions are the tools that the system can use, a few actions make part of the system functions, like the memory, and the system availables actions informations. All action need follow a structure (IMPORTANT), be a ruby class,
		create a object and save in global array $know (like this: $know["search_news"] = SearchNews.new), have help method that explain the action details, have a interpreter method that handle the params. Example that get wikipedia resume:
			
		----------------------------------------------------------------------------------
		load './fundamental/memory.rb'

		class Wiki

		  def initialize
		    @memory     = Memory.new('brainMemory')
		    exist = @memory.remember('knowledge', {:know => 'wiki' } )
		    if exist == {}
		      @memory.burn('knowledge',{:know => 'wiki', :numMethods => 1})
		    end

		  end

		  def interpreter params, client
		    p 'here', params
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
		    language = 'pt'
		    params.each do |param|
		      if param.include? 'language'
		        language = param.split(":")[1]
		        p language
		        params.delete(param)
		      end
		    end
		    p params
		    p '999'
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
		    true
		  end
		    
		end

		#Create the acess object
		$know["wiki"] = Wiki.new
		----------------------------------------------------------------------------------
		BRAIN: Come soon








