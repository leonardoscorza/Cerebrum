# require 'mail'

class Mail < BaseModel

  def initialize
    $memory.save_know ({:know => 'mail', :numMethods => 1})
   	$memory.burn('mail',{:mail => 'a@a.com', :password => '1234'})
  end

  def interpreter params, client
    params.each do |param|
	   	if param.include? 'read'
	        params.delete(param)
	      	type = 'read'
	    end

	    if type == 'read'
	    	self.read_last
	    end
	  end
  end

  def read_last
  	byebug
  	Mail.defaults do
	  retriever_method :pop3, :address    => "pop.gmail.com",
	                          :port       => 995,
	                          :user_name  => 'mfs.flavia@gmail.com',
	                          :password   => 'Ff61212291',
	                          :enable_ssl => true
	end
	p Mail.all
  end

  # def send from_mail, to_mail, subject_mail, body_mail, 
  # 	p 
  # end
end

#Create the acess object
$know["mail"] = Mail.new
