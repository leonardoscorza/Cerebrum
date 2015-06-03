require 'tzinfo'

class Hour < BaseModel
	def interpreter(params, client)
    	if not params.empty?
    		get_hour params
    	end
  	end

  	def get_hour params ,client=nil
  		continente = params.shift.capitalize
  		capital = params.map {|v| v.capitalize}.join('_')
  		tz = TZInfo::Timezone.get("#{continente}/#{capital}")
  		response('console', tz.now)
  	end
end
Hour.new __dir__
